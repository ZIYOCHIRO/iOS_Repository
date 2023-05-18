//
//  main.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import "NSObject+Test.h"
@interface SRPerson : NSObject

@end

@implementation SRPerson


@end
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"[SRPerson class] - %p", [SRPerson class]); // 0x100008138 SRPerson的类对象
        NSLog(@"[NSObject class] - %p", [NSObject class]); // 0x1fbd89188 NSObject的类对象
        // 类方法是SRPerson的类对象在调用
        [SRPerson test]; // 0x100008138
        [NSObject test]; // 0x1fbd89188
        
        
        // 调用的类方法，为什么实例方法也可以？不会报错
        // 因为OC的本质是发消息，只管方法名，不管前面的加减号
        // objc_msgSend(receiver, @selector(message))
        [SRPerson otherTest];
        [NSObject otherTest];
        
        // NSObject类存在名为 test 的类方法和实例方法，会先调用哪一个？
        [NSObject test];
    }
    return 0;
}


