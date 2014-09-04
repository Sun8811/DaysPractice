//
//  main.m
//  KVCSample
//
//  Created by qingyun on 14-8-1.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

//KVC Key value codeing

#import <Foundation/Foundation.h>
#import "Car.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        
        Car *myCar = [[Car alloc] init];
        [myCar setValue:[NSNumber numberWithFloat:200.0f] forKeyPath:@"engine.horsePower"];
        NSLog(@"%@",myCar);
    }
    return 0;
}

