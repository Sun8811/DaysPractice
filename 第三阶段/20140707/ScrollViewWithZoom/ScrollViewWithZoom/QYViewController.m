//
//  QYViewController.m
//  ScrollViewWithZoom
//
//  Created by QingYun on 14-7-7.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController () <UIScrollViewDelegate>

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor orangeColor];
    
//    设置scrollView缩小的最小值，实际在真实缩小的时候， 可以缩小的比例比0.5倍要小， 但是松手之后， 将会恢复到0.5倍。
//    0.5 和0.5f的区别是什么？ 0.5代表的数据类型是double 0.5f代表的数据类型是float
    scrollView.minimumZoomScale = 0.5f;
    scrollView.maximumZoomScale = 3.0f;
    scrollView.delegate = self;
    scrollView.pagingEnabled = YES;
    
    UIImageView *imageView = [[UIImageView alloc]  initWithFrame:self.view.bounds];
//    如果图片的格式是PNG格式， 那么图片的名字后缀可以省略，否则必须添加后缀名，以标识图片的格式
    imageView.image = [UIImage imageNamed:@"IMG_0004.JPG"];
    imageView.tag = 1001;
    scrollView.contentSize = CGSizeMake(imageView.bounds.size.width*3, imageView.bounds.size.height*3);
    [scrollView addSubview:imageView];
    
    UIImageView *anotherImageView = [[UIImageView alloc]  initWithFrame:CGRectMake(320, 0, 320, 480)];
    //    如果图片的格式是PNG格式， 那么图片的名字后缀可以省略，否则必须添加后缀名，以标识图片的格式
    anotherImageView.image = [UIImage imageNamed:@"IMG_0004.JPG"];
    anotherImageView.tag = 1002;
    [scrollView addSubview:anotherImageView];

    [self.view addSubview:scrollView];
}

#pragma mark -
#pragma mark UIScrollViewDelegate

//如何获取到imageView?
- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
//    UIPinchGestureRecognizer *pinchGesture = scrollView.pinchGestureRecognizer;
//    CGPoint curPoint = [pinchGesture locationInView:scrollView];
//    NSLog(@"%@",NSStringFromCGPoint(curPoint));
    
    UIPanGestureRecognizer *panGesture = scrollView.panGestureRecognizer;
    CGPoint curPanPoint = [panGesture locationInView:scrollView];
    NSLog(@"%@",NSStringFromCGPoint(curPanPoint));
    
    if (scrollView.contentOffset.x > 280) {
        return [scrollView viewWithTag:1002];
    }else
    {
         return [scrollView viewWithTag:1001];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
