//
//  SRNotification.h
//  BaseProject
//
//  Created by ruixinyi on 2021/9/22.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRNotification : NSObject
+ (instancetype)sharedInstance;
// 注册本地通知
- (void)registerLocalNotification;
//创建本地通知
- (void)createLocalNotification:(NSDictionary *)userInfo with:(NSString *)identifier;
// 移除本地某个通知
- (void)removeLocalNotificationWith:(NSString *)identifier;
// 移除本地所有通知
- (void)removeAllLocalNotifications;

@end

NS_ASSUME_NONNULL_END
