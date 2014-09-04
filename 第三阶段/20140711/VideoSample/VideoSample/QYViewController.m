//
//  QYViewController.m
//  VideoSample
//
//  Created by QingYun on 14-7-11.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"

#import <MediaPlayer/MediaPlayer.h>
@interface QYViewController ()

@property (nonatomic, retain) MPMoviePlayerViewController *moviePlayer ;
@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}
- (IBAction)playMovie:(id)sender {
//    
//    NSString *strVideo = @"http://v.youku.com/player/getRealM3U8/vid/XNzM3OTA3OTIw/type/video.m3u8";
//    NSURL *videoURL = [NSURL URLWithString:strVideo];
//    NSURL *videoURL = [NSURL URLWithString:@"http://devimages.apple.com/iphone/samples/bipbop/gear1/prog_index.m3u8"];

    NSURL *videoURL = [[NSBundle mainBundle] URLForResource:@"大家一起学编程" withExtension:@"mp4"];
    
    self.moviePlayer = [[MPMoviePlayerViewController alloc] initWithContentURL:videoURL];
    self.moviePlayer.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    
    [self presentViewController:self.moviePlayer animated:YES completion:nil];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
