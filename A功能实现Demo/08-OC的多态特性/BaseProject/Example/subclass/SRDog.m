//
//  SRDog.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/25.
//

#import "SRDog.h"
#import "SRZooManager.h"
@implementation SRDog

+ (void)load {
    [[SRZooManager sharedRegistry] animalRegisterClass:self withId:@"dog"];
}


- (void)eatFood {
    NSLog(@"Dog is eating food");
}
@end
