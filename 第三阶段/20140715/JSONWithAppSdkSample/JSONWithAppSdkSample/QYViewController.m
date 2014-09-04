//
//  QYViewController.m
//  JSONWithAppSdkSample
//
//  Created by QingYun on 14-7-15.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"
#import "QYPerson.h"

enum indexAddress
{
    kIndexMobilePhone = 0,
    kIndexHomePhone
};


@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSURL *jsonUrl = [[NSBundle mainBundle] URLForResource:@"person" withExtension:@"json"];
    
//    将json数据从文件里读取到内存
    NSData *jsonData = [NSData dataWithContentsOfURL:jsonUrl];
    
    NSError *error = nil;
//    NSJSONReadingMutableContainers参数表示解析后的结果， 是可变对象
//    根据json文件里的数据格， 了解顶层的数据对象是数组， 因为是以[]开始的
    NSMutableArray *persons = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    
    NSLog(@"jsonInfo is %@",persons);
    
//    对于数组里的每一个对象，因为是以{}括起来的 所以确认每一个对象都是一个字典对象
    for (NSDictionary *dicPers in persons) {
        QYPerson *person = [[QYPerson alloc] init];
//        对于名字来说， 直接可以看到，就是字符串形式， 因为是以""括起来的， 所以直接解析为字符串
        person.name = [dicPers objectForKey:@"name"];
//        对于每个人的电话号码，之所以定义为数组， 还是因为是以［］括起来的，
        person.mobilePhoneNumber = dicPers[@"phone"][kIndexMobilePhone];
        person.homePhoneNumber = dicPers[@"phone"][kIndexHomePhone];
        
        person.age = [[dicPers objectForKey:@"Age"] integerValue];
        person.isMarried = [[dicPers objectForKey:@"married"] boolValue] ;
        NSLog(@"%@",person);
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
