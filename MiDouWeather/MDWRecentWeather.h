//
//  MDWRecentWeather.h
//  MiDouWeather
//
//  Created by j on 16/5/8.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWBaseWeather.h"

@class MDWTodayWeather;

@interface MDWRecentWeather : MDWBaseWeather

@property (nonatomic, copy) NSString *city;
@property (nonatomic, copy) NSString *cityid;
@property (nonatomic, strong) NSMutableArray *forecast;
@property (nonatomic, strong) NSMutableArray *history;
@property (nonatomic, strong) MDWTodayWeather *today;

@end
