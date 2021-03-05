//
//  SRExample.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/4.
//

#import "SRExample.h"

typedef enum {
    SROptionOne   = 1, //0b0001 
    SROptionTwo   = 2, //0b0010
    SROptionThree = 4, //0b0100
    SROptionFour  = 8  //0b1000
} SROptions;
@implementation SRExample

- (void)setOptions:(SROptions)options {
    if (options & SROptionOne) {
        NSLog(@"包含了SROptionOne");
    } else if (options & SROptionTwo){
        NSLog(@"包含了SROptionTwo");
    } else if (options & SROptionThree){
        NSLog(@"包含了SROptionThree");
    } else if (options & SROptionFour) {
        NSLog(@"包含了SROptionFour");
    }
}


- (void)testMethod {
    // 在setOption的时候是怎么知道传入了哪几个option？
    [self setOptions: SROptionOne | SROptionTwo | SROptionFour];
    /*
     0b0001
   | 0b0010
   | 0b1000
     -------
     0b1011
     */
    
    
    /*
     位运算实际应用
     
     self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleTopMargin;

     NSKeyValueObservingOptions options = NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld;
     [self addObserver:self forKeyPath:@"tall" options:options context:NULL];
     */
    
}
@end
