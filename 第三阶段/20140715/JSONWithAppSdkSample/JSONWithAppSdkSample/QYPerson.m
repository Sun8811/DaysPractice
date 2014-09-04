//
//  QYPerson.m
//  JSONWithAppSdkSample
//
//  Created by QingYun on 14-7-15.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYPerson.h"

@implementation QYPerson

- (NSString *)description
{
    return [NSString stringWithFormat:@"name:%@,mobilePhone:%@,homePone%@,married:%@", self.name,self.mobilePhoneNumber,self.homePhoneNumber,(self.isMarried ? @"YES":@"NO")];
}

@end
