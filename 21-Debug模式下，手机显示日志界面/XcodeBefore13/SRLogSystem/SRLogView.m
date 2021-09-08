//
//  SRLogView.m
//  BaseProject
//
//  Created by SammiRui on 2021/9/3.
//  Copyright © 2021 SammiRui. All rights reserved.
//

#import "SRLogView.h"

@interface SRLogView ()
{
    UIColor *bgColor;
    UIView *logDetailView; // 日志详情页
    UITextView *logTextView;
    UITextField *filterTextField;
    
    NSMutableArray <NSString *> *allTextArray;
    NSMutableArray <NSString *> *filterTextArray;
    
}
@end

@implementation SRLogView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        bgColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.5];
        allTextArray = [NSMutableArray array];
        filterTextArray = [NSMutableArray array];
        [self config];
    }
    return self;
}

#pragma mark - touches
- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    UITouch *touch = [touches anyObject];
    //求偏移量 = 当前点的X - 上一个点的X
    CGPoint currentPoint = [touch locationInView:self];
    CGPoint prePoint = [touch previousLocationInView:self];
    CGFloat offSetX = currentPoint.x - prePoint.x;
    CGFloat offSetY = currentPoint.y - prePoint.y;
    self.transform = CGAffineTransformTranslate(self.transform, offSetX, offSetY);
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endMoveAction];
}
 
- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self endMoveAction];
}
//----/------
- (void)endMoveAction{
    //距离父视图坐标
    CGPoint point = [self convertPoint:CGPointMake(0, 0) toView:[UIApplication sharedApplication].keyWindow];
    CGFloat endX = point.x;
    CGFloat endY = point.y;
    
    if (endX < CGRectGetWidth([UIScreen mainScreen].bounds)/2) {
        endX = 0;
    }else{
        endX = CGRectGetWidth([UIScreen mainScreen].bounds) - CGRectGetWidth(self.frame);
    }
    if (endY < 80 ) {
        endY = 80;
    }else if (endY > CGRectGetHeight([UIScreen mainScreen].bounds) - CGRectGetWidth(self.frame) - 100) {
        endY = CGRectGetHeight([UIScreen mainScreen].bounds) - CGRectGetWidth(self.frame) - 100;
    }
    __weak typeof(self) weakSelf = self;
    [UIView animateWithDuration:0.2 animations:^{
        weakSelf.frame = CGRectMake(endX, endY, CGRectGetWidth(weakSelf.frame), CGRectGetHeight(weakSelf.frame));
    }];
}

//===============
//===============
- (void)config{
    self.backgroundColor = [UIColor clearColor];
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:self.bounds];
    imageView.image = [UIImage imageNamed:@"SRLogger.bundle/find_gray"];
    imageView.layer.cornerRadius = 8;
    imageView.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.3];
    [self addSubview:imageView];
    //
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(onClickShowLogIcon)];
    [self addGestureRecognizer:singleTap];
}
#pragma mark - onClickFeedbackIcon
- (void)onClickShowLogIcon{
    [self configLogDetailView];
    
    logDetailView.hidden = NO;
    [[UIApplication sharedApplication].keyWindow addSubview:logDetailView];
}

- (void)configLogDetailView {
    if (logDetailView) {
        return;
    }
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    logDetailView = [[UIView alloc] initWithFrame:CGRectMake(10, 20, screenWidth-20, screenHeight-40)];
    logDetailView.backgroundColor = bgColor;
    logDetailView.layer.cornerRadius = 8.0;
    logDetailView.layer.masksToBounds = YES;
    CGFloat width = logDetailView.bounds.size.width;
    CGFloat height = logDetailView.bounds.size.height;
    
    UIView *topMenuView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, width, 40)];
    topMenuView.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.9];
    [logDetailView addSubview:topMenuView];
    // 关闭按钮
    UIButton *closeButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 20, 20)];
    [closeButton setImage:[UIImage imageNamed:@"SRLogger.bundle/delete_red"] forState:UIControlStateNormal];
    closeButton.imageView.contentMode = UIViewContentModeScaleToFill;
    [closeButton addTarget:self action:@selector(closeAction) forControlEvents:UIControlEventTouchUpInside];
    closeButton.layer.cornerRadius = 10;
    closeButton.layer.masksToBounds = YES;
    [topMenuView addSubview:closeButton];

    // 缩小按钮
    UIButton *zoomButton = [[UIButton alloc] initWithFrame:CGRectMake(40, 10, 20, 20)];
    [zoomButton setImage:[UIImage imageNamed:@"SRLogger.bundle/zoom_yellow"] forState:UIControlStateNormal];
    [zoomButton addTarget:self action:@selector(zoomAction) forControlEvents:UIControlEventTouchUpInside];
    zoomButton.layer.cornerRadius = 10;
    zoomButton.layer.masksToBounds = YES;
    [topMenuView addSubview:zoomButton];
    
    UIButton *clearAllButton = [[UIButton alloc] initWithFrame:CGRectMake(width-35, 7.5, 25, 25)];
    [clearAllButton setImage:[UIImage imageNamed:@"SRLogger.bundle/trash_gray"] forState:UIControlStateNormal];
    [clearAllButton setImage:[UIImage imageNamed:@"SRLogger.bundle/trash_white"] forState:UIControlStateHighlighted];
    [clearAllButton addTarget:self action:@selector(clearAllAction) forControlEvents:UIControlEventTouchUpInside];
    clearAllButton.layer.masksToBounds = YES;
    [topMenuView addSubview:clearAllButton];
    
    
    filterTextField = [[UITextField alloc] initWithFrame:CGRectMake(width-270, 5, 220, 30)];
    filterTextField.backgroundColor = [UIColor colorWithRed:50/255.0 green:50/255.0 blue:50/255.0 alpha:1];
    filterTextField.textColor = [UIColor whiteColor];
    filterTextField.textAlignment = NSTextAlignmentLeft;
    filterTextField.font = [UIFont systemFontOfSize:14];
    filterTextField.returnKeyType = UIReturnKeyDone;
    filterTextField.keyboardType = UIKeyboardTypeDefault;
    filterTextField.borderStyle = UITextBorderStyleRoundedRect;
    filterTextField.placeholder = @"Filter";
    filterTextField.delegate = self;
    CGRect frame = filterTextField.frame;
    frame.size.width = 25;
    UIView *leftView = [[UIView alloc] initWithFrame:frame];
    UIImageView *leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 20, 20)];
    leftImage.image = [UIImage imageNamed:@"SRLogger.bundle/filter_gray"];
    [leftView addSubview:leftImage];
    filterTextField.leftView = leftView;
    filterTextField.leftViewMode = UITextFieldViewModeAlways;
    
    UIView *rightView = [[UIView alloc] initWithFrame:frame];
    UIButton *deleteButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 5, 20, 20)];
    [deleteButton setImage:[UIImage imageNamed:@"SRLogger.bundle/delete_gray"] forState:UIControlStateNormal];
    [deleteButton addTarget:self action:@selector(deleteTextAction) forControlEvents:UIControlEventTouchUpInside];
    [rightView addSubview:deleteButton];
    filterTextField.rightView = rightView;
    filterTextField.rightViewMode = UITextFieldViewModeAlways;
    [topMenuView addSubview:filterTextField];
    
    // 滚动文本框
    logTextView = [[UITextView alloc] initWithFrame:CGRectMake(0, 40, width, height-40)];
    logTextView.font = [UIFont systemFontOfSize:12];
    logTextView.textColor = [UIColor whiteColor];
    logTextView.editable = NO;
    logTextView.scrollEnabled = YES;
    logTextView.backgroundColor = bgColor;
    logTextView.layoutManager.allowsNonContiguousLayout = NO;
    [logDetailView addSubview:logTextView];
    
    [self UpdateFilterArray:@""];
}

