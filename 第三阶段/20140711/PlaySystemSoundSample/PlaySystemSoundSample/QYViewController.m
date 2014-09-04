//
//  QYViewController.m
//  PlaySystemSoundSample
//
//  Created by QingYun on 14-7-11.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@interface QYViewController ()

//可以理解为是要播放的音频文件的句柄 实际就是通过这个值与实际的音频文件进行了关联，它本质是一个整型值
@property (nonatomic, assign) SystemSoundID sysSoundID;
//标识本地音频文件的位置
@property (nonatomic, assign) CFURLRef soundUrl;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"tapping" withExtension:@"wav"];
    self.soundUrl = (CFURLRef)[soundURL retain];
    
    AudioServicesCreateSystemSoundID(self.soundUrl, &_sysSoundID);
}

- (IBAction)playSystemSound:(UIButton*)sender
{
    AudioServicesPlaySystemSound(self.sysSoundID);
}

- (IBAction)playVibate:(id)sender
{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

- (IBAction)playAlertSound:(id)sender
{
    AudioServicesPlayAlertSound(self.sysSoundID);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc
{
    AudioServicesDisposeSystemSoundID(_sysSoundID);
    CFRelease(_soundUrl);
    [super dealloc];
}
@end
