//
//  QYLoginViewController.m
//  QYNWeiBoClient
//
//  Created by QingYun on 14-7-24.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYLoginViewController.h"

@interface QYLoginViewController ()

@end

@implementation QYLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}
//实现微博客户端登录触发动作
- (IBAction)doLogin:(UIButton *)sender {
    [appDelegate.sinaWeibo logIn];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    添加一个登录通知
    [QYNSDC addObserver:self selector:@selector(onLogin:) name:kQYNotificationNameLogin object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
//    注销登录通知
    [QYNSDC removeObserver:self name:kQYNotificationNameLogin object:nil];
}

- (void)onLogin:(NSNotification*)notification
{
    [QYViewControllerManager presentQYViewController:QYViewControllerMain];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
