//
//  main.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import "SRMethod.h"
#import <objc/runtime.h>

@interface SRPerson : NSObject{
    @public
    int _age;
}
@property (nonatomic, assign) int height;
- (void)personInstanceMethod;
+ (void)personClassMethod;
@end
@implementation SRPerson
- (void)personInstanceMethod {}
+ (void)personClassMethod {}
@end


@interface SRStudent : SRPerson{
    @public
    int _no;
}
- (void)studentInstanceMethod;
+ (void)studentClassMethod;
@end
@implementation SRStudent
- (void)studentInstanceMethod {}
+ (void)studentClassMethod {}
@end



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        SRStudent *student = [[SRStudent alloc] init];
        Class studentClass = [student class];
        Class studentMetaClass = object_getClass([NSObject class]);
        /*  isa指针
         当调用对象方法时， 通过instance的isa找到class，最后找到对象方法的实现，进行调用
         [student studentInstanceMethod];
         由于 studentInstanceMethod 存储在 studentClass中，student会通过isa找到studentClass，再调用对象方法
         
         当调用类方法时，通过class的isa找到meta-class，最后找到类方法的实现，进行调用
         [SRStudent studentClassMethod];
         由于 studentClassMethod 存储在 studentMetaClass 中，SRStudent会通过isa找到 studentMetaClass，再调用类方法
         */
        [student studentInstanceMethod];
        [SRStudent studentClassMethod];
        
        /*  class对象的superclass指针
         当 SRStudent 的instance对象student要调用Person的对象方法时， 会先通过isa找到studentClass，再通过studentClass的superclass找到Person的class，最后找到对象方法的实现进行调用
         */
        [student personInstanceMethod];
        
        /* meta-class的superclass指针
        当SRStudent要调用Person的类方法，会通过isa找到SRStudent的meta-class，SRStudent的meta-class再通过superclass找到Person的meta-class，最后找到类方法的实现进行调用
         */
        [SRStudent personClassMethod];
        
        
        
    }
    return 0;
}
