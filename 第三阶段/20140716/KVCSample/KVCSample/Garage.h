//
//  Garage.h
//  KVCSample
//
//  Created by QingYun on 14-4-18.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Car;
@interface Garage : NSObject

@property (nonatomic,copy) NSString *name;
@property (nonatomic, retain) NSMutableArray *cars;

- (void)addCar:(Car*)car;
- (void)showGarageInfo;
@end
