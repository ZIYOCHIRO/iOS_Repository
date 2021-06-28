//
//  main.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/1.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        int a = 10;
        int b = 5;
        while (a >= 0 || b >= 0) {
            while (b >= 0) {
                b--;
                printf("a is %i, b is %i\n", a, b);
            }
            a--;
            printf("a is %i, b is %i\n", a, b);
            
        }
    }
    return 0;
}
