//
//  QYAudioPlayerViewController.m
//  PlaySystemSoundSample
//
//  Created by QingYun on 14-7-11.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYAudioPlayerViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface QYAudioPlayerViewController ()
@property (retain, nonatomic) IBOutlet UISlider *progressSlider;
@property (retain, nonatomic) IBOutlet UISlider *volumeSlider;

@property (retain, nonatomic) IBOutlet UILabel *labelStartProgress;
@property (retain, nonatomic) IBOutlet UILabel *lableEndProgress;
@property (retain, nonatomic) IBOutlet UIButton *btnPlay;

@property (nonatomic, retain) AVAudioPlayer *audioPlayer;
@property (retain, nonatomic) IBOutlet UILabel *labelMinVolume;
@property (retain, nonatomic) IBOutlet UILabel *labelMaxVolume;
@end

@implementation QYAudioPlayerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *soundURL = [[NSBundle mainBundle ] URLForResource:@"林俊杰-背对背拥抱" withExtension:@"mp3"];
    NSError *error = nil;
    self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:soundURL error:&error];
    if (error != nil) {
        NSLog(@"%@",error);
    }
//  事先将音频数据从文件里加载到内存， 这块内存又叫做音频播知的缓冲区
    [self.audioPlayer prepareToPlay];
    self.progressSlider.minimumValue = 0;
//    进度的最大值就是歌曲的总时长
    self.progressSlider.maximumValue = self.audioPlayer.duration;
    self.audioPlayer.volume = self.volumeSlider.value /100;
    
    self.audioPlayer.numberOfLoops = 2;

}
- (IBAction)onProgressSlider:(UISlider *)sender {
    self.audioPlayer.currentTime = sender.value;
}

- (IBAction)playMusic:(UIButton *)sender
{
//    isPlaying 是用于判断当前是否正在播放
    if ([self.audioPlayer isPlaying]) {
        [sender setTitle:@"播放" forState:UIControlStateNormal];
//        暂停
        [self.audioPlayer pause];
    }else
    {
        [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(updateProgressSlider:) userInfo:nil repeats:YES];
        [sender setTitle:@"暂停" forState:UIControlStateNormal];
        [self.audioPlayer play];
    }
}

- (void)updateProgressSlider:(NSTimer*)timer
{
    //修改progressSlider的当前值
    NSString *strLeftLabel = [NSString stringWithFormat:@"%f",self.audioPlayer.currentTime];
//    需要将audioPlayer.currentTime的当前时间以60取模，进行格式化成00:00的格式，
//    NSMutableString *strResult = [NSMutableString stringWithFormat:@"%.2d",1];
//    NSString *strSecondValue = [NSString stringWithFormat:@"%.2d",10];
//    [strResult appendString:@":"];
//    [strResult appendString:strSecondValue];
//    
//    self.labelStartProgress.text = strResult;
    self.progressSlider.value = self.audioPlayer.currentTime;
}

- (IBAction)stopMusic:(UIButton *)sender {
    
    [self.audioPlayer stop];
//  在调用完stop之后， 如果还会播放其它音频内容的时候， 需要再次调用prepareToPlay
    [self.audioPlayer prepareToPlay];
    self.audioPlayer.currentTime = 0;
    [self.btnPlay setTitle:@"播放" forState:UIControlStateNormal];
}
- (IBAction)onVolumeSlider:(UISlider *)sender {
    
    NSLog(@"%f",sender.value);
    self.audioPlayer.volume = sender.value / 100;
    NSString *strLabelMin = [NSString stringWithFormat:@"%d",(int)sender.value];
    
    int maxVolume = 100 - sender.value;
    NSString *strLabelMax = [NSString stringWithFormat:@"%d",maxVolume];
    
    
    self.labelMinVolume.text = strLabelMin;
    self.labelMaxVolume.text = strLabelMax;
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)dealloc {
    [_progressSlider release];
    [_volumeSlider release];
    [_labelStartProgress release];
    [_lableEndProgress release];
    [_btnPlay release];
    [_labelMinVolume release];
    [_labelMaxVolume release];
    [super dealloc];
}
@end
