//
//  MDWDBCreator.m
//  MiDouWeather
//
//  Created by j on 16/5/14.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWDBCreator.h"
#import "MDWSqlite.h"

@implementation MDWDBCreator

+ (void)initDatabase
{
    NSString *key = @"IsCreatedDb";
    NSUserDefaults *defaults = [[NSUserDefaults alloc] init];
    if ([[defaults valueForKey:key] intValue] != 1) {
        // 没有创建数据库
        [self createWeatherTable];
        [defaults setValue:@1 forKey:key];
    }
}

+ (void)createWeatherTable
{
    NSString *sql = @"CREATE TABLE Weather (ID integer PRIMARY KEY AUTOINCREMENT, name text, screenName text, profileImageUrl text, city text";
    [[MDWSqlite sharedMDWSqlite] executeNonQuery:sql];
}

+ (void)createUserTable
{
    
}

@end
