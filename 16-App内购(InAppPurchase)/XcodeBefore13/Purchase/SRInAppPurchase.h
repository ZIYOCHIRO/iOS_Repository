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
+ (void)PurchaseWithProductId:(NSString *)productId;

@end

NS_ASSUME_NONNULL_END
