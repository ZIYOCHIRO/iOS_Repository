//
//  SRCalendarItemView.h
//  BaseProject
//
//  Created by ruixinyi on 2021/10/8.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    Finished = 0,  //已完成
    UnFinished = 1, //未完成
    UnEnabled = 2  //不可选中
}SRCalendarItemViewType;


@interface SRCalendarItemView : UIView
- (void)setViewType:(SRCalendarItemViewType)type;
- (void)setSelectedState:(BOOL)selectState;
@end
