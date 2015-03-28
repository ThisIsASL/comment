//
//  ActionModel.h
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ActionModel : NSObject

@property (nonatomic, copy) NSString *actid;
@property (nonatomic, copy) NSString *acttitle;
@property (nonatomic, copy) NSString *actimg;
@property (nonatomic, copy) NSString *actmemo;
@property (nonatomic, copy) NSString *actpubdate;
@property (nonatomic, copy) NSString *actstarttime;
@property (nonatomic, copy) NSString *actendtime;
@property (nonatomic, copy) NSString *actstatus;
@property (nonatomic, copy) NSString *acttopeople;
@property (nonatomic, copy) NSString *actpeoplenum;
@property (nonatomic, copy) NSString *actawardset;


+ (ActionModel *)modelWithDic:(NSDictionary *)dic;

@end
