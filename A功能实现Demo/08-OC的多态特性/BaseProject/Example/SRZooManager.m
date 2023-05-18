//
//  SRZooManager.m
//  BaseProject
//
//  Created by ruixinyi on 2021/3/25.
//

#import "SRZooManager.h"
#import "SRAnimal.h"
@interface SRZooManager() {
    NSMutableDictionary<NSString *, Class> *RegisterAnimalBook;
}
@end

@implementation SRZooManager




+ (SRZooManager *)sharedRegistry{
    static dispatch_once_t once;
    static SRZooManager *_instance;
    dispatch_once(&once, ^ {
        _instance = [[SRZooManager alloc] init];
    });
    return _instance;
}
- (instancetype)init{
    
    self = [super init];
    if (self) {
        RegisterAnimalBook = [NSMutableDictionary dictionary];

    }
    return self;
}


- (void)animalRegisterClass:(Class)animalClass withId:(NSString *)animalId {
    RegisterAnimalBook[animalId] = animalClass;
}


- (void)DailyRoutine {
    // 给每一个动物喂食
    for (NSString *animalId in RegisterAnimalBook.allKeys) {
        Class animalClass = RegisterAnimalBook[animalId];
        SRAnimal *currentAnimal = [[animalClass alloc] init];
        [currentAnimal eatFood];
    }
}
@end
