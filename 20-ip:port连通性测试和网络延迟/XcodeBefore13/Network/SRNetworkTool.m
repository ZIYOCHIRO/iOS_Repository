//
//  SRNetworkTool.m
//  XcodeBefore13
//
//  Created by ruixinyi on 2021/4/10.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import "SRNetworkTool.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import <netinet/in.h>
#include <arpa/inet.h>
#import "GCDAsyncSocket.h"

@interface SRNetworkTool ()<GCDAsyncSocketDelegate>

@end

@implementation SRNetworkTool

+ (void)PostRequestWithURL:(NSString *)URLStr
                   InfoDic:(NSDictionary *)InfoDic
              successBlock:(void(^)(id obj))successBlock
                 failBlock:(void(^)(void))failBlock {
    
    NSMutableString *InfoStr = [NSMutableString string];
    for (NSString *key in InfoDic.allKeys) {
        NSObject *value = [InfoDic valueForKey:key];
        [InfoStr appendFormat:@"%@=%@&", key, value];
    }
    
    if([InfoStr length] > 0){
        [InfoStr deleteCharactersInRange:NSMakeRange([InfoStr length] - 1, 1)];
    }
    
    //发起网络请求
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:URLStr] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0f];
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
    request.HTTPBody = [InfoStr dataUsingEncoding:NSUTF8StringEncoding];
    
    NSURLSessionTask *POST_Task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data == nil || ((NSHTTPURLResponse*)response).statusCode == 404) {
            failBlock();
            return;
        }
        //用base64解码
        NSData* decodeData = [[NSData alloc] initWithBase64EncodedData:data options:NSDataBase64DecodingIgnoreUnknownCharacters];
        //json序列化
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:decodeData options:NSJSONReadingMutableContainers error:nil];
        if (resultDic != nil) {
            successBlock(resultDic);
        } else {
            failBlock();
        }
        
    }];
    [POST_Task resume];
}

+ (void)GetRequestWithURL:(NSString *)URLStr
                  InfoDic:(NSDictionary *)InfoDic
             successBlock:(void(^)(id obj))successBlock
                failBlock:(void(^)(void))failBlock {
    NSMutableString *InfoStr = [NSMutableString string];
    for (NSString *key in InfoDic.allKeys) {
        NSObject *value = [InfoDic valueForKey:key];
        [InfoStr appendFormat:@"%@=%@&", key, value];
    }
    
    if([InfoStr length] > 0){
        [InfoStr deleteCharactersInRange:NSMakeRange([InfoStr length] - 1, 1)];
    }
    NSString *tarUrl = [NSString stringWithFormat:@"%@?%@",URLStr,InfoStr];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:tarUrl] cachePolicy:NSURLRequestReloadIgnoringCacheData timeoutInterval:5.0f];
    [request setHTTPMethod:@"GET"];
    
    NSURLSessionTask *GET_Task = [[NSURLSession sharedSession] dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if (data == nil || ((NSHTTPURLResponse*)response).statusCode == 404) {
            failBlock();
            return;
        }
        //用base64解码
        NSData* decodeData = [[NSData alloc] initWithBase64EncodedData:data options:NSDataBase64DecodingIgnoreUnknownCharacters];
        //json序列化
        NSDictionary *resultDic = [NSJSONSerialization JSONObjectWithData:decodeData options:NSJSONReadingMutableContainers error:nil];
        if (resultDic != nil) {
            successBlock(resultDic);
        } else {
            failBlock();
        }
    }];
    [GET_Task resume];
}


static void(^NetWorkCheckBlock)(int code, NSString *hostPortInfo);
static GCDAsyncSocket *clientSocket;
+ (void)NetworkConnected:(NSString *)ipAdress port:(int)port result:(void(^)(int code, NSString *hostPortInfo))resultBlock{
    NetWorkCheckBlock = resultBlock;
    dispatch_queue_t dispatchQueue = dispatch_queue_create("tcpClientQueue", NULL);
    clientSocket = [[GCDAsyncSocket alloc] initWithDelegate:self delegateQueue:dispatchQueue];
    [clientSocket connectToHost:ipAdress onPort:port withTimeout:3  error:nil];
    
}



#pragma mark- GCDAsyncSocketDelegate
+(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port {
    NSLog(@"====success回调【%@:%i】", host, port);
    clientSocket.delegate = nil;
    clientSocket = nil;
    if (NetWorkCheckBlock) {
        NetWorkCheckBlock(1, [NSString stringWithFormat:@"%@:%i", host, port]);
    }
}

+(void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err {
    NSLog(@"====fail回调【%@:%i】", sock.connectedHost, sock.connectedPort);
    clientSocket.delegate = nil;
    clientSocket = nil;
    if (NetWorkCheckBlock) {
        NetWorkCheckBlock(0, @"");
    }
}
@end