// 关闭窗口按钮
- (void)closeAction {
    [logDetailView removeFromSuperview];
    logDetailView = nil;
    if ([self.delegate respondsToSelector:@selector(SRLogViewDidDestroyed)]) {
        [self.delegate SRLogViewDidDestroyed];
    }
}

// 缩小窗口按钮
- (void)zoomAction {
    logDetailView.hidden = YES;
}

// 文本框内删除按钮
- (void)deleteTextAction {
    [self UpdateFilterArray:@""];
    filterTextField.text = @"";
    
}

// 清空日志按钮
- (void)clearAllAction {
    allTextArray = [NSMutableArray array];
    filterTextArray = [NSMutableArray array];
    logTextView.text = @"";
    
}


- (void)updateLog:(NSString *)logStr level:(int)level {
    if (logStr.length == 0) {
        return;
    }
    [allTextArray addObject:logStr];
    if (logDetailView) {
        if (filterTextField.text.length != 0) {
            // 需要过滤
            if ([[logStr lowercaseString] containsString:[filterTextField.text lowercaseString]]) {
                [filterTextArray addObject:logStr];
                //往后追加一行
                if (logTextView.text.length != 0) {
                    logTextView.text = [NSString stringWithFormat:@"%@\n%@", logTextView.text, logStr];
                } else {
                    logTextView.text = logStr;
                }
                
            }
        } else {
            // 不需要过滤，直接往后追加一行
            if (logTextView.text.length != 0) {
                logTextView.text = [NSString stringWithFormat:@"%@\n%@", logTextView.text, logStr];
            } else {
                logTextView.text = logStr;
            }
        }
        [logTextView scrollRangeToVisible:NSMakeRange(logTextView.text.length, 1)];
    }
}


//什么时候更新：1.用户点击textField里的清除按钮 2.文本输入时
- (void)UpdateFilterArray:(NSString *)filterStr {
    // 需要过滤, 先清空
    filterTextArray = [NSMutableArray array];
    if (filterStr.length != 0) {
        NSString *filteStrLowerCase = [filterStr lowercaseString];
        for (NSString *element in allTextArray) {
            if ([[element lowercaseString] containsString:filteStrLowerCase]) {
                [filterTextArray addObject:element];
            }
        }
        
        NSString *resultStr = [filterTextArray componentsJoinedByString:@"\n"];
        logTextView.text = resultStr;
    } else {
        // 不需要过滤
        NSString *resultStr = [allTextArray componentsJoinedByString:@"\n"];
        logTextView.text = resultStr;
    }
    [logTextView scrollRangeToVisible:NSMakeRange(logTextView.text.length, 1)];
}

#pragma mark -  TextFieldDelegate
- (void)textFieldDidChangeSelection:(UITextField *)textField {
    [self UpdateFilterArray:filterTextField.text];
}
// 键盘收起
- (void)textFieldDidEndEditing:(UITextField *)textField {
    [self UpdateFilterArray:filterTextField.text];
}
//when clear button pressed
- (BOOL)textFieldShouldClear:(UITextField *)textField {
    [self UpdateFilterArray:@""];
    return YES;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self UpdateFilterArray:filterTextField.text];
    [filterTextField resignFirstResponder];
    return YES;
}
//// 点击穿透
//- (UIView*)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
//    UIView *hitView = [super hitTest:point withEvent:event];
//    if(hitView == self){
//        return nil;
//    }
//    return hitView;
//}


@end
