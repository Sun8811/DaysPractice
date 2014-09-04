//
//  QYAppDelegate.m
//  QYNWeiBoClient
//
//  Created by QingYun on 14-7-24.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYAppDelegate.h"
#import "QYSinaWeiBoDelegate.h"

@implementation QYAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    
    [self initLaunchStatus];
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    QYSinaWeiBoDelegate *sinaWeiBoDelegate = [[QYSinaWeiBoDelegate alloc] init];
//   _sinaWeibo是用于使用微博SDK的对象
    _sinaWeibo = [[SinaWeibo alloc] initWithAppKey:kAppKey appSecret:kAppSecret appRedirectURI:kAppRedirectURI andDelegate:sinaWeiBoDelegate];
    
    NSDictionary *sinaweiboInfo = [NSUD objectForKey:kAuthSinaWeiboAuthData];
    if ([sinaweiboInfo objectForKey:kAuthAccessTokenKey]
        && [sinaweiboInfo objectForKey:kAuthUserIDKey]
        && [sinaweiboInfo objectForKey:kAuthExpirationDateKey]) {
        
        _sinaWeibo.accessToken = [sinaweiboInfo objectForKey:kAuthAccessTokenKey];
        _sinaWeibo.userID = [sinaweiboInfo objectForKey:kAuthUserIDKey];
        _sinaWeibo.expirationDate = [sinaweiboInfo objectForKey:kAuthExpirationDateKey];
        
    }
    if ([NSUD boolForKey:kFirstLaunched]) {
        [QYViewControllerManager presentQYViewController:QYViewControllerUserGuide];
    }else
    {
        if ([self.sinaWeibo isLoggedIn]) {
            [QYViewControllerManager presentQYViewController:QYViewControllerMain];
        }else
        {
            [QYViewControllerManager presentQYViewController:QYViewControllerLogin];
        }
    }
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark -
#pragma mark init launched status
- (void)initLaunchStatus
{
    if (![NSUD boolForKey:kEverLaunched]) {
        [NSUD setBool:YES forKey:kEverLaunched];
        [NSUD setBool:YES forKey:kFirstLaunched];
    }else
    {
        [NSUD setBool:NO forKey:kFirstLaunched];
    }
//    强制写入磁盘
    [NSUD synchronize];
}

@end
