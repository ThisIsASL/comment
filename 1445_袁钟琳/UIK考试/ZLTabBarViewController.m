//
//  ZLTabBarViewController.m
//  爱限免-框架
//
//  Created by Catherine on 15/3/10.
//  Copyright (c) 2015年 Catherine. All rights reserved.
//

#import "ZLTabBarViewController.h"

@interface ZLTabBarViewController ()

@end

@implementation ZLTabBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //把系统的tabbar隐藏
//    self.tabBar.hidden = YES;
    // Do any additional setup after loading the view.
}

- (UIViewController *)controllerWithString:(NSString *)controller title:(NSString *)title andImage:(NSString *)imageName
{
    //1.得到这个对象的类
    Class viewController = NSClassFromString(controller);//viewController就是controller的类
    
    //2.得到对象(多态,父类的指针指向子类的对象)
    UIViewController *con = [[viewController alloc] init];//等号右边是子类,左边是父类指针
    
    //直接给视图控制器设置标题即可
    con.title = title;//包含con.tabBarItem.title con.navigationItem.title
    
    con.tabBarItem.image = [UIImage imageNamed:imageName];
    
    //3.放到导航控制器上
    UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:con];
    
//    nav.tabBarItem.image = [UIImage imageNamed:imageName];
//    nav.title = title;
    
    //4.将导航控制器放入标签栏控制器
    NSMutableArray *tempArr = [NSMutableArray arrayWithArray:self.viewControllers];
    
    [tempArr addObject:nav];
    
    self.viewControllers = tempArr;
    
    //5.将当前的视图控制器返回
    return con;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
