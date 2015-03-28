//
//  NewsModel.h
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject

@property (nonatomic, copy)NSString *newsid;
@property (nonatomic, copy)NSString *newstitle;//题目
@property (nonatomic, copy)NSString *newsimg;//图片
@property (nonatomic, copy)NSString *newsmemo;//详情
@property (nonatomic, copy)NSString *newstime;//时间
@property (nonatomic, copy)NSString *newschatnum;

+(NewsModel *)newsModelWithDic:(NSDictionary *)dic;

@end
