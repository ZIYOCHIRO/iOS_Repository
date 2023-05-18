//
//  SRNetworkTool.h
//  XcodeBefore13
//
//  Created by ruixinyi on 2021/4/10.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SRNetworkTool : NSObject
+ (void)PostRequestWithURL:(NSString *)URLStr
                   InfoDic:(NSDictionary *)InfoDic
              successBlock:(void(^)(id obj))successBlock
                 failBlock:(void(^)(void))failBlock;

+ (void)GetRequestWithURL:(NSString *)URLStr
                  InfoDic:(NSDictionary *)InfoDic
             successBlock:(void(^)(id obj))successBlock
                failBlock:(void(^)(void))failBlock;

@end

NS_ASSUME_NONNULL_END
