//
//  SRLog.h
//  BaseProject
//
//  Created by SammiRui on 2021/9/1.
//  Copyright © 2021 SammiRui. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRLog : NSObject

+ (void)StartAction;
+ (void)ShowLogView:(int)canShow;// canShow 0-不可见  1-可见
+ (void)LogLevel:(NSString *)level tag:(NSString *)tag content:(NSString *)content;


@end

NS_ASSUME_NONNULL_END
