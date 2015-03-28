//
//  ScrollViewModel.m
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ScrollViewModel.h"

@implementation ScrollViewModel

+ (ScrollViewModel *)modelWithDic:(NSDictionary *)dic
{
    return [[ScrollViewModel alloc] initWithDic:dic];
}

- (id)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
