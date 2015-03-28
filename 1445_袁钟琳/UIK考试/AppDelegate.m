//
//  AppDelegate.m
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "AppDelegate.h"
#import "ZLTabBarViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    
    [self getTabBarController];
    
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)getTabBarController
{
    ZLTabBarViewController *tabBarController = [[ZLTabBarViewController alloc] init];
    
    tabBarController.tabBar.backgroundImage = [UIImage imageNamed:@"123rg"];
    
    tabBarController.tabBar.translucent = NO;
    
    [tabBarController controllerWithString:@"NewsViewController" title:@"新闻" andImage:@"新闻"];
    [tabBarController controllerWithString:@"BBSViewController" title:@"论坛" andImage:@"论坛"];
    [tabBarController controllerWithString:@"ActionViewController" title:@"活动" andImage:@"活动"];
    [tabBarController controllerWithString:@"HelpViewController" title:@"助理" andImage:@"助理"];
    [tabBarController controllerWithString:@"SetViewController" title:@"设置" andImage:@"设置"];
    self.window.rootViewController = tabBarController;
}


- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
