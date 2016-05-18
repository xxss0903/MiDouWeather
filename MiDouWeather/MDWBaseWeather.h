//
//  MDWBaseWeather.h
//  MiDouWeather
//
//  Created by j on 16/5/8.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWBaseEntity.h"

@interface MDWBaseWeather : MDWBaseEntity

@property (nonatomic, copy) NSString *date;
@property (nonatomic, copy) NSString *fengli;
@property (nonatomic, copy) NSString *fengxiang;
@property (nonatomic, copy) NSString *hightemp;
@property (nonatomic, copy) NSString *lowtemp;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *week;

@end
