//
//  SRToast.m
//  XcodeBefore13
//
//  Created by ruixinyi on 2021/4/8.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import "SRToast.h"
#import <UIKit/UIKit.h>

@implementation SRToast
+ (void)ShowToastWithMessage:(NSString *)message {
    CGFloat PaddingWidth = 20.0;  // 文字距离左右边框的大小
    CGFloat PaddingHeight = 10.0; // 文字距离上下边框的大小
    CGFloat MaxToastWidth = 300;  // Toast最大宽度
    CGSize ToastSize = CGSizeMake(0, 0);
    CGSize EstimateMessageSize = CGSizeMake(0, 0);
    CGSize ScreenSize = [UIScreen mainScreen].bounds.size;
    
    // 文本格式
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    [style setLineBreakMode:NSLineBreakByCharWrapping];
    style.firstLineHeadIndent = PaddingWidth;//首行缩进
    style.headIndent = PaddingWidth;
    style.tailIndent = -PaddingWidth;
    NSMutableAttributedString *attributedMessage = [[NSMutableAttributedString alloc]initWithString:message attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSParagraphStyleAttributeName:style}];
    
    // 预估文本大小
    EstimateMessageSize = [message boundingRectWithSize:CGSizeMake(MaxToastWidth, MAXFLOAT)
                                                options:NSStringDrawingUsesLineFragmentOrigin
                                             attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:15],NSParagraphStyleAttributeName:style}
                                                context:nil].size;

    // 设置Toast的大小
    if (EstimateMessageSize.width > MaxToastWidth - PaddingWidth * 2) {
        ToastSize.width = MaxToastWidth;
    } else {
        ToastSize.width = EstimateMessageSize.width + PaddingWidth * 2;
    }
    ToastSize.height = EstimateMessageSize.height + PaddingHeight * 2;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        // 创建Label
        UILabel *Toast = [[UILabel alloc] initWithFrame:CGRectMake((ScreenSize.width - ToastSize.width)/2.0, (ScreenSize.height - ToastSize.height)/2.0, ToastSize.width, ToastSize.height)];
        Toast.attributedText = attributedMessage;
        Toast.textColor = [UIColor whiteColor];
        Toast.textAlignment = NSTextAlignmentCenter;
        Toast.numberOfLines = 0; // 自动换行
        Toast.backgroundColor = [UIColor colorWithRed:34/255.0 green:34/255.0 blue:34/255.0 alpha:1.0];
        Toast.layer.cornerRadius = 8;
        Toast.clipsToBounds = YES;
        [[UIApplication sharedApplication].keyWindow addSubview:Toast];
        [UIView animateWithDuration:1.5 animations:^{
            Toast.alpha = 0;
        } completion:^(BOOL finished) {
            [Toast removeFromSuperview];
        }];
    });
}

@end
