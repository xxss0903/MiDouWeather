//
//  MDWSqlite.h
//  MiDouWeather
//
//  Created by j on 16/5/13.
//  Copyright © 2016年 j. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDWSingleton.h"
#import <sqlite3.h>

@interface MDWSqlite : NSObject

singleton_interface(MDWSqlite);

@property (nonatomic) sqlite3 *database;

/**
 *  打开数据库
 *
 *  @param dbName 数据库名称
 */
- (void)openDB:(NSString *)dbName;

/**
 *  执行无返回语句
 *
 *  @param sql sqlite语句
 */
- (void)executeNonQuery:(NSString *)sql;

/**
 *  执行有返回语句
 *
 *  @param sql sqlite语句
 *
 *  @return 返回数据数组
 */
- (NSArray *)executeQuery:(NSString *)sql;

/**
 *  创建数据库表单
 *
 *  @param tableName 表单名称
 */
+ (void)createTableWithName:(NSString *)tableName;


@end
