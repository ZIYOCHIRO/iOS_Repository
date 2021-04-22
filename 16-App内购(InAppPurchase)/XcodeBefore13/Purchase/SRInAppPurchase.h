//
//  SRInAppPurchase.h
//  XcodeBefore13
//
//  Created by ruixinyi on 2021/4/14.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRInAppPurchase : NSObject
/*
 PID = product id
 */
// 请求商品信息
+ (void)RequestProductInfosWithPIDs:(NSArray *)pidArray;
// 获取商品信息
+ (NSDictionary*)GetProductInfosWithPID:(NSString *)pid;
// 购买
+ (void)BuyActionWithPID:(NSString *)pid;
// 恢复购买Restore
+ (void)RestoreAction;

@end

NS_ASSUME_NONNULL_END
