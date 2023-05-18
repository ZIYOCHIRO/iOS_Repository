//
//  DBTTimerMethod.m
//  BaseProject
//
//  Created by ruixinyi on 2022/2/23.
//  Copyright © 2022 ruixinyi. All rights reserved.
//

#import "DBTTimerMethod.h"
@interface DBTTimerMethod() {
    NSTimer *recordTimer; // 每20分钟统计一次
    DBTTimerStatus defaultStatus;
    DBTTimerStatus bannerStatus;
    DBTTimerStatus insertStatus;
    DBTTimerStatus videoStatus;
    NSDate *appEnterForegroundDate;
    NSDate *appEnterBackgroundDate;
}
@end

@implementation DBTTimerMethod

/// 计时器方法开启，App启动时调用
+ (void)StartAction{
    
}

/// 设置计时器状态
/// @param status 计时器状态
+ (void)SetCurrentTimerStatus:(DBTTimerStatus)status{
    
}

///  App进入前台
+ (void)ApplicationDidBecomeActive{
    
}

/// App进入后台
+ (void)ApplicationWillResignActive{
    
}

@end
