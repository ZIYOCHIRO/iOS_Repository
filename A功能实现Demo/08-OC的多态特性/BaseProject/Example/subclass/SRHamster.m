//
//  SRHamster.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/25.
//

#import "SRHamster.h"
#import "SRZooManager.h"

@implementation SRHamster

+ (void)load {
    [[SRZooManager sharedRegistry] animalRegisterClass:self withId:@"hamster"];
}


- (void)eatFood {
    NSLog(@"Hamster is eating food");
}
@end
