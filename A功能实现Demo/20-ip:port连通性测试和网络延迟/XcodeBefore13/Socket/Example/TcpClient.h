
//
//  TcpClient.h
//  AsyncSocketDemo
//
//  Created by 555chy on 6/21/16.
//  Copyright © 2016 555chy. All rights reserved.
//
 
#import <Foundation/Foundation.h>
#import "GCDAsyncSocket.h"
#import "ConnectionDef.h"
 
@interface TcpClient : NSObject<GCDAsyncSocketDelegate> {
    GCDAsyncSocket *clientSocket;
    long readTag;
    long writeTag;
}
 
-(long)getReadTag;
-(long)getWriteTag;
-(void)createTcpSocket:(const char *)queueName connectToHost:(NSString *) host onPort:(uint16_t)port;
-(void)socket:(GCDAsyncSocket *)sock didConnectToHost:(NSString *)host port:(uint16_t)port;
-(void)socket:(GCDAsyncSocket *)sock didReadData:(NSData *)data withTag:(long)tag;
-(void)socket:(GCDAsyncSocket *)sock didWriteDataWithTag:(long)tag;
-(void)writeString:(NSString *)str withTag:(long)tag;
-(void)socketDidDisconnect:(GCDAsyncSocket *)sock withError:(NSError *)err;
@end
