//
//  main.m
//  kvcDemoPractice
//
//  Created by sunbiao on 14-8-18.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Deveice.h"
int main(int argc, const char * argv[])
{

    @autoreleasepool {
        person *ps =[[person alloc]init];

        Deveice *mac =[[Deveice alloc]init];
        [mac setValue:@"macbook" forKey:@"name"];
        [mac setValue:@8000 forKey:@"price"];
        NSString *name =[mac valueForKey:@"name"];
        NSLog(@"==%@",name);
        Deveice *iPhone =[[Deveice alloc]init];
        [iPhone setValue:@"iphone" forKey:@"name"];
        [iPhone setValue:@5000 forKey:@"price"];
        
        Deveice *iPad =[[Deveice alloc]init];
        [iPad setValue:@"ipad" forKey:@"name"];
        [iPad setValue:@3800 forKey:@"price"];


        
        NSArray *nameArray =@[mac,iPhone,iPad];
        [ps setValue:@"jobs" forKeyPath:@"name"];
        [ps setValue:nameArray forKey:@"deceiveArray"];
      NSNumber *number =  [ps valueForKeyPath:@"deceiveArray.@sum.price"];
        NSLog(@"%@",number);
        
        NSLog(@"%@",[ps valueForKey:@"name"]);
        
        
       
        
    }
    return 0;
}

