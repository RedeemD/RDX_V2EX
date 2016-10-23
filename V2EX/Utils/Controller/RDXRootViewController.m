//
//  RDXRootViewController.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/20.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "RDXRootViewController.h"
#import "RDXLatestViewController.h"

static const NSTimeInterval kTransitionAnimationDuration = 0.4;

@interface RDXRootViewController ()

@property (nonatomic, strong) RDXLatestViewController *topicListController;

@property (nonatomic, assign) RDXMenuSectionType currentSection;

@end

@implementation RDXRootViewController

#pragma mark - Lift Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self configureViewControllers];
    
    [self showSection:RDXMenuSectionTypeLatest animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UI init

- (void)configureViewControllers {
    
    _topicListController = ({
        RDXLatestViewController *latestVC = [[RDXLatestViewController alloc] init];
        latestVC.view.backgroundColor = [UIColor orangeColor];
        latestVC;
    });
}

#pragma mark - Section Transition

- (void)showSection:(RDXMenuSectionType)section animated:(BOOL)animated {
    
    // 需显示界面未改变，或 section 误传 0 直接返回
    if (section == self.currentSection || !section) {
        return;
    }
    
    UIViewController *viewController = [self viewControllerForSection:section];
    UIViewController *currentVC      = [self viewControllerForSection:_currentSection];
    [self addChildViewController:viewController];
    
    if (!currentVC) {
        [self.view addSubview:viewController.view];
        [viewController didMoveToParentViewController:self];
        self.currentSection = section;
    }
    else {
        
        __weak typeof(self) weakSelf = self;
        void (^completionHandler)(BOOL) = ^(BOOL finished) {
            __strong typeof(weakSelf) strongSelf = weakSelf;
            if (finished) {
                [currentVC willMoveToParentViewController:nil];
                [currentVC removeFromParentViewController];
                strongSelf.currentSection = section;
            }
            else {
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
    
    [viewController didMoveToParentViewController:self];
    
    
    
}

- (UIViewController *)viewControllerForSection:(RDXMenuSectionType)sectionType {
    UIViewController *viewController;
    switch (sectionType) {
//        case RDXMenuSectionTypeNone:
//            break;
        case RDXMenuSectionTypeLatest:
            viewController = self.topicListController;
            break;
        case RDXMenuSectionTypeHot:
            viewController = self.topicListController;
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
