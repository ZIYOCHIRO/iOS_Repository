//
//  SRSqliteTool.m
//  XcodeBefore13
//
//  Created by ruixinyi on 2021/4/14.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import "SRSqliteTool.h"
#import <sqlite3.h>
@interface SRSqliteTool() {
    const char *dbPath;
}
@end
@implementation SRSqliteTool
- (instancetype)initWithDBName:(NSString *)name headerStmt:(NSString *)headerStmt{
    self = [super init];
    if (self) {
        NSArray *documentDirectories = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentDirectory = [documentDirectories objectAtIndex:0];
        NSString *dataBasePath =  [documentDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.db",name]];
        dbPath = [dataBasePath UTF8String];
        [self findDataBase:headerStmt];
    }
    return self;
}

// 找到数据库，如果数据库不存在，则创建
- (void)findDataBase:(NSString *)headerStmt {
    if ([[NSFileManager defaultManager] fileExistsAtPath:[NSString stringWithUTF8String:dbPath]] == NO) {
        sqlite3 *db;
        if (sqlite3_open(dbPath, &db) == SQLITE_OK) {
            char *errMsg;
            const char *sql_stmt = [headerStmt UTF8String];
            if (sqlite3_exec(db, sql_stmt, NULL, NULL, &errMsg) == SQLITE_OK) {
                NSLog(@"Create DB success");
            }
        }
    }
}

- (void)writeWithSql:(NSString *)sql {
    sqlite3 *db;
    sqlite3_stmt *statement;
    if (sqlite3_open(dbPath, &db) == SQLITE_OK) {
        const char *sql_stmt = [sql UTF8String];
        const char *error;
        sqlite3_prepare_v2(db, sql_stmt, -1, &statement, &error);
        if (sqlite3_step(statement)==SQLITE_DONE) {
            NSLog(@"成功写入");
        }
        else{
            NSLog(@"写入失败");
        }
        sqlite3_finalize(statement);
        
    }
    sqlite3_close(db);
}

- (NSMutableArray *)readWithSql:(NSString *)sql columns:(NSInteger)columns {
    NSMutableArray *resultArray = [NSMutableArray array];
    sqlite3 *db;
    if (sqlite3_open(dbPath, &db) == SQLITE_OK)
    {
        sqlite3_stmt *statement;
        const char *query_stmt = [sql UTF8String];
        if (sqlite3_prepare_v2(db, query_stmt, -1, &statement, NULL) == SQLITE_OK)
        {
            while (sqlite3_step(statement) == SQLITE_ROW)
            {
                NSMutableArray *columnStrArray = [NSMutableArray array];
                for (NSInteger i = 0; i<columns; i++) {
                    
                    const char *charCString = (const char *)sqlite3_column_text(statement, (int)i);
                    if (charCString == NULL) {
                        [columnStrArray addObject:@""];
                    }
                    else{
                        NSString *columnStr = [[[NSString alloc] initWithUTF8String:charCString] stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceCharacterSet]];
                        [columnStrArray addObject:columnStr];
                    }
                    
                }
                [resultArray addObject:columnStrArray];
            }
        }
        sqlite3_finalize(statement);
    }
    sqlite3_close(db);
    return resultArray;
}

@end
