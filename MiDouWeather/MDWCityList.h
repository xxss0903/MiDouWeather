//
//  MDWCityList.h
//  MiDouWeather
//
//  Created by j on 16/5/8.
//  Copyright © 2016年 j. All rights reserved.
//  城市可用列表

#import "MDWBaseEntity.h"

#pragma mark - 可用城市列表
@interface MDWCityList : MDWBaseEntity

@property (nonatomic, strong) NSMutableArray *cities;   //

@end

#pragma mark - 城市区域信息

@interface MDWCityDistrict : MDWBaseEntity

@property (nonatomic, copy) NSString *area_id;  // 城市代码
@property (nonatomic, copy) NSString *district_cn;  // 市
@property (nonatomic, copy) NSString *name_cn;  // 区、县
@property (nonatomic, copy) NSString *name_en;  // 城市拼音
@property (nonatomic, copy) NSString *province_cn;  // 省

@end

#pragma mark - 城市详细信息

@interface MDWCityDetail : MDWBaseEntity

@property (nonatomic, copy) NSString *WD;   // 风向
@property (nonatomic, copy) NSString *WS;   // 风力
@property (nonatomic, copy) NSString *altitude; //海拔
@property (nonatomic, copy) NSString *city; //城市
@property (nonatomic, copy) NSString *citycode; //城市编码
@property (nonatomic, copy) NSString *date; //日期
@property (nonatomic, assign) float h_tmp;  //最高气温
@property (nonatomic, assign) float l_tmp;  //最低气温
@property (nonatomic, copy) NSString *latitude; //维度
@property (nonatomic, copy) NSString *longitude;    //经度
@property (nonatomic, copy) NSString *pinyin;   //城市拼音
@property (nonatomic, copy) NSString *postCode; //邮编
@property (nonatomic, copy) NSString *sunrise;  //日出时间
@property (nonatomic, copy) NSString *sunset;   //日落时间
@property (nonatomic, copy) NSString *temp; //气温
@property (nonatomic, copy) NSString *time; //日期
@property (nonatomic, copy) NSString *weather;  //天气情况

@end

#pragma mark - 城市信息
@interface MDWCityInfo : MDWBaseEntity

@property (nonatomic, copy) NSString *cityCode;
@property (nonatomic, copy) NSString *cityName;
@property (nonatomic, copy) NSString *provinceName;
@property (nonatomic, copy) NSString *telAreaCode;
@property (nonatomic, copy) NSString *zipCode;

@end





