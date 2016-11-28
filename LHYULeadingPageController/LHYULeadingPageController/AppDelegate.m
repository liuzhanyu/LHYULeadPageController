//
//  AppDelegate.m
//  LHYULeadingPageController
//
//  Created by 小宇 on 2016/11/28.
//  Copyright © 2016年 刘占宇. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "LHYULeadingPageController.h"

@interface AppDelegate ()
@property (nonatomic,strong)NSArray *pagearray;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    _pagearray = [NSArray arrayWithObjects:@"login",@"login",@"login",nil];
    // 如果是第一次安装打开App --- 显示引导页面
    LHYULeadingPageController *leadController = [[LHYULeadingPageController alloc] initWithPagesArray:_pagearray finishHandler:^(UIButton *finishBtn) {
        self.window.rootViewController = [ViewController new];
    }];
    
    // 自定义属性
    leadController.pageControl.pageIndicatorTintColor = [UIColor yellowColor];
    leadController.pageControl.currentPageIndicatorTintColor = [UIColor purpleColor];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    self.window.rootViewController = leadController;
    return YES;
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
