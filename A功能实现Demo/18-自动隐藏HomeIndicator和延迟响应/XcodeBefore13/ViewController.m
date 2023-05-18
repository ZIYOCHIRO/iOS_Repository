//
//  ViewController.m
//  XcodeBefore13
//
//  Created by ruixinyi on 2020/6/30.
//  Copyright © 2020 ruixinyi. All rights reserved.
//

#import "ViewController.h"
#include <sys/sysctl.h>
#include "TargetConditionals.h"
#import <sys/utsname.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>


@interface ViewController () {
    NSString *personName;
}

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIButton *button_1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
    button_1.backgroundColor = [UIColor purpleColor];
    [button_1 setTitle:@"Action_1" forState:UIControlStateNormal];
    [button_1 addTarget:self action:@selector(action_1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_1];
    
    UIButton *button_2 = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 100, 40)];
    button_2.backgroundColor = [UIColor purpleColor];
    [button_2 setTitle:@"Action_2" forState:UIControlStateNormal];
    [button_2 addTarget:self action:@selector(action_2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_2];
    
    UIButton *button_3 = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 40)];
    button_3.backgroundColor = [UIColor purpleColor];
    [button_3 setTitle:@"Action_3" forState:UIControlStateNormal];
    [button_3 addTarget:self action:@selector(action_3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_3];
    
    UIButton *button_4 = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    button_4.backgroundColor = [UIColor purpleColor];
    [button_4 setTitle:@"Action_4" forState:UIControlStateNormal];
    [button_4 addTarget:self action:@selector(action_4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_4];
    
}

/*
 设置HomeIndicator自动隐藏-适合非游戏App沉浸式体验（全屏录制/播放）
 */

//- (BOOL)prefersHomeIndicatorAutoHidden {
//    return YES;
//}

/*
 延迟系统级别的响应-适合游戏防止误触
 （底部的Home Indicator当很长一段时间不去触碰的时候由黑色/白色 变成非常透明的灰色）
 1.第一次进行操作时会默认执行App内手势，同时激活Home Indicator
 2.短时间内进行第二次操作就可以返回桌面
 */
- (UIRectEdge)preferredScreenEdgesDeferringSystemGestures {
    return UIRectEdgeAll;
}


- (void)action_1 {
    personName = @"testname";
    NSLog(@"dddd");
    if (@available(iOS 11.0, *)) {
        [self setNeedsUpdateOfHomeIndicatorAutoHidden];
    } else {
        // Fallback on earlier versions
    }
    
    
}

- (void)action_2 {
  
}

- (void)testAction {
    
}


- (void)action_3 {
    
}

- (void)action_4 {

}


@end

