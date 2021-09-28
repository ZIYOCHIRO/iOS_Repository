//
//  SRBottomView.m
//  BaseProject
//
//  Created by ruixinyi on 2021/9/27.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import "SRBottomView.h"
@interface SRBottomView() {
    CGFloat width;
    CGFloat height;
    CGFloat bottomHeight;
    NSDictionary *bottomButtonInfoDic;
    
    UIView *bottomButtonsView;
}
@end

@implementation SRBottomView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self config];
        [self configDic];
    }
    return self;
}

- (void)config {
    self.backgroundColor = [UIColor systemPinkColor];
    width = [UIScreen mainScreen].bounds.size.width;
    height = [UIScreen mainScreen].bounds.size.height;
    bottomHeight = 80;
    bottomButtonsView = [[UIView alloc] initWithFrame:CGRectMake(0, height-bottomHeight-80, width, bottomHeight)];
    bottomButtonsView.backgroundColor = [UIColor yellowColor];
    [self addSubview:bottomButtonsView];
    // 底部视图
    [self configBottomView];
}

- (void)configDic {
    
}
- (void)configBottomView {
    for (int i = 1; i <= 6; i++) {
        UIButton *button = [[UIButton alloc] init];
        if (i == 4) {
            [button setTitle:@"关闭" forState:UIControlStateNormal];
        } else {
            [button setTitle:[NSString stringWithFormat:@"%i", i] forState:UIControlStateNormal];
        }
        
        [button setBackgroundColor:[UIColor blueColor]];
        button.tag = i;
        [button addTarget:self action:@selector(bottomButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [bottomButtonsView addSubview:button];
    }
    [self reSetBottomButtonframe:2];//默认是2
}


- (void)reSetBottomButtonframe:(NSInteger)index {
    CGFloat padding = 0.5 * bottomHeight/MAX(labs(index - 1), labs(index - 6));
    
    for (UIView *subView in bottomButtonsView.subviews) {
        if ([subView isKindOfClass:[UIButton class]]) {
            subView.frame = CGRectMake(width/6*(subView.tag-1), padding*(labs(subView.tag - index)), width/6, bottomHeight -  padding*(labs(subView.tag - index)));
        }
    }
    
}

- (void)bottomButtonPressed:(UIButton *)btn {
    if (btn.tag == 4) {
        [self removeFromSuperview];
    } else {
        [self reSetBottomButtonframe:btn.tag];
    }
    
}

@end
