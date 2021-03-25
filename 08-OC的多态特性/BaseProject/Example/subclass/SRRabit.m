//
//  SRRabit.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/25.
//

#import "SRRabit.h"
#import "SRZooManager.h"

@implementation SRRabit

+ (void)load {
    [[SRZooManager sharedRegistry] animalRegisterClass:self withId:@"rabit"];
}

- (void)eatFood {
    NSLog(@"Rabit is eating food");
}
@end
