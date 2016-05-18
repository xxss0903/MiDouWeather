//
//  MDWTools.m
//  MiDouWeather
//
//  Created by j on 16/5/7.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWTools.h"
#import <AFNetworking.h>

@interface MDWTools ()

@property (nonatomic, strong) NSString *apikey;

@end

static AFHTTPSessionManager *_manager;

@implementation MDWTools

#pragma mark 通用网络请求
- (AFHTTPSessionManager *)sharedHttpSessionManagerWithApiKey:(NSString *)apikey andParam:(NSDictionary *)param
{
    __block AFHTTPSessionManager *manager;

    manager = [AFHTTPSessionManager manager];
    if (apikey) {
        [manager.requestSerializer setValue:apikey forHTTPHeaderField:@"apikey"];
    }
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];

    return manager;
}

- (NSDictionary *)getMethodWithUrlStr:(NSString *)urlStr andParams:(NSMutableDictionary *)params andApikey:(NSString *)apikey
{
    NSLog(@"get method ...");
    __block NSDictionary *responseJson = [[NSDictionary alloc] init];
    
    AFHTTPSessionManager *manager = [self sharedHttpSessionManagerWithApiKey:apikey andParam:params];
    
    [manager GET:urlStr parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        responseJson = [NSJSONSerialization JSONObjectWithData:responseObject
                                                       options:0
                                                         error:nil];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
    }];
    
    return responseJson;
}

- (void)getMethodWithUrlStr:(NSString *)urlStr andParams:(NSMutableDictionary *)params andApikey:(NSString *)apikey andSuccess:(void (^)(id _Nullable responseObject))success failed:(void (^)(NSError *error))failure
{
    __block NSDictionary *responseJson = [[NSDictionary alloc] init];
    
    AFHTTPSessionManager *manager = [self sharedHttpSessionManagerWithApiKey:apikey andParam:params];
    
    [manager GET:urlStr parameters:params progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        responseJson = [NSJSONSerialization JSONObjectWithData:responseObject
                                                       options:0
                                                         error:nil];
        success(responseJson);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
        NSLog(@"error = %@", error);
    }];
}

- (void)postMethodWithUrlStr:(NSString *)urlStr andParams:(NSMutableDictionary *)params andApikey:(NSString *)apikey andSuccess:(void (^)(id _Nullable responseObject))success failed:(void (^)(NSError *error))failure
{
    __block NSDictionary *responseJson = [[NSDictionary alloc] init];
    
    AFHTTPSessionManager *manager = [self sharedHttpSessionManagerWithApiKey:apikey andParam:params];
    
    [manager POST:urlStr parameters:params progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        responseJson = [NSJSONSerialization JSONObjectWithData:responseObject
                                                       options:0
                                                         error:nil];
        success(responseJson);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error = %@", error);
    }];
}


#pragma mark - 天气数据请求
+ (void)getCityListWithCityName:(NSString *)cityName andApikey:(NSString *)apikey success:(void (^)(id))success failure:(void (^)(NSError *))failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:cityName forKey:@"cityname"];
    
    [[self alloc] getMethodWithUrlStr:kCityList andParams:params andApikey:apikey andSuccess:^(id  _Nullable responseObject) {
        success(responseObject);
    } failed:^(NSError *error) {
        failure(error);
    }];
}


+ (void)getRecentWeatherWithCityName:(NSString *)cityName andCityID:(NSString *)cityID andApikey:(NSString *)apikey success:(void (^)(id))success failed:(void (^)(NSError *))failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:cityName forKey:@"cityname"];
    [params setValue:cityID forKey:@"cityid"];
    
    [[self alloc] getMethodWithUrlStr:kRecentWeathers andParams:params andApikey:kApiKey andSuccess:^(id  _Nullable responseObject) {
        success(responseObject);
    } failed:^(NSError *error) {
        failure(error);
    }];
}

+ (void)getWeatherWithCityNamePinYin:(NSString *)cityPinYin andApikey:(NSString *)apikey success:(void (^)(id))success failed:(void (^)(NSError *))failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:cityPinYin forKey:@"citypinyin"];
    
    [[self alloc] getMethodWithUrlStr:kWeather andParams:params andApikey:apikey andSuccess:^(id  _Nullable responseObject) {
        success(responseObject);
    } failed:^(NSError *error) {
        failure(error);
    }];
}

+ (void)getWeatherWithCityName:(NSString *)cityName andApikey:(NSString *)apikey success:(void (^)(id))success failed:(void (^)(NSError *))failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:cityName forKey:@"cityname"];
    
    [[self alloc] getMethodWithUrlStr:kWeather andParams:params andApikey:apikey andSuccess:^(id  _Nullable responseObject) {
        success(responseObject);
    } failed:^(NSError *error) {
        failure(error);
    }];
}

+ (void)getCityInfoListWithCityName:(NSString *)cityName andApikey:(NSString *)apikey success:(void (^)(id))success failed:(void (^)(NSError *))failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:cityName forKey:@"cityname"];
    
    [[self alloc] getMethodWithUrlStr:kCityInfo andParams:params andApikey:apikey andSuccess:^(id  _Nullable responseObject) {
        success(responseObject);
    } failed:^(NSError *error) {
        failure(error);
    }];
}

+ (void)getCityWeatherWithCityID:(NSString *)cityID andApikey:(NSString *)apikey success:(void (^)(id))success failed:(void (^)(NSError *))failure
{
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    [params setValue:cityID forKey:@"cityid"];
    
    [[self alloc] getMethodWithUrlStr:kCityId andParams:params andApikey:apikey andSuccess:^(id  _Nullable responseObject) {
        success(responseObject);
    } failed:^(NSError *error) {
        failure(error);
    }];
}

#pragma mark - 豆瓣请求
+ (void)dbLoginWithUserName:(NSString *)userName andPassword:(NSString *)password success:(void (^)(id))success failed:(void (^)(NSError *))failure
{
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    
    [params setValue:userName forKey:@"email"];
    [params setValue:password forKey:@"password"];
    [params setValue:@"radio_android" forKey:@"app_name"];
    [params setValue:@"100" forKey:@"version"];
    
    [[self alloc] postMethodWithUrlStr:kDBLogin andParams:params andApikey:nil andSuccess:^(id  _Nullable responseObject) {
        NSLog(@"responseObject = %@", responseObject);
    } failed:^(NSError *error) {
        NSLog(@"erro = %@", error.localizedDescription);
    }];
}



@end
