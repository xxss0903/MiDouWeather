//
//  MDWTools.h
//  MiDouWeather
//
//  Created by j on 16/5/7.
//  Copyright © 2016年 j. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDWTools : NSObject

#pragma mark － 天气请求

/**
 *  返回城市列表
 *
 *  @param cityName 城市名
 *  @param apikey   apikey
 *  @param success  成功返回block
 *  @param failure  失败返回block
 */
+ (void)getCityListWithCityName:(NSString *)cityName andApikey:(NSString *)apikey success:(void(^)(id responseObject))success failure:(void(^)(NSError *error))failure; // 查询可用城市列表，一个名字在其他省份

/**
 *  获取最近天气
 *
 *  @param cityName 城市名
 *  @param cityID   城市id
 *  @param apikey   apikey
 *  @param success  返回成功block
 *  @param failure  返回失败block
 */
+ (void)getRecentWeatherWithCityName:(NSString *)cityName andCityID:(NSString *)cityID andApikey:(NSString *)apikey success:(void (^)(id responseObject))success failed:(void(^)(NSError *error))failure;  // 天气查询——带七天历史和未来四天的预测

/**
 *  查询天气－城市拼音名
 *
 *  @param cityPinYin 城市拼音名
 *  @param apikey     apikey
 *  @param success    返回成功block
 *  @param failure    返回失败block
 */
+ (void)getWeatherWithCityNamePinYin:(NSString *)cityPinYin andApikey:(NSString *)apikey success:(void (^)(id responseObject))success failed:(void(^)(NSError *error))failure;    // 天气查询——根据城市拼音

/**
 *  查询天气－查询天气城市名
 *
 *  @param cityName 城市名
 *  @param apikey   apikey
 *  @param success  返回成功block
 *  @param failure  返回失败block
 */
+ (void)getWeatherWithCityName:(NSString *)cityName andApikey:(NSString *)apikey success:(void (^)(id responseObject))success failed:(void(^)(NSError *error))failure;    // 天气查询——根据城市名称

/**
 *  查询城市信息
 *
 *  @param cityName 城市名
 *  @param apikey   apikey
 *  @param success  返回成功block
 *  @param failure  返回失败block
 */
+ (void)getCityInfoListWithCityName:(NSString *)cityName andApikey:(NSString *)apikey success:(void (^)(id responseObject))success failed:(void(^)(NSError *error))failure;   // 城市信息列表

/**
 *  查询天气－城市id
 *
 *  @param cityID  城市id
 *  @param apikey  apikey
 *  @param success 返回成功block
 *  @param failure 返回失败block   
 */
+ (void)getCityWeatherWithCityID:(NSString *)cityID andApikey:(NSString *)apikey success:(void (^)(id responseObject))success failed:(void(^)(NSError *error))failure;    // 天气查询——城市代码


#pragma mark - 豆瓣fm网络请求
/**
 *  登录
 *
 *  @param userName 用户名，邮箱
 *  @param password 密码
 *  @param success  返回成功block
 *  @param failure  返回失败block
 */
+ (void)dbLoginWithUserName:(NSString *)userName andPassword:(NSString *)password success:(void(^)(id responseObject))success failed:(void(^)(NSError *error))failure;



@end
