//
//  main.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/1.
//

#import <Foundation/Foundation.h>
#import "SRZooManager.h"
// MARK: Parent
@interface SRParent: NSObject {
}
- (void)getAd;
@end
@implementation SRParent
- (void)getAd {
    NSLog(@"parent do some actions");
}
@end


// MARK: Child
@interface SRChild: SRParent {
}
- (void)getAd;
@end
@implementation SRChild
- (void)getAd {
    NSLog(@"child do some actions");
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //多态
        //多态就是用父类类型的指针创建子类的对象，比如Child类继承了Parent类，
        //代码的体现：Parent类型的指针指向Dog
        SRParent *parent = [[SRChild alloc] init];
        [parent getAd];
        
        //======================
        
        [[SRZooManager sharedRegistry] DailyRoutine];
    }
    return 0;
}
