//
//  DBTTimerMethod.h
//  BaseProject
//
//  Created by ruixinyi on 2022/2/23.
//  Copyright © 2022 ruixinyi. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum {
    DBTTimerStartDefault = 0, // 默认开始
    DBTTimerEndDefault = 1,   // 默认结束
    DBTTimerStartBanner = 2,  // Banner开始
    DBTTimerEndBanner = 3, //Banner结束
    DBTTimerStartInsert = 4,  // 时长限制（未成年）
    DBTTimerEndInsert = 5, //支付限制（未成年）
    DBTTimerStartVideo = 6,  // 时长限制（未成年）
    DBTTimerEndVideo = 7, //支付限制（未成年）
}DBTTimerStatus;
@interface DBTTimerMethod : NSObject

/// 计时器方法开启，App启动时调用
+ (void)StartAction;

/// 设置计时器状态
/// @param status 计时器状态
+ (void)SetCurrentTimerStatus:(DBTTimerStatus)status;

///  App进入前台
+ (void)ApplicationDidBecomeActive;

/// App进入后台
+ (void)ApplicationWillResignActive;
@end


