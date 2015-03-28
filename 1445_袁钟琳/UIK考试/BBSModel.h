//
//  BBSModel.h
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BBSModel : NSObject

@property (nonatomic, copy) NSString *fid;
@property (nonatomic, copy) NSString *fname;
@property (nonatomic, copy) NSString *lastpost;
@property (nonatomic, copy) NSString *order;
@property (nonatomic, copy) NSString *posts;
@property (nonatomic, copy) NSString *todayposts;
@property (nonatomic, copy) NSString *allowanonymous;

+ (BBSModel *)modelWithDic:(NSDictionary *)dic;

@end
