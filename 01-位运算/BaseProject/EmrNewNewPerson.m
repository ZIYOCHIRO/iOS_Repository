//
//  EmrNewNewPerson.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/3.
//

#import "EmrNewNewPerson.h"
#define EmrNewNewTallMask     (1<<0)   // 1 0b0000 0001
#define EmrNewNewRichMask     (1<<1)   // 2 0b0000 0010
#define EmrNewNewHandsomeMask (1<<2)   // 4 0b0000 0100

@interface EmrNewNewPerson() {
    union {
        char bits;
        struct {
            char tall : 1;
            char rich : 1;
            char handsome : 1;
        };
    }_tallRichHandsome;
    
}
@end
@implementation EmrNewNewPerson
- (void)setTall:(BOOL)tall{
    if (tall) {
        _tallRichHandsome.bits |= EmrNewNewTallMask;
    } else {
        _tallRichHandsome.bits &= ~EmrNewNewTallMask;
    }
}
- (void)setRich:(BOOL)rich{
    if (rich) {
        _tallRichHandsome.bits |= EmrNewNewRichMask;
    } else {
        _tallRichHandsome.bits &= ~EmrNewNewRichMask;
    }
}
- (void)setHandsome:(BOOL)handsome{
    if (handsome) {
        _tallRichHandsome.bits |= EmrNewNewHandsomeMask;
    } else {
        _tallRichHandsome.bits &= ~EmrNewNewHandsomeMask;
    }
}

- (BOOL)isTall{
    return !!(_tallRichHandsome.bits & EmrNewNewTallMask);
}
- (BOOL)isRich{
    return !!(_tallRichHandsome.bits & EmrNewNewRichMask);
}
- (BOOL)isHandsome{
    return !!(_tallRichHandsome.bits & EmrNewNewHandsomeMask);
}
@end
