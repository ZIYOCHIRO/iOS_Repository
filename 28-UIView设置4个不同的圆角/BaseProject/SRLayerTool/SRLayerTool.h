//
//  SRCalendarTool.h
//  BaseProject
//
//  Created by ruixinyi on 2021/10/8.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface SRLayerTool : NSObject
+ (void)SetMaskOfLayer:(CALayer *)layer
         topLeftRadius:(CGFloat)topLeftRadius
        topRightRadius:(CGFloat)topRightRadius
      bottomLeftRadius:(CGFloat)bottomLeftRadius
     bottomRightRadius:(CGFloat)bottomRightRadius
            withBorder:(BOOL)withBorder ;
@end


