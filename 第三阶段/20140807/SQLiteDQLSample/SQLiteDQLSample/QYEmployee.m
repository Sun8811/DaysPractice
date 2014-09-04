//
//  QYEmployee.m
//  SQLiteDQLSample
//
//  Created by qingyun on 14-8-7.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYEmployee.h"

@implementation QYEmployee

- (NSString *)description
{
    return [NSString stringWithFormat:@"id:%d,name:%@,age:%d,address:%@,salary:%f", self.eID,self.name,self.age,self.address,self.salary];
}
@end
