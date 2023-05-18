//
//  NSObject+Test.m
//  BaseProject
//
//  Created by ruixinyi on 2021/4/1.
//

#import "NSObject+Test.h"

@implementation NSObject (Test)

+ (void)test {
    NSLog(@"+[NSObject test] - %p", self);
}

- (void)test {
    NSLog(@"+[NSObject test] - %p", self);
}
@end
