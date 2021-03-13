//
//  main.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import "EmrMethod.h"
#import <malloc/malloc.h>
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
        
        //NSObject类的实例对象内部只使用了8个字节的空间
        //NSObject对象内部只有一个isa指针，占用8个字节的空间
        NSLog(@"%zd",class_getInstanceSize([NSObject class]));
        
        //系统分配了16个字节给NSObject对象
        NSLog(@"%zd", malloc_size((__bridge const void *)(obj)));
        
    }
    return 0;
}
