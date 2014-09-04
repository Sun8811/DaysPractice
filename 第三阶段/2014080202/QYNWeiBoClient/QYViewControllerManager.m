//
//  QYViewControllerManager.m
//  QYNWeiBoClient
//
//  Created by QingYun on 14-7-24.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewControllerManager.h"
#import "QYLoginViewController.h"
#import "QYMainViewController.h"
#import "QYUserGuideViewController.h"

@implementation QYViewControllerManager

+(void)presentQYViewController:(QYViewControllerType)controllerType
{
    UIViewController *controller = [[self shareInstance] controllerByType:controllerType];
    appDelegate.window.rootViewController = controller;
    QYSafeRelease(controller);
}

+ (instancetype)shareInstance
{
    static QYViewControllerManager *viewControlerMgr = nil;
    static dispatch_once_t onceTocken;
    dispatch_once(&onceTocken, ^{
        viewControlerMgr = [[self alloc ] init];
    });
    return viewControlerMgr;
}


- (UIViewController*)controllerByType:(QYViewControllerType)type
{
    UIViewController *retViewController = nil;
    switch (type) {
        case QYViewControllerLogin:
            retViewController = [[QYLoginViewController alloc] init];
            break;
        case QYViewControllerUserGuide:
            retViewController = [[QYUserGuideViewController alloc] init];
            break;
            case QYViewControllerMain:
            retViewController = [[QYMainViewController alloc] init] ;
            break;
        default:
            break;
    }
    return retViewController;
}
@end
