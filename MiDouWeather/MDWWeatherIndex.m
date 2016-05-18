//
//  MDWWeatherIndex.m
//  MiDouWeather
//
//  Created by j on 16/5/8.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWWeatherIndex.h"

@implementation MDWWeatherIndex

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super initWithDict:dict]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}

+ (instancetype)staticMethodWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    
}

@end
