//
//  SRCalendarView.m
//  BaseProject
//
//  Created by ruixinyi on 2021/10/8.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import "SRCalendarView.h"
#import "SRCalendarItemView.h"
#import "SRCalendarTool.h"
@interface SRCalendarView() {
    
    UIButton *previousButton; // 月份切换按钮 上个月
    UIButton *nextButton; //月份切换按钮 下个月
    UILabel *currentTime; // 当前年月
    UILabel *currentProgress; // 当前进度
    SRCalendarItemView *itemView[42]; // 日历视图，最多有6行，每行7个
    UIButton *startGameButton; // 开始游戏按钮
    
}
@end
@implementation SRCalendarView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
    }
    return self;
}

- (void)config {
    self.backgroundColor = [UIColor systemRedColor];
 
    CGFloat width = self.bounds.size.width;
    CGFloat height = self.bounds.size.height;
    
    // 上个月按钮
    previousButton = [[UIButton alloc] initWithFrame:CGRectMake(0.075*width, 0.05*height, 40, 40)];
    [previousButton setTitle:@"上月" forState:UIControlStateNormal];
    [previousButton addTarget:self action:@selector(GoToPreivousMonthAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:previousButton];
    // 下个月按钮
    nextButton = [[UIButton alloc] initWithFrame:CGRectMake(0.775*width, 0.05*height, 40, 40)];
    [nextButton setTitle:@"下月" forState:UIControlStateNormal];
    [nextButton addTarget:self action:@selector(GoToNextMonthAction) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:nextButton];
    // 分割线
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectMake(0, 0.18*height, width, 2)];
    lineView.backgroundColor = [UIColor blackColor];
    [self addSubview:lineView];
    // 日历视图
    CGFloat itemWidth = 0.1*width;  // 每个item的长和宽
    CGFloat paddingWidth = 0.075*width; // 左边padding
    CGFloat paddingHeight = 0.20*height; // 上边padding
    CGFloat intervalWidth = 0.025*width; // 间隔
    
    for (int i = 0; i < 42; i++) {
        itemView[i] = [[SRCalendarItemView alloc] initWithFrame:CGRectMake((i%7)*(itemWidth + intervalWidth) + paddingWidth, (i/7)*(itemWidth + intervalWidth) + paddingHeight, itemWidth, itemWidth)];
        [self addSubview:itemView[i]];
    }
    
    // 开始游戏按钮
    
}

#pragma mark - 点击上个月按钮
- (void)GoToPreivousMonthAction {
    NSLog(@"点击上个月");
}

#pragma mark - 点击下个月按钮
- (void)GoToNextMonthAction {
    NSLog(@"点击下个月");
}
@end
