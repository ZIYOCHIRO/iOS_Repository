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

struct NSObject_IMPL {
    Class isa;
};

struct Person_IMPL {
    struct NSObject_IMPL NSObject_IVARS; // 8
    int _age; // 4
    int _height; // 4
}; // 需要16个字节的存储空间

struct Student_IMPL {
    struct Person_IMPL Person_IVARS; //16
    int _no;//4
}; //24 下面解释为什么不是20，而是24



/*
struct Student_IMPL {
    Class isa; // 8
    int _age; // 4
    int _height; // 4
    int _no; //4
}; //20
 内存对齐：结构体的大小必须是最大成员大小的倍数，所以是24不是20
*/




// Person
@interface Person : NSObject {
    @public
    int _age;
    int _height;
}
@end
@implementation Person
@end
// Student
@interface Student : Person {
    @public
    int _no;
}
@end
@implementation Student
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSObject *obj = [[NSObject alloc] init];
        // 获得NSObject类的实例对象的大小
        // 获得NSObject类的实例对象的成员变量所占用的大小：8
        //NSObject类的实例对象内部只使用了8个字节的空间
        //NSObject对象内部只有一个isa指针，占用8个字节的空间
        NSLog(@"%zd",class_getInstanceSize([NSObject class]));
        
        // 获得obj指针所指向内存的大小:16
        //系统分配了16个字节给NSObject对象
        NSLog(@"%zd", malloc_size((__bridge const void *)(obj)));
        
        
        
        Person *person = [[Person alloc] init];
        NSLog(@"%zd, %zd",
              class_getInstanceSize([Person class]),  // 16
              malloc_size((__bridge const void *)person)); //16
        
        Student *student = [[Student alloc] init];
        NSLog(@"%zd, %zd",
              class_getInstanceSize([Student class]),  // 24
              malloc_size((__bridge const void *)student)); //32
        student->_age = 3;
        student->_no = 8;

    }
    return 0;
}
