//
//  NewsCell.m
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "NewsCell.h"
#import "NewsModel.h"

@implementation NewsCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        CGFloat gap = 10;
        //题目
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(gap, gap, self.frame.size.width-gap, 30)];
        _titleLabel.font = [UIFont boldSystemFontOfSize:18];
        [self.contentView addSubview:_titleLabel];
        
        //内容
        _memoLabel = [[UILabel alloc] initWithFrame:CGRectMake(gap, CGRectGetMaxY(_titleLabel.frame), self.frame.size.width-gap, 40)];
        _memoLabel.numberOfLines = 0 ;
        _memoLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_memoLabel];
        
        //时间
        _dateLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.frame.size.width-80, CGRectGetMaxY(_memoLabel.frame), 100, 20)];
        _dateLabel.font = [UIFont systemFontOfSize:12];
        [self.contentView addSubview:_dateLabel];
        
        //图片
        
        
        

        
    }
    return self;
}

+(NewsCell *)cellWithTableView:(UITableView *)tableView {
    
    static NSString *ident = @"cell";
    
    NewsCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (!cell) {
        
        cell = [[NewsCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
        
    }
    return cell;
}

-(void)setMyModel:(NewsModel *)myModel
{
    _myModel = myModel;
    
    
    _titleLabel.text = myModel.newstitle;
    
    _memoLabel.text = myModel.newsmemo;
    
    _dateLabel.text = myModel.newstime;
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
