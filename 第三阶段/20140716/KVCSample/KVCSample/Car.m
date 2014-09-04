//
//  Car.m
//  KVCSample
//
//  Created by QingYun on 14-4-18.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "Car.h"
#import "Tire.h"
#import "Engine.h"

@implementation Car

- (NSString *)description
{
    return [NSString stringWithFormat:@"%@ ,a %d %@ %.1f and %d doors and %ld tires, horsePower:%ld", self.name,self.model,self.make,self.mileage ,self.numberOfDoors,self.tires.count,self.engine.horsepower];
}

- (id)init
{
    self = [super init];
    if (self) {
        self.tires = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)setTire:(Tire *)tire atIndex:(NSInteger)index
{
    self.tires[index] = tire;
}
@end
