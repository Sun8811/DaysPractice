//
//  QYAboutMeViewController.h
//  QYNWeiBoClient
//
//  Created by QingYun on 14-7-24.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "QYTableViewController.h"
@interface QYAboutMeViewController : QYTableViewController

@property (nonatomic, assign) BOOL isHideNavigationBar;
@property (nonatomic, retain) NSString *userID;
@property (nonatomic, retain) NSDictionary *currentUserInfo;
@property (nonatomic, retain) NSArray *fullTimeLines;
@end
