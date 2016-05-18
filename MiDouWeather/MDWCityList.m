//
//  MDWCityList.m
//  MiDouWeather
//
//  Created by j on 16/5/8.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWCityList.h"

@implementation MDWCityList

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super initWithDict:dict]) {
        NSDictionary *retData = [dict objectForKey:@"retData"];
        self.cities = [NSMutableArray array];
        
        for (NSDictionary *tempDict in retData) {
            MDWCityDistrict *city = [MDWCityDistrict staticMethodWithDict:tempDict];
            [self.cities addObject:city];
        }
    }
    return self;
}

@end


@implementation MDWCityDistrict


@end

@implementation MDWCityDetail

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super initWithDict:dict]) {
        NSDictionary *retData = [dict valueForKey:@"retData"];
        [self setValuesForKeysWithDictionary:retData];
    }
    return self;
}

@end

@implementation MDWCityInfo

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super initWithDict:dict]) {
        NSDictionary *retData = [dict valueForKey:@"retData"];
        [self setValuesForKeysWithDictionary:retData];
    }
    return self;
}

@end





