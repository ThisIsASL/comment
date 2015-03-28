//
//  ActionCell.m
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ActionCell.h"
#import "UIKit+AFNetworking.h"
#import "ActionModel.h"
#import "AFNetworking.h"

@implementation ActionCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
    }
    return self;
}

+ (ActionCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *ident = @"cell";
    
    ActionCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (!cell) {
        
        cell = [[[NSBundle mainBundle] loadNibNamed:@"ActionCell" owner:self options:nil] firstObject];
    }
    return cell;
}

- (void)setModel:(ActionModel *)model
{
    _model = model;
    
    [_actimgLabel setImageWithURL:[NSURL URLWithString:model.actimg]];
    
    _acttitleLabel.text = model.acttitle;
    
    _DateLabel.text = [NSString stringWithFormat:@"活动时间:%@ - %@", model.actpubdate, model.actstarttime];
    
    _acttopeopleLabel.text = [NSString stringWithFormat:@"参与对象:%@", model.acttopeople];
    
    _actpeoplenumLabel.text = [NSString stringWithFormat:@"参与人数:%@", model.actpeoplenum];
    
    _actawardsetLabel.text = [NSString stringWithFormat:@"奖品设置:%@", model.actawardset];

}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
