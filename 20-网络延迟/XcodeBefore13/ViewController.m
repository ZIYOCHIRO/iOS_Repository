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


#import "STSimplePing.h"
#import "STDPingServices.h"
#import "SimplePing.h"
#import "SRNetworkTool.h"


@interface ViewController ()<SimplePingDelegate> {
    NSString *personName;
    STDPingServices *pingServices; // Custom
    SimplePing *pingSimple; // Apple
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
    personName = @"testname";
    NSLog(@"dddd");
    pingServices = [STDPingServices startPingAddress:@"147.139.36.57" callbackHandler:^(STDPingItem *pingItem, NSArray *pingItems) {
        if (pingItem.status != STDPingStatusFinished) {
            NSLog(@"网络延迟  %.0fms", pingItem.timeMilliseconds);
        }else {
            //NSLog(@"%@", [STDPingItem statisticsWithPingItems:pingItems]);
            NSLog(@"Finished");
        }
    }];
    
}

- (void)action_2 {
    [pingServices cancel];
}


- (void)action_3 {

    pingSimple = [[SimplePing alloc] initWithHostName:@"gzyd.dasaric.pw"];
    pingSimple.addressStyle = SimplePingAddressStyleICMPv4;
    pingSimple.delegate = self;
    [pingSimple start];
}

 

- (void)action_4 {
    [SRNetworkTool GetRequestWithURL:@"https://ssrtool.us/tool/api/check_cn1" InfoDic:@{@"ip":@"49.51.169.23", @"port":@"2666"} successBlock:^(id  _Nonnull obj) {
            NSLog(@"success");
        } failBlock:^{
            //
        }];
}

// [pingSimple start] 成功之后，解析 HostName 拿到 ip 地址之后，发送封包
- (void)simplePing:(SimplePing *)pinger didStartWithAddress:(NSData *)address
{
    //这里面可以创建一个时间戳NSTimer定时发送数据监测
    [pingSimple sendPingWithData:nil];
}

// [pingSimple start] ping 功能启动失败
- (void)simplePing:(SimplePing *)pinger didFailWithError:(NSError *)error
{
    //停止所以的请求，如果有时间戳也停止
    [pingSimple stop];
}

// sendPingWithData 发送数据成功
- (void)simplePing:(SimplePing *)pinger didSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber
{
    NSLog(@"#%u sent", sequenceNumber);
}

 // sendPingWithData 发送数据失败，并返回错误信息
- (void)simplePing:(SimplePing *)pinger didFailToSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber error:(NSError *)error
{
     NSLog(@"#%u send failed: %@", sequenceNumber,error);
}

// ping 发送封包之后收到响应
- (void)simplePing:(SimplePing *)pinger didReceivePingResponsePacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber
{
    NSLog(@"#%u received, size=%zu", sequenceNumber, packet.length);
}

// ping 接收响应封包发生异常
- (void)simplePing:(SimplePing *)pinger didReceiveUnexpectedPacket:(NSData *)packet
{
    NSLog(@"unexpected packet, size=%zu", packet.length);
}

@end

