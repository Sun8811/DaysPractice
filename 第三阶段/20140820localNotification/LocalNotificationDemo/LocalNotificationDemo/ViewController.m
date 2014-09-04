//
//  ViewController.m
//  LocalNotificationDemo
//
//  Created by qingyun on 14-8-20.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//	创建本地通知对象
    UILocalNotification *localNotification = [[UILocalNotification alloc] init];
//  配置本地通知对象的属性， 主要是设置调度时间、timeZone、警告信息、声音、脚标、传递的用户信息
    NSDate *now = [NSDate date];
    NSDate *fireDate = [NSDate dateWithTimeInterval:8.0f sinceDate:now];
//    设置本地通知触发时间
    localNotification.fireDate = fireDate;
    localNotification.timeZone = [NSTimeZone defaultTimeZone];
//    当本地通知触发的时候，弹出的消息内容
    localNotification.alertBody = @"毕业了， 找工作了。。。";
//    当本地通知触发的时候，设备处理锁屏状态的时候， 滑动后的文字内容
    localNotification.alertAction = @"德龙";
//    当本地通知触发的时候， 响应的声音， 这个是默认的
//    localNotification.soundName = UILocalNotificationDefaultSoundName;
    localNotification.soundName = @"msgcome.wav";
//    应用程序脚标显示具体的数字
    localNotification.applicationIconBadgeNumber = 2;
    
    localNotification.userInfo = @{@"name": @"HaiYuan"};
//  启动调度
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotification];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
