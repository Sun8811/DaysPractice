//
//  QYAppDelegate.h
//  QYNWeiBoClient
//
//  Created by QingYun on 14-7-24.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYAppDelegate : UIResponder <UIApplicationDelegate,SinaWeiboDelegate>

@property (strong, nonatomic) UIWindow *window;

//后续需要使用这个对象来访问博客开放平台的API
@property (nonatomic, retain) SinaWeibo *sinaWeibo;
@end
