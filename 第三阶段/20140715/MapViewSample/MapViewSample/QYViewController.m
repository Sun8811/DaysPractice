//
//  QYViewController.m
//  MapViewSample
//
//  Created by QingYun on 14-7-15.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"
#import <MapKit/MapKit.h>


@interface QYViewController () <CLLocationManagerDelegate>

@property (nonatomic, retain)  CLLocationManager *locationMgr;
@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    MKMapView *mapView = [[MKMapView alloc] initWithFrame:self.view.bounds];
    mapView.tag = 1000;
    
//    span 指的是显示地图精确度，值越小显示的地图数据越精确，越详细，如果值越大， 则显示的区域越大
    MKCoordinateSpan span = {1,1};
//    结构体的第二种赋值方法
//    MKCoordinateSpan span2;
//    span2.latitudeDelta = 100;
//    span2.longitudeDelta = 100;
    
//    采用C函数来创建结构体的具体数据
//    MKCoordinateSpan span3;
//    span3 = MKCoordinateSpanMake(100, 100);
    
    /*
     *在OC环境下 对于结构体变量的赋值，有三种方式：
     1､初始化的时候， 直接采用花括号语法， 在花括里，按结构体声明的顺序依次赋值
     2､先声明结构体变量，可以使用点语法，来指定相对应的成员变量的值
     3､采用SDK的C 函数直接完成设置
     */
    
    
//    是地图当前显示位置的地理坐标
    CLLocationCoordinate2D coordinate = {34,113};
//    CLLocationCoordinate2D coordinate2;
//    coordinate2 = CLLocationCoordinate2DMake(34.7568711, 113.663221);
    
//    地图上的显示区域
    MKCoordinateRegion region = {coordinate,span};
    
    mapView.region = region;
    mapView.showsUserLocation = YES;
//    mapView.zoomEnabled = NO;
//    mapView.scrollEnabled = NO;
//    显示卫星地图
//    mapView.mapType = MKMapTypeSatellite;
//    显示卫星地图和标准地图的混合
//    mapView.mapType = MKMapTypeHybrid;
//    显示标准也就是普通地图，这是默认地图类型
    mapView.mapType = MKMapTypeStandard;
    [self.view addSubview:mapView];
    
   self.locationMgr = [[CLLocationManager alloc] init];
//    当设备移动每超过100米，才会更新一次位置信息。
    self.locationMgr.distanceFilter = 1;
    self.locationMgr.desiredAccuracy = kCLLocationAccuracyBest;
    self.locationMgr.delegate = self;
    
    [self.locationMgr startUpdatingLocation];

}

#pragma mark -
#pragma mark CLLocationManagerDelegate
//第二个参数， 表示当位置更新的时候， 新位置信息。
//第三个参数，表示位置更新时， 老的位置信息。

- (void)locationManager:(CLLocationManager *)manager
	didUpdateToLocation:(CLLocation *)newLocation
		   fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"newLocation's lat:%f,long:%f",newLocation.coordinate.latitude,newLocation.coordinate.longitude);
    NSLog(@"oldLocation's lat:%f,long:%f",oldLocation.coordinate.latitude,oldLocation.coordinate.longitude);
    
    //    CLLocationCoordinate2D coordinate2;
    //    coordinate2 = CLLocationCoordinate2DMake(34.7568711, 113.663221);
    
    MKCoordinateSpan span = MKCoordinateSpanMake(1, 1);
    //    地图上的显示区域
    MKCoordinateRegion region = {newLocation.coordinate,span};
    
    MKMapView *mapView = (MKMapView*)[self.view viewWithTag:1000];
    [mapView setRegion:region animated:YES];

//    计算两个位置的相隔距离， 单位是米
    CLLocationDistance distance = [newLocation distanceFromLocation:oldLocation];
    NSLog(@"郑州距苹果总部的距离是:%f",distance/1000);
    
//    调用此方法， 是终止位置管理器更新位置信息，在实际应用中， 一定调用这个方法， 解决设备耗电量问题。
//    [self.locationMgr stopUpdatingLocation];
}

//- (void)locationManager:(CLLocationManager *)manager
//	 didUpdateLocations:(NSArray *)locations
//{
//    NSLog(@"%@",NSStringFromSelector(_cmd));
////    数组locations的最后一个元素， 是最新的位置信息
//    CLLocation *newLocation = locations[0];
//    MKCoordinateSpan span = MKCoordinateSpanMake(1, 1);
//    //    地图上的显示区域
//    MKCoordinateRegion region = {newLocation.coordinate,span};
//    
//    MKMapView *mapView = (MKMapView*)[self.view viewWithTag:1000];
//    [mapView setRegion:region animated:YES];
//}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error
{
    NSLog(@"%s",__func__);
    
    NSLog(@"%@",error);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
