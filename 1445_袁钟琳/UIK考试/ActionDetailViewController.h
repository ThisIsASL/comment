//
//  ActionDetailViewController.h
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ActionModel;

@interface ActionDetailViewController : UIViewController

//接收从主界面传过来的数据
@property(nonatomic, strong) ActionModel *model;

@end
