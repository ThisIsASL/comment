//
//  AppDelegate.m
//  MyChess
//
//  Created by student on 15-1-28.
//  Copyright (c) 2015年 赵旭. All rights reserved.
//

#import "AppDelegate.h"
//引入时如果是粘贴的方式，别忘记 .h
#import "ChessViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.
    //初始化窗口,定义窗口的大小等于屏幕大小
    // frame 一共包含两种元素  分别是 原点(x, y), 宽高(width, height), 相对于父view来说
    // bounds 的原点 (0, 0), 宽高, 相对于本身来说
    _window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor whiteColor];
    //一定要记住把window设置为显示状态 并且设置为主window
    // visible 是可见的意思
    [_window makeKeyAndVisible];
    
//    初始化象棋的视图控制器， ChessViewController
    ChessViewController * chessVC = [ChessViewController new];
//    初始化完成之后， 设置成 window的根视图控制器
//    如果不设置根视图控制器 会弹出提示
    _window.rootViewController = chessVC;
//    设置一个背景色，来确认是不是成功添加视图控制器到window上了
//    chessVC.view.backgroundColor = [UIColor grayColor];
    
    
    
    
    
    return YES;
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
