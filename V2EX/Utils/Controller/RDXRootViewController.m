//
//  RDXRootViewController.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/20.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXRootViewController.h"
#import "RDXLatestViewController.h"

#import "UIView+RDXGeometry.h"

static NSTimeInterval  kTransitionAnimationDuration = 0.4;
static NSString *const kTopicCellIdentifier = @"RDXTopicCellIdentifier";

@interface RDXRootViewController ()

@property (nonatomic, strong) RDXLatestViewController *latestViewController;

@property (nonatomic, assign) RDXMenuSectionType currentSection;

@end

@implementation RDXRootViewController

#pragma mark - Lift Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureViewControllers];
    [self setupNavigationItem];
    [self showSection:RDXMenuSectionTypeLatest animated:NO];
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
}

- (void)setupNavigationItem {
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 44, 44)];
    [button addTarget:self
               action:@selector(prefersStatusBarHidden)
     forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *item = [[UIBarButtonItem alloc] initWithCustomView:button];
    self.navigationItem.leftBarButtonItem = item;
}

- (BOOL)prefersStatusBarHidden {
    return NO;
}

#pragma mark - Section Transition

- (void)showSection:(RDXMenuSectionType)section animated:(BOOL)animated {
    
    // 需显示界面未改变，或 section 误传 0 直接返回
    if (section == self.currentSection || !section) {
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
//        case RDXMenuSectionTypeNone:
//            break;
        case RDXMenuSectionTypeLatest:
            viewController = self.latestViewController;
            break;
        case RDXMenuSectionTypeHot:
            viewController = self.latestViewController;
            break;
            
    }
    return viewController;
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
