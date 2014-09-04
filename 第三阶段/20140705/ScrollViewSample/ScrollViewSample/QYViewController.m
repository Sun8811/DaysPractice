//
//  QYViewController.m
//  ScrollViewSample
//
//  Created by QingYun on 14-7-5.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController ()<UIScrollViewDelegate>

@property (nonatomic, retain) UIScrollView *bgScrollView;
@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bgScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.bgScrollView.delegate = self;
    self.bgScrollView.backgroundColor = [UIColor orangeColor];
//    对于UISCrollView来说， 必须设置内容视图的大小， 默认是0，就是说内容视图跟框架本身是一样
    self.bgScrollView.contentSize = CGSizeMake(320*2, 480*2);
//    如果设置成NO,则表示，视图不能滚动。否则才可以滚动
//    self.bgScrollView.scrollEnabled = NO;
//    在移动的时候， 会锁定一个方向， 保证你的移动是在一个方向上变化， 而不是无序的变化
    self.bgScrollView.directionalLockEnabled = YES;
    
//    contentOffSet是内容视图的原点
    self.bgScrollView.contentOffset = CGPointMake(30, 30);
//    当点击状态栏的时候 ，是否支持内容视图回到顶部
    self.bgScrollView.scrollsToTop = YES;
//    当内容视图滑动到边界的时候， 是否有弹回的效果
    self.bgScrollView.bounces = NO;
    
//  滑动的时候， 是否在滑动到边界的时候，停止，如果设置为YES则停止
    self.bgScrollView.pagingEnabled = YES;
//    self.bgScrollView.contentInset = UIEdgeInsetsMake(50, 50, 50, 50);
    
//    主要功能是是否隐藏水平的指示器
//    self.bgScrollView.showsHorizontalScrollIndicator = NO;
    
//    [self.bgScrollView flashScrollIndicators];
    
    self.bgScrollView.indicatorStyle = UIScrollViewIndicatorStyleBlack;
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(30,30, 100, 480)];
    label.text = @"河南青云";
    label.backgroundColor = [UIColor lightGrayColor];
    [self.bgScrollView addSubview:label];
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(100, 50, 80, 40)];
    [button setTitle:@"button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(onButtonClicked) forControlEvents:UIControlEventTouchUpInside];
    [self.bgScrollView addSubview:button];
    [self.view addSubview:self.bgScrollView];
    
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.bgScrollView flashScrollIndicators];
}
- (void)onButtonClicked
{
    [self.bgScrollView scrollRectToVisible:CGRectMake(-100, 50, 80, 40) animated:YES];
//    [self.bgScrollView setContentOffset:CGPointMake(100, 100)];
    [self.bgScrollView setContentOffset:CGPointMake(100, 100) animated:YES];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UISCrollViewDelegate

//
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    NSLog(@"%@",NSStringFromCGPoint(scrollView.contentOffset));
//}

//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
//    NSLog(@"%s",__func__);
//}


//第二个参数是一个传入、传出参数， 含义是这个参第一可以是系统在回调这个方法的时候， 传给我们， 让我们使用的参数，
//第二个含议是：这个参数，我们也是可以修改的， 修改这个参数可以影响scrollView的动画效果
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset
{
    NSLog(@"%s,%@",__func__,NSStringFromCGPoint(velocity));
    *targetContentOffset = CGPointMake(200, 200);
}

//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
//    NSLog(@"%s,%@",__func__,NSStringFromCGPoint(scrollView.contentOffset));
//}
//

//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
//{
//    NSLog(@"%s",__func__);
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    NSLog(@"%s",__func__);
//}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSLog(@"%s",__func__);
}

@end
