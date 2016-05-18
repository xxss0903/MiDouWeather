//
//  MDWBaseEntity.h
//  MiDouWeather
//
//  Created by j on 16/5/8.
//  Copyright © 2016年 j. All rights reserved.
//  基础数据模型

#import <Foundation/Foundation.h>

@interface MDWBaseEntity : NSObject

@property (nonatomic, copy) NSString *name;

- (instancetype)initWithDict:(NSDictionary *)dict;
+ (instancetype)staticMethodWithDict:(NSDictionary *)dict;

@end
