//
//  MDWWeatherIndex.h
//  MiDouWeather
//
//  Created by j on 16/5/8.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWBaseEntity.h"

@interface MDWWeatherIndex : MDWBaseEntity

@property (nonatomic, copy) NSString *code;
@property (nonatomic, copy) NSString *details;
@property (nonatomic, copy) NSString *index;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *othername;

@end
