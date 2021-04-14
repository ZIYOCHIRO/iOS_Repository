//
//  SRToast.h
//  XcodeBefore13
//
//  Created by ruixinyi on 2021/4/8.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SRToast : NSObject

// 展示Toast弹框：宽度/高度自适应
+ (void)ShowToastWithMessage:(NSString *)message;
@end
