//
//  EmrNewPerson.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/2.
//

#import "EmrNewPerson.h"
@interface EmrNewPerson() {
    // 位域
    struct {
        char tall : 1; // 指定只占一位， 不指定的话占一个字节
        char rich : 1;
        char handsome : 1;
    } _tallRichHandsome; // 整体占一个字节 0b0000 0000
}
@end

@implementation EmrNewPerson
- (void)setTall:(BOOL)tall {
    _tallRichHandsome.tall = tall;
}
- (void)setRich:(BOOL)rich {
    _tallRichHandsome.rich = rich;
}
- (void)setHandsome:(BOOL)handsome {
    _tallRichHandsome.handsome = handsome;
}

- (BOOL)isTall {
    return !!_tallRichHandsome.tall;
}
- (BOOL)isRich {
    return !!_tallRichHandsome.rich;
}
- (BOOL)isHandsome {
    return !!_tallRichHandsome.handsome;
}
@end
