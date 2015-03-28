//
//  ZLTabBarViewController.h
//  爱限免-框架
//
//  Created by Catherine on 15/3/10.
//  Copyright (c) 2015年 Catherine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZLTabBarViewController : UITabBarController

- (UIViewController *)controllerWithString:(NSString *)controller title:(NSString *)title andImage:(NSString *)imageName;//返回值用UIViewController是父类,是多态

@end
