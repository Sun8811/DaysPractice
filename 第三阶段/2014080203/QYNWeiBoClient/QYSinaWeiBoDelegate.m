//
//  QYSinaWeiBoDelegate.m
//  QYNWeiBoClient
//
//  Created by QingYun on 14-7-25.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYSinaWeiBoDelegate.h"

@implementation QYSinaWeiBoDelegate

- (void)sinaweiboDidLogIn:(SinaWeibo *)sinaweibo
{
    [self storeAuthData:sinaweibo];
    [QYNSDC postNotificationName:kQYNotificationNameLogin object:nil];
}


- (void)sinaweiboDidLogOut:(SinaWeibo *)sinaweibo
{
    [QYNSDC postNotificationName:kQYNotificationNameLogoff object:nil];
    [self removeAuthData:sinaweibo];
}

//将登录成功后， 从新浪服务器上获取到的数据持久化到沙盒里，以便后续使用客户端来访问服务器上的数据
- (void)storeAuthData:(SinaWeibo *)sinaweibo
{
    NSDictionary *authData = @{kAuthAccessTokenKey: sinaweibo.accessToken,
                               kAuthUserIDKey:sinaweibo.userID,
                               kAuthExpirationDateKey:sinaweibo.expirationDate};
    
    [NSUD setObject:authData forKey:kAuthSinaWeiboAuthData];
    [NSUD synchronize];
}

//删除从新浪服务器上获取到的鉴权数据accessToken等
- (void)removeAuthData:(SinaWeibo*)sinaweibo
{
    [NSUD removeObjectForKey:kAuthSinaWeiboAuthData];
    [NSUD synchronize];
}

//当登录微博客户端发生错误的时候， 回调这个方法
- (void)sinaweibo:(SinaWeibo *)sinaweibo logInDidFailWithError:(NSError *)error
{
    NSLog(@"Login error: %@",error);
}
@end
