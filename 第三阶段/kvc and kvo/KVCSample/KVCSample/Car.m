//
//  Car.m
//  KVCSample
//
//  Created by qingyun on 14-8-1.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "Car.h"
#import "Engine.h"
@implementation Car

- (id)init
{
    self = [super init];
    if (self) {
        self.engine = [[Engine alloc] init];
        self.engine.horsePower = 100.0f;
    }
    return self;
}
- (NSString *)description
{
    return [NSString stringWithFormat:@"Car's engine'horsePower is:%f", self.engine.horsePower];
}
@end
