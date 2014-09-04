//
//  QYViewControllerManager.h
//  QYNWeiBoClient
//
//  Created by QingYun on 14-7-24.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, QYViewControllerType) {
    QYViewControllerUserGuide,
    QYViewControllerLogin,
    QYViewControllerMain
};

@interface QYViewControllerManager : NSObject

+(void)presentQYViewController:(QYViewControllerType)controllerType;
@end
