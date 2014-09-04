//
//  main.m
//  KVCSample
//
//  Created by QingYun on 14-4-18.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Car.h"
#import "Tire.h"
#import "Engine.h"
#import "Garage.h"


Car *makeCar (NSString *name, NSString *make, int m,  int numberOfDoors,
              float mileage, int horsepower);


int main(int argc, const char * argv[])
{
    
    @autoreleasepool {
/*
        Tire *qingyunTire = [[Tire alloc] init];
        
//        qingyunTire.tireName = @"QingYun";
//        KVC :类成员变量的名字当做key，可以根据这个key值来设置它的值
        [qingyunTire setValue:@"QingYun2" forKey:@"tireName"];
//        qingyunTire.pressure = 22;
//        如果22,表示基本数据类型的整型， 如果加@22，表示对象， NSNumber
        [qingyunTire setValue:@22 forKey:@"pressure"];
        NSLog(@"%@",qingyunTire);
 */
        
        Garage *garage = [[Garage alloc] init];
        garage.name = @"Joe’s Garage";
        
        Car *car;
        car = makeCar (@"Herbie", @"Honda", 0002, 2, 110000, 58);
        [garage addCar: car];
        
//        car.engine.horsepower = 60;
//        [car setValue:@60 forKey:@"Key"]
//        KVC 以keyPath的形式存在，另外一种引用
//        [car setValue:@60 forKeyPath:@"engine.horsePower"];
        int horsePower = [[car valueForKeyPath:@"engine.horsepower"] intValue];
        NSLog(@"int main function: %d",horsePower);
        
        car = makeCar (@"Badger", @"Acura", 0003,  5, 217036.7, 130);
        [garage addCar: car];
        
        car = makeCar (@"Elvis", @"Acura", 004,  4, 28123.4, 151);
        [garage addCar: car];
        
        car = makeCar (@"Phoenix", @"Pontiac", 005,  2, 85128.3, 345);
        [garage addCar: car];
        
        car = makeCar (@"Streaker", @"Pontiac", 89, 2, 39100.0, 36);
        [garage addCar: car];
        
        car = makeCar (@"Judge", @"Pontiac", 0030, 2, 45132.2, 370);
        [garage addCar: car];
        
        car = makeCar (@"Paper Car", @"Plymouth",0040, 2, 76800, 105);
        [garage addCar: car];
        
        [garage showGarageInfo];
        
        int nCarsCount = [[garage valueForKeyPath:@"cars.@count"] intValue];
        NSLog(@"%@'s car's count is %d",garage.name,nCarsCount);
        
        float nMiles = [[garage valueForKeyPath:@"cars.@sum.numberOfDoors"] floatValue];
        NSLog(@"%@'s car's sum mileage is %f",garage.name,nMiles);
        
        float nAvgMiles = [[garage valueForKeyPath:@"cars.@avg.numberOfDoors"] floatValue];
        NSLog(@"%@'s car's avg mileage is %f",garage.name, nAvgMiles);
        
        
        float minMiles = [[garage valueForKeyPath:@"cars.@min.mileage"] floatValue];
        NSLog(@"%@'s car's min mileage is %f",garage.name, minMiles);
        
        
        float maxMiles = [[garage valueForKeyPath:@"cars.@max.mileage"] floatValue];
        NSLog(@"%@'s car's max maileage is %f", garage.name, maxMiles);
    }
    return 0;
}



Car *makeCar (NSString *name, NSString *make, int m, int numberOfDoors,
              float mileage, int horsepower)
{
    Car *car = [[Car alloc] init];
    car.name = name;
    car.make = make;
    car.model = m;
    car.numberOfDoors = numberOfDoors;
    car.mileage = mileage;
    
    
    Engine *engine = [[Engine alloc] init];
//    KVC应用
    [engine setValue: [NSNumber numberWithInt: horsepower]
              forKey: @"horsepower"];
    
    car.engine = engine;
    // Make some tires.
    for (int i = 0; i < 4; i++)
    {
        Tire * tire= [[Tire alloc] init];
        tire.pressure = 100+i;
        [car setTire: tire atIndex: i];
    }
    return (car);
} 

