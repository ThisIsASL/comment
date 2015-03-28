//
//  BBSCell.h
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BBSModel;

@interface BBSCell : UITableViewCell

@property (nonatomic, strong) UILabel *fname;
@property (nonatomic, strong) UILabel *lastpost;
@property (nonatomic, strong) UILabel *posts;
@property (nonatomic, strong) UILabel *todayposts;

@property (nonatomic, strong) BBSModel *myModel;

+ (BBSCell *)cellWithTableView:(UITableView *)tableView;

@end
