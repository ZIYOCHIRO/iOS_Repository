//
//  main.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>
@interface SRPerson: NSObject {
}
@end
@implementation SRPerson
@end


int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // instance
        SRPerson *person = [[SRPerson alloc] init];
        // class
        Class personClass = [person class];
        // meta-class
        Class personMetaclass = object_getClass(personClass);
    }
    return 0;
}
