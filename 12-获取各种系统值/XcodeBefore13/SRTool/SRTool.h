//
//  SRTool.h
//  XcodeBefore13
//
//  Created by ruixinyi on 2021/4/2.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface SRTool : NSObject
// 设备型号 iPhone11
+ (NSString *)GetDeviceModel;
// 用户设置的设备名称 MyiPhone8
+ (NSString *)GetPhoneName;
// 系统版本 iOS 14.2
+ (NSString *)GetSystemVersion;
// 物理尺寸 375.0 x 667.0
+ (NSString *)GetDevicePhysicalSize;
// 分辨率 750.0 x 1334.0
+ (NSString *)GetDeviceResolution;
// 系统语言 en_US
+ (NSString *)GetSystemLanguage;
// 系统地区
+ (NSString *)GetSystemRegion;
// 国家代码
+ (NSString *)GetSystemCountryCode;
// App当前版本号
+ (NSString *)GetAppVersion;
// App包名
+ (NSString *)GetAppBundleName;
// App名称
+ (NSString *)GetAppName;
// 运营商
+ (NSString *)GetCarrierName;
//==========================================





// 是否越狱
+ (BOOL)ISJailBroken;

// 设备最近开机时间
+ (NSString *)GetLastDeviceBootTime;
// 系统最近更新时间
+ (NSString *)GetLastSystemUpdateTime;
// 手机总容量大小 128GB
+ (NSString *)GetDeivceMemorySize;
// 手机可用容量大小 13.3GB
+ (NSString *)GetDeviceAvailableMemorySize;
// 电池充电状态 -1:未知 0:未充电 1:充电
+ (int)GetBattaryChargeStatus;
// 电池电量百分比 0.93(93%)
+ (double)GetBatteryPercentage;
@end

