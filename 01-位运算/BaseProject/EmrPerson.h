//
//  EmrPerson.h
//  BaseProject
//
//  Created by ruixinyi on 2021/3/2.
//

#import <Foundation/Foundation.h>

@interface EmrPerson : NSObject

//@property (assign, nonatomic, getter=isTall) BOOL tall;
//@property (assign, nonatomic, getter=isRich) BOOL rich;
//@property (assign, nonatomic, getter=isHandsome) BOOL handsome;

- (void)setTall:(BOOL)tall;
- (void)setRich:(BOOL)rich;
- (void)setHandsome:(BOOL)handsome;

- (BOOL)isTall;
- (BOOL)isRich;
- (BOOL)isHandsome;
@end

