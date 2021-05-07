//
//  SRInAppPurchase.m
//  XcodeBefore13
//
//  Created by ruixinyi on 2021/4/14.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import "SRInAppPurchase.h"
#import <StoreKit/StoreKit.h>
@interface SRInAppPurchase()<SKProductsRequestDelegate> {
    
}
@end
static NSMutableDictionary *SRProductInfosDic;
@implementation SRInAppPurchase
// 请求商品信息
+ (void)RequestProductInfosWithPIDs:(NSArray *)pidArray {
    if (SRProductInfosDic == nil) {
        SRProductInfosDic = [NSMutableDictionary dictionary];
    }
    SKProductsRequest *request = [[SKProductsRequest alloc] initWithProductIdentifiers:[NSSet setWithArray:pidArray]];
    request.delegate = self;
    [request start];
}

// 获取商品信息
+ (NSDictionary*)GetProductInfosWithPID:(NSString *)pid {
    return SRProductInfosDic[pid];
}

// 购买
+ (void)BuyActionWithPID:(NSString *)pid {
    if ([SKPaymentQueue canMakePayments]) {
        // 加载进度条
    } else {
        // 弹出提示框
    }
}

// 恢复
+ (void)RestoreAction {
    if ([SKPaymentQueue canMakePayments]) {
        [[SKPaymentQueue defaultQueue] restoreCompletedTransactions];
        // 加载进度条
    } else {
        // 弹出提示框
        
    }
}

#pragma mark - SKProductsRequestDelegate
+ (void)productsRequest:(nonnull SKProductsRequest *)request didReceiveResponse:(nonnull SKProductsResponse *)response {
    for (SKProduct *product in response.products) {
        NSString *pid = product.productIdentifier;
        if (pid.length == 0) {
            continue;
        }
        
        NSString *productName = (product.localizedTitle.length == 0) ? @"":product.localizedTitle;
        NSString *productDescription = (product.localizedDescription.length == 0) ? @"":product.localizedDescription;
        float productPrice = [product.price floatValue];
        NSString *productCurrencySymbol = [product.priceLocale objectForKey:NSLocaleCurrencySymbol];
        NSDictionary *productInfoDic = @{
            @"pName":productName,
            @"pDescription":productDescription,
            @"pPrice":[NSString stringWithFormat:@"%f", productPrice],
            @"pPriceSymbol":productCurrencySymbol
        };
        SRProductInfosDic[pid] = productInfoDic;
    }
}

@end
