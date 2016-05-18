//
//  MDWSqlite.m
//  MiDouWeather
//
//  Created by j on 16/5/13.
//  Copyright © 2016年 j. All rights reserved.
//

#import "MDWSqlite.h"

@interface MDWSqlite ()


@end

@implementation MDWSqlite

singleton_implementation(MDWSqlite);

- (instancetype)init
{
    MDWSqlite *sqlite;
    if ((sqlite = [super init])) {
        [sqlite openDB:@"MDWWeather"];
    }
    return sqlite;
}

- (void)openDB:(NSString *)dbName
{
    // 数据库路径
    NSString *directory = [NSSearchPathForDirectoriesInDomains(NSDocumentationDirectory, NSUserDomainMask, YES) firstObject];
    NSLog(@"%@", directory);
    NSString *dbPath = [directory stringByAppendingPathComponent:dbName];
    
    if (SQLITE_OK == sqlite3_open(dbPath.UTF8String, &_database)) {
        NSLog(@"打开数据库成功");
    } else {
        NSLog(@"打开数据库失败");
    }
}

- (void)executeNonQuery:(NSString *)sql
{
    NSLog(@"EXECUTE NON QUERY ");
    char *error;
    // 执行sql语句
    if (SQLITE_OK != sqlite3_exec(_database, sql.UTF8String, NULL, NULL, &error)) {
        NSLog(@"执行sql语句错误，错误息:%s", error);
    }
}

- (NSArray *)executeQuery:(NSString *)sql
{
    NSMutableArray *rows = [NSMutableArray array];
    
    // 评估语法正确性
    sqlite3_stmt *stmt;
    
    // 检查语法正确性
    if (SQLITE_OK == sqlite3_prepare_v2(_database, sql.UTF8String, -1, &stmt, NULL)) {
        // 单步执行sql语句
        while (SQLITE_ROW == sqlite3_step(stmt)) {
            int columnCount = sqlite3_column_count(stmt);
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];
            for (int i = 0; i < columnCount; i++) {
                const char *name = sqlite3_column_name(stmt, i);
                const unsigned char *value = sqlite3_column_text(stmt, i);
                dict[[NSString stringWithUTF8String:name]] = [NSString stringWithUTF8String:(const char *)value];
            }
            [rows addObject:dict];
        }
    }
    // 释放句柄
    sqlite3_finalize(stmt);
    
    return rows;
}

+ (void)createTableWithName:(NSString *)tableName
{

    
}

@end
