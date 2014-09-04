//
//  Engine.m
//  KVCSample
//
//  Created by QingYun on 14-4-18.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "Engine.h"

@implementation Engine


- (id)copyWithZone:(NSZone *)zone
{
    Engine *cpEngine = [[self class] allocWithZone:zone];
    cpEngine.horsepower = self.horsepower;
    cpEngine.engineName = self.engineName;
    return cpEngine;
}

//当使用KVC的时候 如果对应的key在相关类没有定义， 那么将会调用这个方法
- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    NSLog(@"Sorrry Your are key is not right");
}

//当使用KVC的时候，如果在获取相应的key值， 发现这个key没有定义，则调用这个方法
- (id) valueForUndefinedKey:(NSString *)key
{
    return nil;
}
@end
