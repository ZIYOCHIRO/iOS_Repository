//
//  SRNotification.m
//  BaseProject
//
//  Created by ruixinyi on 2021/9/22.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import "SRNotification.h"
#import <UIKit/UIKit.h>
#import <UserNotifications/UserNotifications.h>
@interface SRNotification()<UNUserNotificationCenterDelegate>
@end

@implementation SRNotification
+ (instancetype)sharedInstance {
    static SRNotification *_sharedInstance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedInstance = [[SRNotification alloc] init];
    });
    return _sharedInstance;
}
// 注册本地通知
- (void)registerLocalNotification {
    
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    center.delegate = self;
    [center requestAuthorizationWithOptions:(UNAuthorizationOptionAlert + UNAuthorizationOptionSound + UNAuthorizationOptionBadge) completionHandler:^(BOOL granted, NSError * _Nullable error) {
        NSLog(@"SRNotification request Authorization Result:%i, error:%@", granted, error);
    }];
}

//创建本地通知
- (void)createLocalNotification:(NSDictionary *)userInfo with:(NSString *)identifier {
    // 每次create之前，先移除之前的同identifier的通知
    [self removeLocalNotificationWith:identifier];
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    
    UNMutableNotificationContent *content = [[UNMutableNotificationContent alloc] init];
    NSString *path = [[[NSBundle mainBundle] resourcePath] stringByAppendingPathComponent:@"SRNotification.bundle/notificationIcon.png"];
    UNNotificationAttachment *imageAttachment = [UNNotificationAttachment attachmentWithIdentifier:@"dddd" URL:[NSURL fileURLWithPath:path] options:nil error:nil];
    content.title = @"标题";
    content.subtitle = @"副标题";
    content.body = @"通知具体内容";
    content.attachments = @[imageAttachment];
    content.userInfo = userInfo;
    content.badge = @1; // 随着通知一起出现
    content.sound = [UNNotificationSound defaultSound];
    NSTimeInterval time = [[NSDate dateWithTimeIntervalSinceNow:10] timeIntervalSinceNow];
    UNTimeIntervalNotificationTrigger *trigger = [UNTimeIntervalNotificationTrigger triggerWithTimeInterval:time repeats:NO];
    UNNotificationRequest *request = [UNNotificationRequest requestWithIdentifier:identifier content:content trigger:trigger];
    [center addNotificationRequest:request withCompletionHandler:^(NSError * _Nullable error) {
        NSLog(@"SRNotification add local notification success identifier:%@", identifier);
    }];
}

// 移除本地某个通知
- (void)removeLocalNotificationWith:(NSString *)identifier {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center getPendingNotificationRequestsWithCompletionHandler:^(NSArray<UNNotificationRequest *> * _Nonnull requests) {
        for (UNNotificationRequest *request in requests) {
            if ([request.identifier isEqualToString:identifier]) {
                NSLog(@"SRNotification remove local notification identifier:%@", identifier);
                [center removePendingNotificationRequestsWithIdentifiers:@[identifier]];
            }
        }
    }];
}

// 移除本地所有通知
- (void)removeAllLocalNotifications {
    UNUserNotificationCenter *center = [UNUserNotificationCenter currentNotificationCenter];
    [center removeAllPendingNotificationRequests];
}


#pragma mark - UNUserNotificationCenterDelegate

- (void)userNotificationCenter:(UNUserNotificationCenter *)center didReceiveNotificationResponse:(UNNotificationResponse *)response withCompletionHandler:(void (^)(void))completionHandler {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    // app在非活跃状态下接受到通知时，用户打开app
    if ([UIApplication sharedApplication].applicationState != UIApplicationStateActive) {
        NSLog(@"SRNotification 用户通过点击通知打开了app userinfo:%@", userInfo);
    }
    completionHandler();
    
}


@end
