//
//  QYViewController.m
//  JSONKitSample
//
//  Created by QingYun on 14-7-15.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"
#import "JSONKit.h"

@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    NSURL *jsonURL = [[NSBundle mainBundle] URLForResource:@"person" withExtension:@"json"];
    
    NSError *error = nil;
    NSString *strJson = [NSString stringWithContentsOfURL:jsonURL encoding:NSUTF8StringEncoding error:&error];
    if (error != nil) {
        NSLog(@"%@",error);
    }
    
//  因为包含了JSONKit的头文件，所以NSString添加了一个类别， 用于解析JSON
    NSMutableArray *personList = [strJson objectFromJSONString];
    for (NSDictionary *dicPerson in personList) {
        NSLog(@"%@",dicPerson);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
