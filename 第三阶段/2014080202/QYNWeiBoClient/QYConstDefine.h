//
//  QYConstDefine.h
//  QYNWeiBoClient
//
//  Created by QingYun on 14-7-24.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

//头文件卫士，防止这个头文件被重复包含
#ifndef QYNWeiBoClient_QYConstDefine_h
#define QYNWeiBoClient_QYConstDefine_h

//此工程如果想要正常运行。首先需要注册成为新浪开放平台的开发者
//然后， 创建具体的移动应用， 并得到相应的appKey appSecret 配置回调页
//#define kAppKey             @"675884228"
//#define kAppSecret          @"020e0defebb0ac8f0c5684bec322e628"
#define kAppKey                @"4074510129"
#define kAppSecret            @"30dac3d5368fbdd37b8034e3431f5ba8"

#define kAppRedirectURI     @"https://api.weibo.com/oauth2/default.html"

#define kEverLaunched       @"everLaunched"
#define kFirstLaunched      @"firstLaunched"

#define kAuthSinaWeiboAuthData  @"SinaWeiboAuthData"
#define kAuthAccessTokenKey     @"AccessTokenKey"
#define kAuthUserIDKey          @"UserIDKey"
#define kAuthExpirationDateKey  @"ExpirationDateKey"
#define kAuthRefreshToken       @"refreshToken"

#define kQYNotificationNameLogin    @"notificationLogin"
#define kQYNotificationNameLogoff   @"notificationLogoff"

#define NSUD        [NSUserDefaults standardUserDefaults]
#define QYNSDC      [NSNotificationCenter defaultCenter]

#define appDelegate ((QYAppDelegate*)[UIApplication sharedApplication].delegate)

//用于安全释放Objective-c对象
#define QYSafeRelease(_pointer) {[_pointer release],_pointer=nil;}


//解析微博所使用的关键字常量，也就是新浪服务器返回的数据由JSONKit解析后生成的字典关于微博信息的key值
static NSString * const kStatusCreateTime = @"created_at";
static NSString * const kStatusID = @"id";
static NSString * const kStatusMID = @"mid";
static NSString * const kStatusText = @"text";
static NSString * const kStatusSource = @"source";
static NSString * const kStatusThumbnailPic = @"thumbnail_pic";
static NSString * const kStatusOriginalPic = @"original_pic";
static NSString * const kStatusPicUrls = @"pic_urls";
static NSString * const kStatusRetweetStatus = @"retweeted_status";
static NSString * const kStatusUserInfo = @"user";
static NSString * const kStatusRetweetStatusID = @"retweeted_status_id";
static NSString * const kStatusRepostsCount = @"reposts_count";
static NSString * const kStatusCommentsCount = @"comments_count";
static NSString * const kStatusAttitudesCount = @"attitudes_count";

//解析微博用户数据所使用的关键字常量，也就是新浪服务器返回的数据由JSONKit解后生成的字典关于用户信息的Key值。
static NSString * const kUserInfoScreenName = @"screen_name";
static NSString * const kUserInfoName = @"name";
static NSString * const kUserAvatarLarge = @"avatar_large";
static NSString * const kUserAvatarHd = @"avatar_hd";
static NSString * const kUserID = @"id";
static NSString * const kUserDescription = @"description";
static NSString * const kUserVerifiedReson = @"verified_reason";
static NSString * const kUserFollowersCount = @"followers_count";
static NSString * const kUserStatusCount = @"statuses_count";
static NSString * const kUserFriendCount = @"friends_count";
static NSString * const kUserStatusInfo = @"status";
static NSString * const kUserStatuses = @"statuses";
#endif
