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
    CGFloat bottomButtonWidth;
    NSDictionary *bottomButtonInfoDic;
    
    UIView *bottomButtonsView;
}
@end

@implementation SRBottomView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self configDic];
        [self config];
    }
    return self;
}

- (void)config {
    width = [UIScreen mainScreen].bounds.size.width;
    height = [UIScreen mainScreen].bounds.size.height;
    bottomHeight = 80;
    bottomButtonWidth = width/6;
    bottomButtonsView = [[UIView alloc] initWithFrame:CGRectMake(0, height-bottomHeight-80, width, bottomHeight)];
    bottomButtonsView.backgroundColor = [UIColor yellowColor];
    [self addSubview:bottomButtonsView];
    // 底部视图
    [self configBottomView];
}

- (void)configDic {
    bottomButtonInfoDic = @{@"1":@{@"title":@"秋高气爽", @"image":@"SRBottomView.bundle/icon-1"},
                            @"2":@{@"title":@"高层积云", @"image":@"SRBottomView.bundle/icon-2"},
                            @"3":@{@"title":@"狂风暴雨", @"image":@"SRBottomView.bundle/icon-3"},
                            @"4":@{@"title":@"点击关闭", @"image":@"SRBottomView.bundle/icon-4"},
                            @"5":@{@"title":@"现在天气", @"image":@"SRBottomView.bundle/icon-5"},
                            @"6":@{@"title":@"春困秋乏dd", @"image":@"SRBottomView.bundle/icon-6"}
    };
}
- (void)configBottomView {
    for (int i = 1; i <= 6; i++) {
        UIButton *button = [[UIButton alloc] init];
        NSString *index = [NSString stringWithFormat:@"%i", i];
        [button setTitle:bottomButtonInfoDic[index][@"title"] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor blueColor]];
        button.tag = i;
        [button addTarget:self action:@selector(bottomButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
        [button.titleLabel setAdjustsFontSizeToFitWidth:YES];
        
        UIImageView *test = [[UIImageView alloc] init];
        test.backgroundColor = [UIColor orangeColor];
        test.translatesAutoresizingMaskIntoConstraints = NO;
        test.image = [UIImage imageNamed:bottomButtonInfoDic[index][@"image"]];
        test.contentMode = UIViewContentModeScaleAspectFit;
        [button addSubview:test];
        // 距离左边0
        NSLayoutConstraint *constraint1 = [NSLayoutConstraint constraintWithItem:test attribute:NSLayoutAttributeLeft relatedBy:NSLayoutRelationEqual toItem:button attribute:NSLayoutAttributeLeft multiplier:1 constant:0];
        
        // 距离右边0
        NSLayoutConstraint *constraint2 = [NSLayoutConstraint constraintWithItem:test attribute:NSLayoutAttributeRight relatedBy:NSLayoutRelationEqual toItem:button attribute:NSLayoutAttributeRight multiplier:1 constant:0];
        // 距离上边0
        NSLayoutConstraint *constraint3 = [NSLayoutConstraint constraintWithItem:test attribute:NSLayoutAttributeTop relatedBy:NSLayoutRelationEqual toItem:button attribute:NSLayoutAttributeTop multiplier:1 constant:0];
        // 距离下边 bottemHeight/4
        NSLayoutConstraint *constraint4 = [NSLayoutConstraint constraintWithItem:test attribute:NSLayoutAttributeBottom relatedBy:NSLayoutRelationEqual toItem:button attribute:NSLayoutAttributeBottom multiplier:1 constant:-bottomHeight/4];
        
        [button addConstraints:@[constraint1, constraint2, constraint3, constraint4]];
        [bottomButtonsView addSubview:button];
    }
    [self reSetBottomButtonframe:2];//默认是2
}



- (void)reSetBottomButtonframe:(NSInteger)index {
    CGFloat padding = 0.5 * bottomHeight/MAX(labs(index - 1), labs(index - 6));
    
    for (UIButton *button in bottomButtonsView.subviews) {
        if ([button isKindOfClass:[UIButton class]]) {
            CGFloat heightPadding = padding*(labs(button.tag - index));
            button.frame = CGRectMake(width/6*(button.tag-1), heightPadding, width/6, bottomHeight -  padding*(labs(button.tag - index)));
            [button setTitleEdgeInsets:UIEdgeInsetsMake(bottomHeight * 0.75-heightPadding, 0, 5, 0)];
        }
    }
    
}


- (void)bottomButtonPressed:(UIButton *)btn {
//    if (btn.tag == 4) {
//        [self removeFromSuperview];
//    } else {
//        [self reSetBottomButtonframe:btn.tag];
//    }
    [self reSetBottomButtonframe:btn.tag];
}

@end
