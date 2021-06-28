//
//  ViewController.m
//  XcodeBefore13
//
//  Created by ruixinyi on 2020/6/30.
//  Copyright © 2020 ruixinyi. All rights reserved.
//

#import "ViewController.h"
#include <sys/sysctl.h>
#include "TargetConditionals.h"
#import <sys/utsname.h>
#import <objc/runtime.h>
#import <malloc/malloc.h>

#import <AVFoundation/AVFoundation.h>

@interface ViewController ()<AVAudioPlayerDelegate> {
    NSString *personName;
    AVAudioPlayer *_yourPlayer;
}

@end

@implementation ViewController

- (void)viewDidLoad {

    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    UIButton *button_1 = [[UIButton alloc] initWithFrame:CGRectMake(50, 50, 100, 40)];
    button_1.backgroundColor = [UIColor purpleColor];
    [button_1 setTitle:@"播放" forState:UIControlStateNormal];
    [button_1 addTarget:self action:@selector(action_1) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button_1];
    
  
    
}

- (void)action_1 {
   // NSLog(@"Current Category:%@", [AVAudioSession sharedInstance].category);
    
    //[[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategorySoloAmbient error:nil];// 默认值， 播放中断QQ音乐可以恢复
    //[[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryPlayback error:nil]; // 播放中断QQ音乐可以恢复
    [[AVAudioSession sharedInstance] setCategory:AVAudioSessionCategoryAmbient error:nil]; // 不会中断QQ音乐

    [[AVAudioSession sharedInstance] setActive:YES error:nil];
    NSURL *url = [NSURL fileURLWithPath:[[NSBundle mainBundle] // 无法播放音频
                                             pathForResource:@"bird_level_success"
                                             ofType:@"mp3"]];
    _yourPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:url error:NULL];
     _yourPlayer.delegate = self;
     [_yourPlayer play];
    NSLog(@"Current Category:%@", [AVAudioSession sharedInstance].category);
}

- (void)action_2 {
    
  

}


- (void)action_3 {

    
}

 

- (void)action_4 {

}

#pragma mark - dddd
- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    NSLog(@"DidFinishPlaying");
    if (player == _yourPlayer) {
           _yourPlayer = nil;
       }
    NSLog(@"Finish Category:%@", [AVAudioSession sharedInstance].category);
    //MARK:- 再播放完成的时候，将setActive设置成NO
    [[AVAudioSession sharedInstance] setActive:NO withOptions:AVAudioSessionSetActiveOptionNotifyOthersOnDeactivation error:nil];
}


@end

