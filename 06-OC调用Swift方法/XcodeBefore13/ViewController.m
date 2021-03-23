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

#import "XcodeBefore13-Swift.h"

@interface ViewController () {
    
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

- (void)action_1 {
 
    [SRMethod SumMethdWithA:2 B:3];
    
    SRMethod *method = [[SRMethod alloc] init];
    [method subMethodWithA:3 B:2];
    [method methodWithBlockWithA:2 callBack:^(NSInteger code, NSString * result) {
        NSLog(@"code is %i, result is %@", code, result);
    }];
}

- (void)action_2 {
    
   
}


- (void)action_3 {

    
}
- (void)action_4 {

}


@end

