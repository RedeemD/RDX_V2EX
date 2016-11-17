//
//  RDXRootViewController.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/20.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXRootViewController.h"
#import "RDXLatestViewController.h"
#import "RDXHotViewController.h"
#import "RDXSettingController.h"
#import "RDXMenuView.h"

#import "UIView+RDXGeometry.h"

static NSTimeInterval const kTransitionAnimationDuration = 0.4;
static NSString *const kTopicCellIdentifier = @"RDXTopicCellIdentifier";

@interface RDXRootViewController ()

@property (nonatomic, strong) UIViewController        *currentViewController;
@property (nonatomic, strong) RDXLatestViewController *latestViewController;
@property (nonatomic, strong) RDXHotViewController    *hotViewController;
@property (nonatomic, strong) RDXSettingController    *settingViewController;

@property (nonatomic, strong) UIView      *blurView;
@property (nonatomic, strong) RDXMenuView *menuView;

@property (nonatomic, assign) BOOL isMenuViewShown;
@property (nonatomic, assign) CGFloat menuViewWidth;
@property (nonatomic, assign) RDXMenuSectionType currentSection;

@end

@implementation RDXRootViewController

#pragma mark - Lift Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureViewControllers];
    [self showSection:RDXMenuSectionTypeLatest animated:NO];
    [self setupNavigationItem];
    [self setupMenuView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI init

- (void)configureViewControllers {
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _latestViewController = ({
        RDXLatestViewController *latestVC = [[RDXLatestViewController alloc] init];
//        latestVC.view.backgroundColor = [UIColor orangeColor];
        latestVC;
    });
    
    _hotViewController = ({
        RDXHotViewController *hotVC = [[RDXHotViewController alloc] init];
        hotVC;
    });
    
    _settingViewController = ({
        RDXSettingController *settingVC = [[RDXSettingController alloc] init];
        settingVC;
    });
    
}

- (void)setupNavigationItem {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
//    [button setBackgroundImage:[UIImage imageNamed:@"navi_menu"]
    [button setImage:[UIImage imageNamed:@"navi_menu"]
                      forState:UIControlStateNormal];
    [button addTarget:self
               action:@selector(menuButtonClicked)
     forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;
}

- (void)setupMenuView {
    _menuView = ({
        RDXMenuView *view = [[RDXMenuView alloc] init];
        @weakify(self);
        view.cellDidSelectedHandler = ^(NSInteger index) {
            @strongify(self);
            [self showSection:index animated:YES];
            [self hideMenuView];
        };
        view;
    });
    _menuViewWidth = RDXScreenWidth * 0.65;
    
    _blurView = ({
        UIView *view = [[UIView alloc] init];
        view.backgroundColor = [UIColor colorWithWhite:0.3 alpha:0.5];
        view.hidden = YES;
        view.alpha = 0;
        
        UITapGestureRecognizer *tap =
          [[UITapGestureRecognizer alloc] initWithTarget:self
                                                  action:@selector(hideMenuView)];
        [view addGestureRecognizer:tap];
        view;
    });
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

#pragma mark - Section Transition

- (void)showSection:(RDXMenuSectionType)section animated:(BOOL)animated {
    
    // 需显示界面未改变，或 section 误传 0 直接返回
    if (section == _currentSection || !section) {
        return;
    }
    
    UIViewController *viewController = [self viewControllerForSection:section];
    UIViewController *currentVC      = [self viewControllerForSection:_currentSection];
    
    // 调整子视图控制器 view 的位置
    viewController.view.y = 64;
    viewController.view.height = RDXScreenHeight - 64;
    
    [self addChildViewController:viewController];
    
    if (!currentVC) {
        [self.view addSubview:viewController.view];
        [viewController didMoveToParentViewController:self];
        self.currentSection = section;
        self.currentViewController = viewController;
        self.title = viewController.title;
    }
    else {
        
        @weakify(self);
        void (^completionHandler)(BOOL) = ^(BOOL finished) {
            @strongify(self);
            if (finished) {
                [viewController didMoveToParentViewController:self];
                [currentVC willMoveToParentViewController:nil];
                [currentVC removeFromParentViewController];
                self.currentSection = section;
                self.currentViewController = viewController;
                self.title = viewController.title;
            }
            else {
                [viewController willMoveToParentViewController:nil];
                [viewController removeFromParentViewController];
            }
        };
        
        NSTimeInterval animationDuration = animated ? kTransitionAnimationDuration : 0;
        [self transitionFromViewController:currentVC
                          toViewController:viewController
                                  duration:animationDuration
                                   options:UIViewAnimationOptionCurveEaseInOut
                                animations:nil
                                completion:completionHandler];
    }
//    [viewController didMoveToParentViewController:self];
}

- (UIViewController *)viewControllerForSection:(RDXMenuSectionType)sectionType {
    UIViewController *viewController;
    switch (sectionType) {
        case RDXMenuSectionTypeLatest:
            viewController = _latestViewController;
            break;
        case RDXMenuSectionTypeHot:
            viewController = _hotViewController;
            break;
        case RDXMenuSectionTypeNode:
            viewController = _hotViewController;
            break;
        case RDXMenuSectionTypeFavor:
            viewController = _hotViewController;
            break;
        case RDXMenuSectionTypeProfile:
            viewController = _hotViewController;
            break;
        case RDXMenuSectionTypeSetting:
            viewController = _settingViewController;
            break;
    }
    return viewController;
}

//- (UIViewController *)currentViewController {
//    if (_currentViewController) {
//        return _currentViewController;
//    }
//    return [self viewControllerForSection:_currentSection];
//}

#pragma mark - Menu Event Handle

- (void)menuButtonClicked {
    
    // RDXRootViewController viewDidLoad 方法执行时，[UIAppliacaiton sharedApplication].keyWindow 可能为空
    // 若想在根视图添加子视图，目前处理办法是在用户初次点击时初始化，操作不费时且能保证安全
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        UIApplication *app = [UIApplication sharedApplication];
        [app.keyWindow addSubview:_blurView];
        [_blurView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.offset(0);
        }];
        [app.keyWindow addSubview:_menuView];
        [_menuView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.offset(0);
            make.left.offset(- _menuViewWidth);
            make.width.mas_equalTo(_menuViewWidth);
        }];
        [_menuView.superview layoutIfNeeded];
    });
    
    if (_isMenuViewShown) {
        return;
    }
    
    // 处理点击事件
    _blurView.hidden = NO;
    [_menuView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.offset(0);
    }];
    [UIView animateWithDuration:kTransitionAnimationDuration
                     animations:^{
                         [_menuView.superview layoutIfNeeded];
                         _blurView.alpha = 0.5;
                     }
                     completion:^(BOOL finished) {
                         _isMenuViewShown = YES;
                     }];
}

- (void)hideMenuView {
//    _blurView.hidden = YES;
    [_menuView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.offset(- _menuViewWidth);
    }];
    [UIView animateWithDuration:kTransitionAnimationDuration
                     animations:^{
                         [_menuView.superview layoutIfNeeded];
                         _blurView.alpha = 0;
                     }
                     completion:^(BOOL finished) {
                         _blurView.hidden = YES;
                         _isMenuViewShown = NO;
                     }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
