//
//  NewsCell.h
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class NewsModel;

@interface NewsCell : UITableViewCell

@property(nonatomic, strong)UILabel *titleLabel;//题目
@property(nonatomic, strong)UILabel *memoLabel;//详情 缓存
@property(nonatomic, strong)UILabel *dateLabel;//时间
@property(nonatomic, strong)UIImageView *myNewsimg;

@property(nonatomic, strong)NewsModel *myModel;

+ (NewsCell *)cellWithTableView:(UITableView *)tableView;

@end
