//
//  SRToast.h
//  XcodeBefore13
//
//  Created by ruixinyi on 2021/4/8.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRToast : NSObject

// 适应高度 适应宽度
+ (void)ShowToastWithMessage:(NSString *)message;
@end
