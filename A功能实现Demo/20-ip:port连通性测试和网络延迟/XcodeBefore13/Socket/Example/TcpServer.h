
//
//  TcpServer.h
//  AsyncSocketDemo
//
//  Created by 555chy on 6/21/16.
//  Copyright © 2016 555chy. All rights reserved.
//
 
#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"
#import "ConnectionDef.h"
 
@interface TcpServer : NSObject  <GCDAsyncSocketDelegate> {
    GCDAsyncSocket *serverSocket;
    NSMutableArray *clientArray;
    long readTag;
    long writeTag;
}
 
-(long)getReadTag;
-(long)getWriteTag;
-(void)createTcpSocket:(const char *)queueName acceptOnPort:(uint16_t)port;
-(void)socket:(GCDAsyncSocket *)sock didAcceptNewSocket:(GCDAsyncSocket *)newSocket;
-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag;
-(void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag;
-(void)socket:(GCDAsyncSocket *)sock writeString:(NSString *)str withTag:(long)tag;
-(void)broadcastStr:(NSString *)str;
-(void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err;
@end
