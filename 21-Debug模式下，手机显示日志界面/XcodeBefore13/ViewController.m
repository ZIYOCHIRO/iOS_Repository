//
//  ViewController.m
//  BaseProject
//
//  Created by SammiRui on 2020/6/30.
//  Copyright © 2020 SammiRui. All rights reserved.
//

#import "ViewController.h"
#include <sys/sysctl.h>
#include "TargetConditionals.h"
#import <sys/utsname.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

#import "SRLog.h"
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
    [button_2 setTitle:@"展示日志界面" forState:UIControlStateNormal];
    [button_2 addTarget:self action:@selector(action_2) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_2];
    
    UIButton *button_3 = [[UIButton alloc] initWithFrame:CGRectMake(50, 150, 100, 40)];
    button_3.backgroundColor = [UIColor purpleColor];
    [button_3 setTitle:@"Action_3" forState:UIControlStateNormal];
    [button_3 addTarget:self action:@selector(action_3) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_3];
    
    UIButton *button_4 = [[UIButton alloc] initWithFrame:CGRectMake(50, 200, 100, 40)];
    button_4.backgroundColor = [UIColor purpleColor];
    [button_4 setTitle:@"添加日志" forState:UIControlStateNormal];
    [button_4 addTarget:self action:@selector(action_4) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_4];
}

- (void)action_1 {
    //先获取 沙盒中的Library/Caches/路径
    NSString *docPath = [NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject];
    NSString *myCacheDirectory = [docPath stringByAppendingPathComponent:@"TestCache"];
    //检测MyCaches 文件夹是否存在
    if ([[NSFileManager defaultManager] fileExistsAtPath:myCacheDirectory]) {
        // 存在的话，则删除
        NSError *error;
        [[NSFileManager defaultManager] removeItemAtPath:myCacheDirectory error:&error];
        if (error) {
            NSLog(@"delete error: %@", error);
        } else {
            NSLog(@"delete success");
        }
        
    } else {
        // 不存在的话，则创建
        NSError *error;
        [[NSFileManager defaultManager] createDirectoryAtPath:myCacheDirectory withIntermediateDirectories:YES attributes:nil error:&error];
        if (error) {
            NSLog(@"create error: %@", error);
        } else {
            NSLog(@"create success");
        }
        
    }
    
}

- (void)action_2 {
    
    [SRLog ShowLogView:1];

}


- (void)action_3 {
    NSLog(@"action 3");
}

 

- (void)action_4 {
    NSLog(@"action 4");
    for (int i = 0; i < 60; i++) {
        [SRLog LogLevel:@"1" tag:@"ddd" content:@"How are you today? I don't want to work everyday. I just want to go home."];
        [SRLog LogLevel:@"1" tag:@"ddd" content:@"Ho this is a test"];
    }

   
}


@end

