//
//  Garage.m
//  KVCSample
//
//  Created by QingYun on 14-4-18.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "Garage.h"

@implementation Garage

- (void)addCar:(Car *)car
{
    if (self.cars == nil) {
        self.cars = [[NSMutableArray alloc] initWithCapacity:4];
    }
    [self.cars addObject:car];
}

- (void)showGarageInfo
{
    NSLog(@"%@",self.name);
    for (Car *car  in self.cars) {
        NSLog(@"%@",car);
    }
}
@end
