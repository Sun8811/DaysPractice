//
//  QYPerson.h
//  JSONWithAppSdkSample
//
//  Created by QingYun on 14-7-15.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYPerson : NSObject

@property (nonatomic, retain) NSString *mobilePhoneNumber;
@property (nonatomic, retain) NSString *homePhoneNumber;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) BOOL isMarried;
@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, retain) NSString *addrProvince;
@property (nonatomic, retain) NSString *addrCountry;
@end
