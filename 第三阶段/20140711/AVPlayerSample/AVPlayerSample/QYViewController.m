//
//  QYViewController.m
//  AVPlayerSample
//
//  Created by QingYun on 14-7-11.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface QYViewController ()

@property (nonatomic, retain) AVPlayer *musicPlayer;
@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    NSError *error = nil;
    [audioSession setCategory:AVAudioSessionCategoryPlayback error:&error];
    if (error != nil) {
        NSLog(@"ERROR:%@",error);
    }
    [audioSession setActive:YES error:nil];

//    AVPlayer 可以播话本地音频文件
    NSURL *musicURL = [[NSBundle mainBundle] URLForResource:@"林俊杰-背对背拥抱" withExtension:@"mp3"];
//    self.musicPlayer = [[AVPlayer alloc] initWithURL:musicURL];
//    [self.musicPlayer play];
    
//    AVPlayer 还可以播话网络数据
   // NSURL *musicURL = [NSURL URLWithString:@"http://music.baidu.com/data/music/file?link=http://yinyueshiting.baidu.com/data2/music/121368038/1201250291404964861128.mp3?xcode=3ae47950d7f91df923a9938a79cd00104d1ead83690db72f&song_id=120125029"];
    self.musicPlayer = [[AVPlayer alloc] initWithURL:musicURL];
    [self.musicPlayer play];
    
//    显示调用实现开始接收远程事件，在这里指的是耳机
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] beginReceivingRemoteControlEvents];
//    设置当前控制器为第一响应者
    [self becomeFirstResponder];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    [[UIApplication sharedApplication] endReceivingRemoteControlEvents];
    [self resignFirstResponder];
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}


//当有远程事件发生的时候， 会回调这个方法。要以根据参数类型完成具体的逻辑实现
- (void)remoteControlReceivedWithEvent:(UIEvent *)event
{
    if (event.type == UIEventTypeRemoteControl) {
        switch (event.subtype) {
            case UIEventSubtypeRemoteControlPlay:
                NSLog(@"Play");
                break;
            case UIEventSubtypeRemoteControlPause:
                NSLog(@"Pause");
                break;
            case UIEventSubtypeRemoteControlPreviousTrack:
                NSLog(@"Previous");
                break;
            case UIEventSubtypeRemoteControlNextTrack:
                NSLog(@"Next");
                break;
                
            default:
                break;
        }
    }
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
