//
//  MDWTodayWeather.h
//  MiDouWeather
//
//  Created by j on 16/5/8.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWBaseWeather.h"

@interface MDWTodayWeather : MDWBaseWeather

@property (nonatomic, assign) NSInteger aqi;
@property (nonatomic, strong) NSMutableArray *index;

@end
