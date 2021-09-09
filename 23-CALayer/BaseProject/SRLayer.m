//
//  SRLayer.m
//  BaseProject
//
//  Created by ruixinyi on 2021/9/9.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import "SRLayer.h"

@implementation SRLayer
- (void)drawInContext:(CGContextRef)ctx {
    CGContextSetRGBFillColor(ctx, 0, 0, 1, 1);
    
    CGContextMoveToPoint(ctx, 50, 0);
    CGContextAddLineToPoint(ctx, 0, 100);
    CGContextAddLineToPoint(ctx, 100, 100);
    CGContextClosePath(ctx);
    
    CGContextFillPath(ctx);
    
}
@end
