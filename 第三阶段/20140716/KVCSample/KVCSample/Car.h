//
//  Car.h
//  KVCSample
//
//  Created by QingYun on 14-4-18.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Engine;
@class Tire;
@interface Car : NSObject

@property (nonatomic, copy) Engine *engine;
@property (nonatomic, retain) NSMutableArray *tires;

@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *make;
@property (nonatomic, assign) int model;
@property (nonatomic, assign) int numberOfDoors;
@property (nonatomic, assign) float mileage;


- (void) setTire:(Tire *)tire atIndex:(NSInteger)index;
@end


