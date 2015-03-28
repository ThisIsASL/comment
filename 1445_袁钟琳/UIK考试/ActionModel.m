//
//  ActionModel.m
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import "ActionModel.h"

@implementation ActionModel

+ (ActionModel *)modelWithDic:(NSDictionary *)dic
{
    return [[ActionModel alloc] initWithDic:dic];
}

- (id)initWithDic:(NSDictionary *)dic
{
    if (self = [super init]) {
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

@end
