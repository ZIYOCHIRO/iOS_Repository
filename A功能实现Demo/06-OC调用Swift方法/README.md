

* Swift中的方法前面加`@objc`标识
```
 @objc public func subMethod(A: Int, B: Int) -> Int {
        let sub = A - B;
        print("sub is \(sub)")
        return sub
    }
```

* 在.m文件上，import一个中间层头文件（XcodeBefore13-Swift.h），这个头文件不是在创建Swift文件的时候生成的Bridging Header， 而是[工程名称XXX-Swift.h]，工程名称可以在Build Setting里搜索Product Name
```
#import "ViewController.h"
#import "XcodeBefore13-Swift.h"
```
* 这个中间层头文件（XcodeBefore13-Swift.h），跟进长这样，大概就是Swift的方法名全部转成了OC的方法名
```
SWIFT_CLASS("_TtC13XcodeBefore138SRMethod")
@interface SRMethod : NSObject
+ (NSInteger)SumMethdWithA:(NSInteger)A B:(NSInteger)B SWIFT_WARN_UNUSED_RESULT;
- (NSInteger)subMethodWithA:(NSInteger)A B:(NSInteger)B SWIFT_WARN_UNUSED_RESULT;
- (void)methodWithBlockWithA:(NSInteger)A callBack:(void (^ _Nonnull)(NSInteger, NSString * _Nonnull))callBack;
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end
```

* 然后就可以调用了
```
SRMethod *method = [[SRMethod alloc] init];
[method subMethodWithA:3 B:2];
```