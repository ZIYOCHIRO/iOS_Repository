//
//  SRLogView.h
//  BaseProject
//
//  Created by SammiRui on 2021/9/3.
//  Copyright © 2021 SammiRui. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol SRLogViewDelegate;
@interface SRLogView : UIView<UITextFieldDelegate>
@property (nonatomic, weak) id<SRLogViewDelegate> delegate;
- (void)updateLog:(NSString *)logStr level:(int)level;
@end

@protocol SRLogViewDelegate <NSObject>
@required
- (void)SRLogViewDidDestroyed;
@end
NS_ASSUME_NONNULL_END
