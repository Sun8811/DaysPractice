//
//  Engine.h
//  KVCSample
//
//  Created by QingYun on 14-4-18.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Engine : NSObject<NSCopying>

@property (nonatomic, assign) NSInteger horsepower;
@property (nonatomic, copy) NSString *engineName;
@end
