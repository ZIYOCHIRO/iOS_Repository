//
//  SRZooManager.h
//  BaseProject
//
//  Created by ruixinyi on 2021/3/25.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRZooManager : NSObject

+ (SRZooManager *)sharedRegistry;
// 每种动物都需要注册
- (void)animalRegisterClass:(Class)animalClass withId:(NSString *)animalId;
// 日常工作：给注册的动物喂食
- (void)DailyRoutine;
@end

NS_ASSUME_NONNULL_END
