//
//  ViewController.m
//  XcodeBefore13
//
//  Created by ruixinyi on 2020/6/30.
//  Copyright © 2020 ruixinyi. All rights reserved.
//

#import "ViewController.h"
#import "SRTool.h"
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
    NSString *a = [SRTool GetDeviceModel];
    NSLog(@"设备型号：%@", a);
    NSString *b = [SRTool GetPhoneName];
    NSLog(@"设备名称：%@", b);
    NSString *c = [SRTool GetSystemVersion];
    NSLog(@"系统版本：%@", c);
    NSString *d = [SRTool GetDevicePhysicalSize];
    NSLog(@"物理尺寸：%@", d);
    NSString *e = [SRTool GetDeviceResolution];
    NSLog(@"分辨率：%@", e);
    NSString *f = [SRTool GetSystemLanguage];
    NSLog(@"系统语言：%@", f);
    NSString *g = [SRTool GetSystemRegion];
    NSLog(@"系统地区：%@", g);
    NSString *h = [SRTool GetSystemCountryCode];
    NSLog(@"国家代码：%@", h);
    NSString *i = [SRTool GetAppVersion];
    NSLog(@"App版本号：%@", i);
    NSString *j = [SRTool GetAppBundleName];
    NSLog(@"App包名：%@", j);
    NSString *k = [SRTool GetAppName];
    NSLog(@"App名称：%@", k);
    NSString *l = [SRTool GetLastDeviceBootTime];
    NSLog(@"设备开机时间：%@", l);
    NSString *m = [SRTool GetLastSystemUpdateTime];
    NSLog(@"系统更新时间：%@", m);
    NSString *n = [SRTool GetDeivceMemorySize];
    NSLog(@"物理内存(可用容量)：%@", n);
    NSString *o = [SRTool GetDeviceDiskSize];
    NSLog(@"硬盘容量(总容量)：%@", o);
    NSString *p = [SRTool GetCarrierName];
    NSLog(@"运营商名称：%@", p);
    NSString *q = [SRTool GetBattaryChargeStatus];
    NSLog(@"电池状态：%@", q);
    NSString *r = [SRTool GetBatteryPercentage];
    NSLog(@"电量百分比：%@", r);
    NSString *s = [SRTool ISJailBroken];
    NSLog(@"是否越狱：%@", s);


    
    
    
    
}

- (void)action_2 {
    
    [self performSelector:@selector(testAction) withObject:nil afterDelay:3.0];

}

- (void)testAction {
    NSLog(@"====== test Action");
}

- (void)action_3 {

    
}

 

- (void)action_4 {

}


@end

