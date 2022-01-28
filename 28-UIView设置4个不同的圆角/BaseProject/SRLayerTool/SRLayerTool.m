//
//  SRCalendarTool.m
//  BaseProject
//
//  Created by ruixinyi on 2021/10/8.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import "SRLayerTool.h"

@implementation SRLayerTool
+ (void)SetMaskOfLayer:(CALayer *)layer
                      topLeftRadius:(CGFloat)topLeftRadius
                     topRightRadius:(CGFloat)topRightRadius
                   bottomLeftRadius:(CGFloat)bottomLeftRadius
                  bottomRightRadius:(CGFloat)bottomRightRadius
                         withBorder:(BOOL)withBorder {
    CGFloat width = layer.bounds.size.width;
    CGFloat height = layer.bounds.size.height;
    
    
    UIBezierPath *path1 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, 0, width/2, height/2) byRoundingCorners:UIRectCornerTopLeft cornerRadii:CGSizeMake(topLeftRadius,topLeftRadius)];
    UIBezierPath *path2 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(width/2, 0, width/2, height/2) byRoundingCorners:UIRectCornerTopRight cornerRadii:CGSizeMake(topRightRadius,topRightRadius)];
    UIBezierPath *path3 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(0, height/2, width/2, height/2) byRoundingCorners:UIRectCornerBottomLeft cornerRadii:CGSizeMake(bottomLeftRadius,bottomLeftRadius)];
    UIBezierPath *path4 = [UIBezierPath bezierPathWithRoundedRect:CGRectMake(width/2, height/2, width/2, height/2) byRoundingCorners:UIRectCornerBottomRight cornerRadii:CGSizeMake(bottomRightRadius,bottomRightRadius)];

    //创建 path
    [path1 appendPath:path2];
    [path1 appendPath:path3];
    [path1 appendPath:path4];
    
    CAShapeLayer *mask = [[CAShapeLayer alloc] init];
    mask.path = path1.CGPath;
    layer.mask = mask;
    
    // TODO: 设置border
}
@end
