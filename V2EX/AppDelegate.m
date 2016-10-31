//
//  AppDelegate.m
//  V2EX
//
//  Created by Redeem_D on 2016/10/17.
//  Copyright © 2016年 Redeem_D. All rights reserved.
//

#import "AppDelegate.h"
#import "RDXRootViewController.h"
#import <AFNetworkReachabilityManager.h>

#import "RDXMenuView.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 网络状态监视器
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    
    // 设置网络缓存
    NSURLCache *URLCache = [[NSURLCache alloc] initWithMemoryCapacity:5 * 1024 * 1024
                                                         diskCapacity:10 * 1024 *1024
                                                             diskPath:nil];
    [NSURLCache setSharedURLCache:URLCache];
    
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor clearColor];
#warning window.rootViewController not right
    RDXRootViewController *rootVC = [[RDXRootViewController alloc] init];
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:rootVC];
    rootVC.view.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = nav;
//    nav.preferredStatusBarStyle = UIStatusBarStyleDefault;
    [self.window makeKeyAndVisible];
    
#warning test
//    RDXMenuView *menuView = [[RDXMenuView alloc] initWithFrame:CGRectMake(0, 0, 200, 667)];
//    [rootVC.view addSubview:menuView];
    
//    RDXNodeNameLabel *nodeLabel = [[RDXNodeNameLabel alloc] initWithText:@"酷工作"];
//    nodeLabel.center = CGPointMake(200, 200);
//    [rootVC.view addSubview:nodeLabel];
    
    return YES;
}

- (void)setupRootViewController {
    
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
