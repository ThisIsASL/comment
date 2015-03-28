//
//  DetailViewController.h
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "BBSViewController.h"
@class BBSModel;

@interface DetailViewController : UIViewController

//接收从主界面传过来的数据
@property(nonatomic, strong) BBSModel *BBSModel;

@property(nonatomic, copy) NSString *proTitle;

//接收相应的接口地址
@property (nonatomic, copy) NSString *urlString;

@end
