//
//  SRTool.m
//  XcodeBefore13
//
//  Created by ruixinyi on 2021/4/2.
//  Copyright © 2021 ruixinyi. All rights reserved.
//

#import "SRTool.h"
#import <UIKit/UIKit.h>
#import "sys/utsname.h"
#import <sys/sysctl.h>
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>

@implementation SRTool
+ (NSString *)GetDeviceModel {
    struct utsname systemInfo;
        uname(&systemInfo);
        NSString *deviceModel = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];

    #pragma mark iPhone

        if ([deviceModel isEqualToString:@"iPhone1,1"])    return @"iPhone 1G";
        if ([deviceModel isEqualToString:@"iPhone1,2"] ||
            [deviceModel isEqualToString:@"iPhone1,2*"])   return @"iPhone 3G";
        if ([deviceModel isEqualToString:@"iPhone2,1"] ||
            [deviceModel isEqualToString:@"iPhone2,1*"])   return @"iPhone 3GS";
        if ([deviceModel isEqualToString:@"iPhone3,1"] ||
            [deviceModel isEqualToString:@"iPhone3,2"] ||
            [deviceModel isEqualToString:@"iPhone3,3"])    return @"iPhone 4";
        if ([deviceModel isEqualToString:@"iPhone4,1"] ||
            [deviceModel isEqualToString:@"iPhone4,1*"])   return @"iPhone 4S";
        if ([deviceModel isEqualToString:@"iPhone5,1"] ||
            [deviceModel isEqualToString:@"iPhone5,2"])    return @"iPhone 5";
        if ([deviceModel isEqualToString:@"iPhone5,3"] ||
            [deviceModel isEqualToString:@"iPhone5,4"])    return @"iPhone 5C";
        if ([deviceModel isEqualToString:@"iPhone6,1"] ||
            [deviceModel isEqualToString:@"iPhone6,2"])    return @"iPhone 5S";
        if ([deviceModel isEqualToString:@"iPhone7,2"])    return @"iPhone 6";
        if ([deviceModel isEqualToString:@"iPhone7,1"])    return @"iPhone 6 Plus";
        if ([deviceModel isEqualToString:@"iPhone8,1"])    return @"iPhone 6s";
        if ([deviceModel isEqualToString:@"iPhone8,2"])    return @"iPhone 6s Plus";
        if ([deviceModel isEqualToString:@"iPhone8,4"])    return @"iPhone SE";
        if ([deviceModel isEqualToString:@"iPhone9,1"] ||
            [deviceModel isEqualToString:@"iPhone9,3"])    return @"iPhone 7";
        if ([deviceModel isEqualToString:@"iPhone9,2"] ||
            [deviceModel isEqualToString:@"iPhone9,4"])    return @"iPhone 7 Plus";
        if ([deviceModel isEqualToString:@"iPhone10,1"] ||
            [deviceModel isEqualToString:@"iPhone10,4"])   return @"iPhone 8";
        if ([deviceModel isEqualToString:@"iPhone10,2"] ||
            [deviceModel isEqualToString:@"iPhone10,5"])   return @"iPhone 8 Plus";
        if ([deviceModel isEqualToString:@"iPhone10,3"] ||
            [deviceModel isEqualToString:@"iPhone10,6"])   return @"iPhone X";
        if ([deviceModel isEqualToString:@"iPhone11,2"])   return @"iPhone XS";
        if ([deviceModel isEqualToString:@"iPhone11,6"])   return @"iPhone XS Max";
        if ([deviceModel isEqualToString:@"iPhone11,8"])   return @"iPhone XR";
        if ([deviceModel isEqualToString:@"iPhone12,1"])   return @"iPhone 11";
        if ([deviceModel isEqualToString:@"iPhone12,3"])   return @"iPhone 11 Pro";
        if ([deviceModel isEqualToString:@"iPhone12,5"])   return @"iPhone 11 Pro Max";
        if ([deviceModel isEqualToString:@"iPhone12,8"])   return @"iPhone SE Gen2";

    #pragma mark iPad

        if ([deviceModel isEqualToString:@"iPad1,1"])      return @"iPad 1";
        if ([deviceModel isEqualToString:@"iPad2,1"] ||
            [deviceModel isEqualToString:@"iPad2,2"] ||
            [deviceModel isEqualToString:@"iPad2,3"] ||
            [deviceModel isEqualToString:@"iPad2,4"])      return @"iPad 2";
        if ([deviceModel isEqualToString:@"iPad3,1"] ||
            [deviceModel isEqualToString:@"iPad3,2"] ||
            [deviceModel isEqualToString:@"iPad3,3"])      return @"iPad 3";
        if ([deviceModel isEqualToString:@"iPad3,4"] ||
            [deviceModel isEqualToString:@"iPad3,5"] ||
            [deviceModel isEqualToString:@"iPad3,6"])      return @"iPad 4";
        if ([deviceModel isEqualToString:@"iPad2,5"] ||
            [deviceModel isEqualToString:@"iPad2,6"] ||
            [deviceModel isEqualToString:@"iPad2,7"])      return @"iPad mini";
        if ([deviceModel isEqualToString:@"iPad4,1"] ||
            [deviceModel isEqualToString:@"iPad4,2"] ||
            [deviceModel isEqualToString:@"iPad4,3"])      return @"iPad Air";
        if ([deviceModel isEqualToString:@"iPad4,4"] ||
            [deviceModel isEqualToString:@"iPad4,5"] ||
            [deviceModel isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
        if ([deviceModel isEqualToString:@"iPad5,3"] ||
            [deviceModel isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
        if ([deviceModel isEqualToString:@"iPad4,7"] ||
            [deviceModel isEqualToString:@"iPad4,8"] ||
            [deviceModel isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
        if ([deviceModel isEqualToString:@"iPad5,1"] ||
            [deviceModel isEqualToString:@"iPad5,2"])      return @"iPad mini 4";
        if ([deviceModel isEqualToString:@"iPad6,7"] ||
            [deviceModel isEqualToString:@"iPad6,8"])      return @"iPad PRO 12.9 Gen1";
        if ([deviceModel isEqualToString:@"iPad6,3"] ||
            [deviceModel isEqualToString:@"iPad6,4"])      return @"iPad PRO 9.7 Gen1";
        if ([deviceModel isEqualToString:@"iPad6,11"] ||
            [deviceModel isEqualToString:@"iPad6,12"])     return @"iPad 9.7 Gen1";
        if ([deviceModel isEqualToString:@"iPad7,3"] ||
            [deviceModel isEqualToString:@"iPad7,4"])      return @"iPad PRO 10.5 Gen1";
        if ([deviceModel isEqualToString:@"iPad7,1"] ||
            [deviceModel isEqualToString:@"iPad7,2"])      return @"iPad PRO 2 12.9 Gen2";
        if ([deviceModel isEqualToString:@"iPad7,5"] ||
            [deviceModel isEqualToString:@"iPad7,6"])      return @"iPad 9.7 Gen2";
        if ([deviceModel isEqualToString:@"iPad8,1"] ||
            [deviceModel isEqualToString:@"iPad8,2**"] ||
            [deviceModel isEqualToString:@"iPad8,3"] ||
            [deviceModel isEqualToString:@"iPad8,4**"])    return @"iPad Pro 11 Gen1";
        if ([deviceModel isEqualToString:@"iPad8,5"] ||
            [deviceModel isEqualToString:@"iPad8,6**"] ||
            [deviceModel isEqualToString:@"iPad8,7"] ||
            [deviceModel isEqualToString:@"iPad8,8**"])    return @"iPad Pro 12.9 Gen3";
        if ([deviceModel isEqualToString:@"iPad11,3"] ||
            [deviceModel isEqualToString:@"iPad11,4"])      return @"iPad Air 3";
        if ([deviceModel isEqualToString:@"iPad11,1"] ||
            [deviceModel isEqualToString:@"iPad11,2"])      return @"iPad Mini 5";
        if ([deviceModel isEqualToString:@"iPad7,11"] ||
            [deviceModel isEqualToString:@"iPad7,12"])       return @"iPad 10.2";
        if ([deviceModel isEqualToString:@"iPad8,9"] ||
            [deviceModel isEqualToString:@"iPad8,10"])       return @"iPad Pro 11 Gen2";
        if ([deviceModel isEqualToString:@"iPad8,11"] ||
            [deviceModel isEqualToString:@"iPad8,12"])       return @"iPad Pro 12.9 Gen4";

    #pragma mark Simulator

        if ([deviceModel isEqualToString:@"i386"] ||
            [deviceModel isEqualToString:@"x86_64"])       return @"Simulator";

        return deviceModel;
}

+ (NSString *)GetPhoneName {
    return [[UIDevice currentDevice] name];
}

+ (NSString *)GetSystemVersion {
    return [[UIDevice currentDevice] systemVersion];
}

+ (NSString *)GetDevicePhysicalSize {
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    return [NSString stringWithFormat:@"%.1f x %.1f", width, height];
}

+ (NSString *)GetDeviceResolution {
    CGRect rect = [[UIScreen mainScreen] bounds];
    CGSize size = rect.size;
    CGFloat width = size.width;
    CGFloat height = size.height;
    CGFloat scale_screen = [UIScreen mainScreen].scale;
    return [NSString stringWithFormat:@"%.1f x %.1f", width * scale_screen, height * scale_screen];
}

+ (NSString *)GetSystemLanguage {
    NSString *systemLanguage = [[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"][0];
//    NSString *pfLanguageCode = [NSLocale preferredLanguages][0];
//    NSString *localeLanguageCode = [[NSLocale currentLocale] objectForKey:NSLocaleLanguageCode];
//    NSString *language =  [[NSBundle mainBundle] preferredLocalizations][0];
    return systemLanguage;
}

+ (NSString *)GetSystemRegion {
    NSString *identifier = [[NSLocale currentLocale] localeIdentifier];
    NSString *displayName = [[NSLocale currentLocale] displayNameForKey:NSLocaleIdentifier value:identifier];
    return displayName;
}

+ (NSString *)GetSystemCountryCode {
    return [[NSLocale currentLocale] localeIdentifier];
}

+ (NSString *)GetAppVersion {
    NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
    // version：1.0.1
    NSString *appCurVersion = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
    // Build : 1
    NSString *appCurVersionNum = [infoDictionary objectForKey:@"CFBundleVersion"];
    return appCurVersion;
}

+ (NSString *)GetAppBundleName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleIdentifier"];
}

+ (NSString *)GetAppName {
    return [[NSBundle mainBundle] objectForInfoDictionaryKey:@"CFBundleName"];
}

+ (NSString *)GetLastDeviceBootTime {
    struct timeval boottime;
    size_t len = sizeof(boottime);
    int mib[2] = {CTL_KERN, KERN_BOOTTIME};
    if (sysctl(mib, 2, &boottime, &len, NULL, 0) < 0) {
        return @"0";
    }
    return [NSString stringWithFormat:@"%ld",boottime.tv_sec ];
    
    
}

+(NSString *)GetLastSystemUpdateTime {
    NSString *result = nil;
    NSString *information = @"L3Zhci9tb2JpbGUvTGlicmFyeS9Vc2VyQ29uZmlndXJhdGlvblByb2ZpbGVzL1B1YmxpY0luZm8vTUNNZXRhLnBsaXN0";
    NSData *data=[[NSData alloc]initWithBase64EncodedString:information options:0];
    NSString *dataString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
    NSError *error = nil;
    NSDictionary *fileAttributes = [[NSFileManager defaultManager] attributesOfItemAtPath:dataString error:&error];
    if (fileAttributes) {
        id singleAttibute = [fileAttributes objectForKey:NSFileCreationDate];
        if ([singleAttibute isKindOfClass:[NSDate class]]) {
            NSDate *dataDate = singleAttibute;
            result = [NSString stringWithFormat:@"%f",[dataDate timeIntervalSince1970]];
        }
    }
    return result;
}


+ (NSString *)GetDeivceMemorySize {
    return [NSString stringWithFormat:@"%lld", [NSProcessInfo processInfo].physicalMemory];
}

+ (NSString *)GetDeviceDiskSize {
    int64_t space = -1;
    NSError *error = nil;
    NSDictionary *attrs = [[NSFileManager defaultManager] attributesOfFileSystemForPath:NSHomeDirectory() error:&error];
    if (!error) {
        space = [[attrs objectForKey:NSFileSystemSize] longLongValue];
    }
    if (space < 0) {
        space = -1;
    }
    return [NSString stringWithFormat:@"%lld", space];
    
}


+ (NSString *)GetCarrierName {
#if TARGET_IPHONE_SIMULATOR
    return @"SIMULATOR";
#else
    static dispatch_queue_t _queue;
    static dispatch_once_t once;
    dispatch_once(&once, ^{
        _queue = dispatch_queue_create([[NSString stringWithFormat:@"com.carr.%@", self] UTF8String], NULL);
    });
    __block NSString *  carr = nil;
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    dispatch_async(_queue, ^(){
        CTTelephonyNetworkInfo *info = [[CTTelephonyNetworkInfo alloc] init]; CTCarrier *carrier = nil;
        if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 12.1) {
            if ([info respondsToSelector:@selector(serviceSubscriberCellularProviders)]) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunguarded-availability-new"
                NSArray *carrierKeysArray = [info.serviceSubscriberCellularProviders.allKeys
                                             sortedArrayUsingSelector:@selector(compare:)];
                carrier = info.serviceSubscriberCellularProviders[carrierKeysArray.firstObject];
                if (!carrier.mobileNetworkCode) {
                    carrier = info.serviceSubscriberCellularProviders[carrierKeysArray.lastObject];
                }
#pragma clang diagnostic pop
            }
        }
        if(!carrier) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
            carrier = info.subscriberCellularProvider;
#pragma clang diagnostic pop
        }
        if (carrier != nil) {
            NSString *networkCode = [carrier mobileNetworkCode];
            NSString *countryCode = [carrier mobileCountryCode];
            if (countryCode && [countryCode isEqualToString:@"460"] &&networkCode) {
                if ([networkCode isEqualToString:@"00"] || [networkCode isEqualToString:@"02"] || [networkCode isEqualToString:@"07"] || [networkCode isEqualToString:@"08"]) {
                    carr= @"中国移动";
                }
                if ([networkCode isEqualToString:@"01"] || [networkCode isEqualToString:@"06"] || [networkCode isEqualToString:@"09"]) {
                    carr= @"中国联通";
                }
                if ([networkCode isEqualToString:@"03"] || [networkCode isEqualToString:@"05"] || [networkCode isEqualToString:@"11"]) {
                    carr= @"中国电信";
                }
                if ([networkCode isEqualToString:@"04"]) {
                    carr= @"中国卫通";
                }
                if ([networkCode isEqualToString:@"20"]) {
                    carr= @"中国铁通";
                }
            }else {
                carr = [carrier.carrierName copy];
            }
        }
        if (carr.length <= 0) {
            carr = @"unknown";
        }
        dispatch_semaphore_signal(semaphore);
    });
    dispatch_time_t t = dispatch_time(DISPATCH_TIME_NOW, 0.5* NSEC_PER_SEC);
    dispatch_semaphore_wait(semaphore, t);
    return [carr copy];
#endif
}


+ (NSString *)GetBattaryChargeStatus {
    UIDevice *device = [UIDevice currentDevice];
    device.batteryMonitoringEnabled = YES;
    if (device.batteryState == UIDeviceBatteryStateUnplugged) {
        return @"未充电";
    } else if  (device.batteryState == UIDeviceBatteryStateCharging) {
        return @"充电";
    } else if  (device.batteryState == UIDeviceBatteryStateFull) {
        return @"电量已满";
    } else {
        return @"未知";
    }
}

+ (NSString *)GetBatteryPercentage {
    UIDevice *device = [UIDevice currentDevice];
    device.batteryMonitoringEnabled = YES;
    float level = device.batteryLevel;
    return [NSString stringWithFormat:@"%.0f", level * 100];
}

+ (NSString *)ISJailBroken {
    BOOL isJail = NO;
    /// 根据是否能打开cydia判断
    if ([[UIApplication sharedApplication] canOpenURL:[NSURL URLWithString:@"cydia://"]]) {
        isJail = YES;
    }
    /// 根据是否能获取所有应用的名称判断 没有越狱的设备是没有读取所有应用名称的权限的。
    if ([[NSFileManager defaultManager] fileExistsAtPath:@"User/Applications/"]) {
        isJail = YES;
    }
    
    NSArray *jailbreak_tool_paths = @[
        @"/Applications/Cydia.app",
        @"/Library/MobileSubstrate/MobileSubstrate.dylib",
        @"/bin/bash",
        @"/usr/sbin/sshd",
        @"/etc/apt"
    ];
    
    /// 判断这些文件是否存在，只要有存在的，就可以认为手机已经越狱了。
    for (int i=0; i<jailbreak_tool_paths.count; i++) {
        if ([[NSFileManager defaultManager] fileExistsAtPath:jailbreak_tool_paths[i]]) {
            isJail = YES;
        }
    }
    
    if (isJail) {
        return @"YES";
    } else {
        return @"NO";
    }
}
@end
