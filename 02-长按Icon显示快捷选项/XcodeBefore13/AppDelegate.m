//
//  AppDelegate.m
//  XcodeBefore13
//
//  Created by ruixinyi on 2020/6/30.
//  Copyright © 2020 ruixinyi. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.rootViewController = [[ViewController alloc] init];
    [self.window makeKeyAndVisible];
    int a = [self testMethod];
    NSString *testStr = [NSString stringWithFormat:@"你当前排名是：%i", a];
    
    
    UIApplicationShortcutIcon *searchIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"icons8-search"];
    UIApplicationShortcutItem *search = [[UIApplicationShortcutItem alloc] initWithType:@"search" localizedTitle:@"搜索" localizedSubtitle:nil icon:searchIcon userInfo:nil];
    
    UIApplicationShortcutIcon *gameIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"icons8-game"];
    UIApplicationShortcutItem *game = [[UIApplicationShortcutItem alloc] initWithType:@"game" localizedTitle:@"游戏" localizedSubtitle:nil icon:gameIcon userInfo:nil];
    
    
    UIApplicationShortcutIcon *listIcon = [UIApplicationShortcutIcon iconWithTemplateImageName:@"icons8-leaderboard"];
    UIApplicationShortcutItem *list = [[UIApplicationShortcutItem alloc] initWithType:@"leaderboard" localizedTitle:@"榜单" localizedSubtitle:testStr icon:listIcon userInfo:nil];
    
    application.shortcutItems = @[list, game, search];
    

    return YES;
}

- (void)application:(UIApplication *)application performActionForShortcutItem:(UIApplicationShortcutItem *)shortcutItem completionHandler:(void (^)(BOOL))completionHandler {
    if ([shortcutItem.type isEqualToString:@"search"]) {
      NSLog(@"用户从快捷方式“搜索”进来的");
     } else if ([shortcutItem.type isEqualToString:@"game"]) {
      NSLog(@"用户从快捷方式“游戏”进来的");
     } else if ([shortcutItem.type isEqualToString:@"leaderboard"]) {
      NSLog(@"用户从快捷方式“榜单”进来的");
     }
}

- (int)testMethod {
    return 10;
}
/*
 <key>UIApplicationShortcutItems</key>
 <array>
     <dict>
         <key>UIApplicationShortcutItemType</key>
         <string>search</string>
         <key>UIApplicationShortcutItemTitle</key>
         <string>搜索</string>
         <key>UIApplicationShortcutItemIconFile</key>
         <string>icons8-search</string>
     </dict>
     <dict>
         <key>UIApplicationShortcutItemType</key>
         <string>game</string>
         <key>UIApplicationShortcutItemTitle</key>
         <string>游戏</string>
         <key>UIApplicationShortcutItemIconFile</key>
         <string>icons8-game</string>
     </dict>
     <dict>
         <key>UIApplicationShortcutItemType</key>
         <string>leaderboard</string>
         <key>UIApplicationShortcutItemTitle</key>
         <string>排行</string>
         <key>UIApplicationShortcutItemIconFile</key>
         <string>icons8-leaderboard</string>
     </dict>
 </array>
 */
@end
