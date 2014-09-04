//
//  Tire.m
//  KVCSample
//
//  Created by QingYun on 14-4-18.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "Tire.h"

@implementation Tire

- (id)copyWithZone:(NSZone *)zone
{
    Tire *cpTire = [[self class] allocWithZone:zone];
    cpTire.pressure = self.pressure;
    cpTire.tireName = self.tireName;
    return cpTire;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@"tire name is %@,pressure is %ld", self.tireName,self.pressure];
}
@end
