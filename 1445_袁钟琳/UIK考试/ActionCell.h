//
//  ActionCell.h
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ActionModel;

@interface ActionCell : UITableViewCell

@property (nonatomic, strong) IBOutlet UIImageView *actimgLabel;
@property (nonatomic, strong) IBOutlet UILabel *acttitleLabel;
@property (nonatomic, strong) IBOutlet UILabel *DateLabel;
@property (nonatomic, strong) IBOutlet UILabel *actpeoplenumLabel;
@property (nonatomic, strong) IBOutlet UILabel *actawardsetLabel;
@property (nonatomic, strong) IBOutlet UILabel *acttopeopleLabel;
@property (nonatomic, strong) IBOutlet UIImageView *bottomLabel;

@property (strong, nonatomic) ActionModel *model;

+ (ActionCell *)cellWithTableView:(UITableView *)tableView;

@end
