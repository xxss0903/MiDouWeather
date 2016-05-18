//
//  AppDelegate.m
//  MiDouWeather
//
//  Created by j on 16/5/4.
//  Copyright © 2016年 j. All rights reserved.
//

#import "AppDelegate.h"
#import "MDWHomeVC.h"
#import <AFNetworking/AFNetworking.h>
#import "MDWTools.h"
#import "MDWTodayWeather.h"
#import "MDWRecentWeather.h"
#import "MDWCityList.h"
#import "MDWRootVC.h"
#import <objc/runtime.h>

@interface AppDelegate ()

@end

@implementation AppDelegate

- (void)testModel
{
//    // 最近天气
//    [MDWTools getRecentWeatherWithCityName:@"北京" andCityID:@"101010100" andApikey:kApiKey success:^(id responseObject) {
//        NSLog(@"请求数据成功");
//        MDWRecentWeather *recentWeather = [MDWRecentWeather staticMethodWithDict:responseObject];
//        NSLog(@"%@", recentWeather.history);
//        
//    } failed:^(NSError *error) {
//        NSLog(@"%@", error);
//    }];
    
//    // 可用城市列表
//    [MDWTools getCityListWithCityName:@"朝阳" andApikey:kApiKey success:^(id responseObject) {
//        MDWCityList *cityList = [MDWCityList staticMethodWithDict:responseObject];
//        MDWCity *city = [cityList.cities objectAtIndex:0];
//        NSLog(@"%@", city.province_cn);
//    } failure:^(NSError *error) {
//        
//    }];
    
    // 根据拼音名称查询天气
//    [MDWTools getWeatherWithCityNamePinYin:@"xiangshan" andApikey:kApiKey success:^(id responseObject) {
//        MDWCityPinYin *cityPinYin = [MDWCityPinYin staticMethodWithDict:responseObject];
//        NSLog(@"%@", cityPinYin.city);
//    } failed:^(NSError *error) {
//        NSLog(@"%@", error);
//    }];
    
    // 根据名称查询天气
//    [MDWTools getWeatherWithCityName:@"射洪" andApikey:kApiKey success:^(id responseObject) {
//        NSLog(@"%@", responseObject);
//        MDWCityDetail *cityDetail = [MDWCityDetail staticMethodWithDict:responseObject];
//        NSLog(@"%f", cityDetail.h_tmp);
//    } failed:^(NSError *error) {
//        NSLog(@"%@", error);
//    }];
    
    // 城市信息
//    [MDWTools getCityInfoListWithCityName:@"射洪" andApikey:kApiKey success:^(id responseObject) {
//        NSLog(@"%@", responseObject);
//        MDWCityInfo *cityInfo = [MDWCityInfo staticMethodWithDict:responseObject];
//        NSLog(@"%@", cityInfo.cityName);
//    } failed:^(NSError *error) {
//        NSLog(@"%@", error);
//    }];
    
//    [MDWTools getCityWeatherWithCityID:@"101270703" andApikey:kApiKey success:^(id responseObject) {
//        NSLog(@"%@", responseObject);
//        MDWCityDetail *cityDetail = [MDWCityDetail staticMethodWithDict:responseObject];
//        NSLog(@"%@", cityDetail.city);
//    } failed:^(NSError *error) {
//        NSLog(@"%@", error);
//    }];
    
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.

//    [self testModel];
//    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    _window.backgroundColor = [UIColor grayColor];
    MDWHomeVC *homeVC = [[MDWHomeVC alloc] init];
    self.window.rootViewController = homeVC;
    
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
