//
//  SRSqliteTool.h
//  XcodeBefore13
//
//  Created by ruixinyi on 2021/4/14.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRSqliteTool : NSObject
- (instancetype)initWithDBName:(NSString *)name headerStmt:(NSString *)headerStmt;
// 往数据库里写入/更新数据
- (void)writeWithSql:(NSString *)sql;
// 从数据库里读取数据
- (NSMutableArray *)readWithSql:(NSString *)sql columns:(NSInteger)columns;

@end

NS_ASSUME_NONNULL_END
