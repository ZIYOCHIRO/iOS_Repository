//
//  AppDelegate.m
//  BaseProject
//
//  Created by SammiRui on 2020/6/30.
//  Copyright © 2020 SammiRui. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "SRLog.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    NSLog(@"application didFinishLaunchingWithOptions");
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[ViewController alloc] init];
    [self.window makeKeyAndVisible];
    
    [SRLog StartAction];
    
  
    return YES;
}




@end
