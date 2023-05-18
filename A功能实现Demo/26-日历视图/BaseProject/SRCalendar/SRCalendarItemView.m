//
//  SRCalendarItemView.m
//  BaseProject
//
//  Created by ruixinyi on 2021/10/8.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import "SRCalendarItemView.h"
@interface SRCalendarItemView() {
    SRCalendarItemViewType *type;
    BOOL selectedState;
}
@end

@implementation SRCalendarItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configItemView];
    }
    return self;
}

- (void)configItemView {
    self.backgroundColor = [UIColor whiteColor];
    self.layer.cornerRadius = 8.0f;
    self.layer.borderColor = [UIColor blackColor].CGColor;
    self.layer.borderWidth = 1.0f;
    self.layer.masksToBounds = YES;
}

- (void)setViewType:(SRCalendarItemViewType)type {
    
}

- (void)setSelectedState:(BOOL)selectState {
    selectedState = selectState;
    if (selectState) {
        
    }
}
@end
