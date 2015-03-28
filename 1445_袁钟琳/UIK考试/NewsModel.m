//
//  NewsModel.m
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "NewsModel.h"

@implementation NewsModel

+(NewsModel *)newsModelWithDic:(NSDictionary *)dic
{
    return [[NewsModel alloc] initWithDic:dic];
}

- (id)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}
@end
