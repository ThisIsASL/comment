//
//  ScrollViewModel.h
//  UIK考试
//
//  Created by qianfeng on 15-3-16.
//  Copyright (c) 2015年 qianfeng. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScrollViewModel : NSObject

@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, copy) NSString *imgtitle;
@property (nonatomic, copy) NSString *imgurl;

+ (ScrollViewModel *)modelWithDic:(NSDictionary *)dic;

@end
