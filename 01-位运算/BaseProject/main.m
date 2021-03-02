//
//  main.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import "EmrPerson.h"
#import "EmrNewPerson.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        EmrPerson *person = [[EmrPerson alloc] init];
        
        [person setTall:YES];
        [person setRich:YES];
        [person setHandsome:NO];
        
        NSLog(@"tall is %d, rich is %d, handsome is %d", person.isTall, person.isRich, person.isHandsome);
        
        EmrNewPerson *newPerson = [[EmrNewPerson alloc] init];
        
        [newPerson setTall:YES];
        [newPerson setRich:YES];
        [newPerson setHandsome:YES];
        
        NSLog(@"tall is %d, rich is %d, handsome is %d", newPerson.isTall, newPerson.isRich, newPerson.isHandsome);
    }
    return 0;
}
