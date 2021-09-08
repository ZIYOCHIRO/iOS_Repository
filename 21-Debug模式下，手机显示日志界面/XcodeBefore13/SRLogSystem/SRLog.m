//
//  SRLog.m
//  BaseProject
//
//  Created by SammiRui on 2021/9/1.
//  Copyright © 2021 SammiRui. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SRLog.h"
#import "SRLogView.h"
#import "SimplePing.h"
#define INTRANET @"www.google.com"  //www.google.com www.baidu.com 192.168.10.9
static BOOL INTRANET_REACHABLE = NO;
static SRLogView *LogView;

@interface SRLog ()<SRLogViewDelegate, SimplePingDelegate>{
    SimplePing *simplePing;
}

@end

@implementation SRLog

+ (SRLog *)sharedInstance {
    static SRLog *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[SRLog alloc] init];
    });
    return instance;
}

+ (void)StartAction {
    UITapGestureRecognizer *fiveFingerRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(FiveFingerEventTriggered)];
    fiveFingerRecognizer.numberOfTapsRequired = 5;
    fiveFingerRecognizer.numberOfTouchesRequired = 1;
    [[UIApplication sharedApplication].keyWindow.rootViewController.view addGestureRecognizer:fiveFingerRecognizer];
    
    [[SRLog sharedInstance] startNetworkCheck];
}

+ (void)FiveFingerEventTriggered {
    NSLog(@"This is dddddd");
    //DEBUG_LEVEL = INTRANET_REACHABLE + 1;
    
#ifdef UNITY_GAME
    
#elif defined  UNITY_COCOS_GAME

#else
    
#endif
}


// visible 0-关闭 1-打开
+ (void)ShowLogView:(int)canShow {
    [[SRLog sharedInstance] setLogViewVisible:canShow];
}

// 在window上面加
+ (void)LogLevel:(NSString *)level tag:(NSString *)tag content:(NSString *)content {
    [LogView updateLog:content level:1];
}


- (void)setLogViewVisible:(int)visible {
    if (visible == 0) {
        if (LogView) {
            dispatch_async(dispatch_get_main_queue(), ^{
                LogView.delegate = nil;
                [LogView removeFromSuperview];
                LogView = nil;
            });
        }
    } else {
        if (LogView) {
            return;
        }
        LogView = [[SRLogView alloc] initWithFrame:CGRectMake([UIScreen mainScreen].bounds.size.width - 50, 100, 40, 40)];
        LogView.delegate = self;
        [[UIApplication sharedApplication].keyWindow addSubview:LogView];
    }
}

#pragma mark - SRLogViewDelegate
- (void)SRLogViewDidDestroyed {
    [SRLog ShowLogView:0];
}

- (void)startNetworkCheck {
    simplePing = [[SimplePing alloc] initWithHostName:INTRANET];
    simplePing.addressStyle = SimplePingAddressStyleAny;
    simplePing.delegate = self;
    [simplePing start];
    
    
    
    
}

- (void)stopPing {
    if (simplePing) {
        NSLog(@"SRLog -stop");
        [simplePing stop];
        simplePing.delegate = nil;
        simplePing = nil;
        NSLog(@"SRLog -simplePing 是否可以连接内网：%i", INTRANET_REACHABLE);
    }
    
    
}



#pragma mark - SimplePingDelegate
// [pingSimple start] 成功之后，解析 HostName 拿到 ip 地址之后，发送封包
- (void)simplePing:(SimplePing *)pinger didStartWithAddress:(NSData *)address
{
    NSLog(@"SRLog -simplePing didStartWithAddress");
    //这里面可以创建一个时间戳NSTimer定时发送数据监测,1秒之后没接收到成功的回调当失败处理
    [simplePing sendPingWithData:nil];
    [self performSelector:@selector(stopPing) withObject:nil afterDelay:1.0];
}

// [pingSimple start] ping 功能启动失败
- (void)simplePing:(SimplePing *)pinger didFailWithError:(NSError *)error
{
    //停止所有的请求，如果有时间戳也停止
    NSLog(@"SRLog -simplePing -fail, didFailWithError:%@", error);
    INTRANET_REACHABLE = NO;
    [self stopPing];
}

// sendPingWithData 发送数据成功
- (void)simplePing:(SimplePing *)pinger didSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber
{
    NSLog(@"SRLog -simplePing didSendPacket");
}

 // sendPingWithData 发送数据失败，并返回错误信息
- (void)simplePing:(SimplePing *)pinger didFailToSendPacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber error:(NSError *)error
{
    NSLog(@"SRLog -simplePing -fail, didFailToSendPacket, error: %@", error);
    INTRANET_REACHABLE = NO;
    [self stopPing];
}

// ping 发送封包之后收到响应
- (void)simplePing:(SimplePing *)pinger didReceivePingResponsePacket:(NSData *)packet sequenceNumber:(uint16_t)sequenceNumber
{
    NSLog(@"SRLog -simplePing -success, didReceivePingResponsePacket");
    INTRANET_REACHABLE = YES;
    [self stopPing];
}

// ping 接收响应封包发生异常
- (void)simplePing:(SimplePing *)pinger didReceiveUnexpectedPacket:(NSData *)packet
{
    NSLog(@"SRLog -simplePing -success, didReceiveUnexpectedPacket");
    INTRANET_REACHABLE = YES;
    [self stopPing];
}
@end
