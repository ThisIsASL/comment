//
//  BBSCell.m
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "BBSCell.h"
#import "BBSModel.h"

@implementation BBSCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        // Initialization code
        
        [self label];
        
        UIButton *nextButton = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_posts.frame) - 10, 40, 15, 15)];
        
        [nextButton setBackgroundImage:[UIImage imageNamed:@"未读"] forState:UIControlStateNormal];
        
        [self.contentView addSubview:nextButton];
        
    }
    return self;
}

- (void)label
{
    CGFloat gap = 10;
    
    //标题
    _lastpost = [[UILabel alloc] initWithFrame:CGRectMake(gap, gap, 260, 40)];
    
    _lastpost.font = [UIFont boldSystemFontOfSize:18];
    
    [self.contentView addSubview:_lastpost];
    
    //作者
    _fname = [[UILabel alloc] initWithFrame:CGRectMake(gap, CGRectGetMaxY(_lastpost.frame), 100, 40)];
    
    _fname.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_fname];
    
    //
    _todayposts = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_fname.frame), CGRectGetMaxY(_lastpost.frame), 60, 40)];
    
    _todayposts.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_todayposts];
    
    //
    _posts = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(_todayposts.frame) + 30, CGRectGetMaxY(_lastpost.frame), 100, 40)];
    
    _posts.font = [UIFont systemFontOfSize:16];
    
    [self.contentView addSubview:_posts];
}

+ (BBSCell *)cellWithTableView:(UITableView *)tableView
{
    static NSString *ident = @"cell";
    
    BBSCell *cell = [tableView dequeueReusableCellWithIdentifier:ident];
    
    if (!cell) {
        
        cell = [[BBSCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ident];
    }
    return cell;
}

- (void)setMyModel:(BBSModel *)myModel
{
    _myModel = myModel;
    
    _fname.text = myModel.fname;
    
    _posts.text = [NSString stringWithFormat:@"post: %@",myModel.posts];
    
    _lastpost.text = myModel.lastpost;
    
    _todayposts.text = [NSString stringWithFormat:@"today: %@",myModel.todayposts];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
