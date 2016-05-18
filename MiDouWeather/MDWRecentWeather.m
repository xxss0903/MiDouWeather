//
//  MDWRecentWeather.m
//  MiDouWeather
//
//  Created by j on 16/5/8.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWRecentWeather.h"
#import "MDWForecastWeather.h"
#import "MDWHistoryWeather.h"
#import "MDWTodayWeather.h"

@implementation MDWRecentWeather

- (instancetype)initWithDict:(NSDictionary *)dict
{
    if (self = [super initWithDict:dict]) {
        NSDictionary *retData = [dict objectForKey:@"retData"];
        self.forecast = [NSMutableArray array];
        self.history = [NSMutableArray array];
        self.city = [retData valueForKey:@"city"];
        self.cityid = [retData valueForKey:@"cityid"];

        
        for (NSDictionary *tempDict in [retData objectForKey:@"forecast"]) {
            MDWForecastWeather *forecastWeather = [MDWForecastWeather staticMethodWithDict:tempDict];
            [self.forecast addObject:forecastWeather];
        }

        for (NSDictionary *tempDict in [retData objectForKey:@"history"]) {
            MDWHistoryWeather *historyWeather = [MDWHistoryWeather staticMethodWithDict:tempDict];
            [self.history addObject:historyWeather];
        }

        MDWTodayWeather *todayWeather = [MDWTodayWeather staticMethodWithDict:[retData objectForKey:@"today"]];
            self.today = todayWeather;
        }
    return self;
}


+ (instancetype)staticMethodWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
//    if ([key isEqualToString:@"forecast"]) {
//        self.forecast = [NSMutableArray array];
//        for (NSDictionary *dict in value) {
//            MDWForecastWeather *forecastWeather = [MDWForecastWeather staticMethodWithDict:dict];
//            [self.forecast addObject:forecastWeather];
//        }
//    }
//    if ([key isEqualToString:@"history"]) {
//        self.history = [NSMutableArray array];
//        for (NSDictionary *dict in value) {
//            MDWHistoryWeather *historyWeather = [MDWHistoryWeather staticMethodWithDict:dict];
//            [self.history addObject:historyWeather];
//        }
//        
//    }
//    if ([key isEqualToString:@"today"]) {
//        MDWTodayWeather *todayWeather = [MDWTodayWeather staticMethodWithDict:value];
//        self.today = todayWeather;
//        
//        NSLog(@"today = %@", todayWeather);
//    }
    
}

@end
