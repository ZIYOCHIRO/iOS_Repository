//
//  EmrPerson.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/2.
//

#import "EmrPerson.h"
#define EmrTallMask     (1<<0)   // 1 0b0000 0001
#define EmrRichMask     (1<<1)   // 2 0b0000 0010
#define EmrHandsomeMask (1<<2)   // 4 0b0000 0100

@interface EmrPerson() {
    char _tallRichHandsome;  // 用一个Char类型代替3个property 0b0000 0011
}
@end

@implementation EmrPerson

- (void)setTall:(BOOL)tall {
    if (tall) {
        _tallRichHandsome |= EmrTallMask;
    } else {
        _tallRichHandsome &= ~EmrTallMask;
    }
}
- (void)setRich:(BOOL)rich {
    if (rich) {
        _tallRichHandsome |= EmrRichMask;
    } else {
        _tallRichHandsome &= ~EmrRichMask;
    }
}
- (void)setHandsome:(BOOL)handsome {
    if (handsome) {
        _tallRichHandsome |= EmrHandsomeMask;
    } else {
        _tallRichHandsome &= ~EmrHandsomeMask;
    }
}

- (BOOL)isTall {
    return !!(_tallRichHandsome & EmrTallMask);
}
- (BOOL)isRich {
    return !!(_tallRichHandsome & EmrRichMask);
}
- (BOOL)isHandsome {
    return !!(_tallRichHandsome & EmrHandsomeMask);
}

@end
