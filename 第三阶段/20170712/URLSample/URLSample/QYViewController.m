//
//  QYViewController.m
//  URLSample
//
//  Created by QingYun on 14-7-12.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSString *strURL = @"http://www.hnqingyun.com:8080/youxiuyueyuan/imag;id=1234?name=shaofeng&xingbie=nan#stuff";
    NSURL *url = [NSURL URLWithString:strURL];
    
    NSLog(@"schema is %@:",url.scheme);
    NSLog(@"host is %@:",url.host);
    NSLog(@"port is %@:",url.port);
    NSLog(@"path is %@:",url.path);
    NSLog(@"urlpar is %@:",url.parameterString);
    NSLog(@"query sting is %@",url.query);
    NSLog(@"anchor is %@",url.resourceSpecifier);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
