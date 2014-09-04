//
//  QYEmployee.h
//  SQLiteDQLSample
//
//  Created by qingyun on 14-8-7.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYEmployee : NSObject

@property (nonatomic, assign) int eID;
@property (nonatomic, retain) NSString *name;
@property (nonatomic, assign) NSUInteger age;
@property (nonatomic, retain) NSString *address;
@property (nonatomic, assign) double salary;
@end
