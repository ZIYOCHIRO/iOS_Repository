//
//  main.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import "EmrMethod.h"
#import <objc/runtime.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //MARK: instance 对象
        //object1、object2是NSObject的 instance 对象
        //它们是不同的两个对象，分别占着两块不同的内存
        NSObject *object1 = [[NSObject alloc] init];
        NSObject *object2 = [[NSObject alloc] init];
        NSLog(@"%p, %p", object1, object2);
        
        //MARK: class 对象
        //objectClass1~objectClass5都是NSObject的class对象（类对象）
        //它们是同一个对象。每个类在内存中有且只有一个class对象
        Class objectClass1 = [object1 class];
        Class objectClass2 = [object2 class];
        Class objectClass3 = [NSObject class];
        Class objectClass4 = object_getClass(object1);
        Class objectClass5 = object_getClass(object2);
        NSLog(@"%p, %p, %p,%p, %p", objectClass1, objectClass2, objectClass3, objectClass4, objectClass5);
        
        //MARK: meta-class 对象
        //objectMetaClass是NSObject的meta-class对象
        //每个类在内存中有且只有一个meta-class对象（元类对象）
        //将类对象当作参数传入，获得元类对象
        Class objectMetaClass = object_getClass([NSObject class]);
        //MARK:NOTE: class方法返回的一直是class对象，类对象
        Class objectNOTMetaClass = [[[NSObject class] class] class];
        NSLog(@"%p, %p", objectMetaClass, objectNOTMetaClass);
        
        
    }
    return 0;
}
