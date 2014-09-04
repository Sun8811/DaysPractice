//
//  QYViewController.m
//  ScrollViewWithPagecontrol
//
//  Created by QingYun on 14-7-5.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"
#import "QYLoginViewController.h"

@interface QYViewController () <UIScrollViewDelegate>

@property (nonatomic,retain) UIScrollView *bgScrollView;
@end

@implementation QYViewController
{
    UIPageControl *pageControl;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bgScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    self.bgScrollView.backgroundColor = [UIColor orangeColor];
    self.bgScrollView.pagingEnabled = YES;
    self.bgScrollView.directionalLockEnabled = YES;
    self.bgScrollView.showsHorizontalScrollIndicator = NO;
    self.bgScrollView.showsVerticalScrollIndicator = NO;
    self.bgScrollView.delegate = self;
    self.bgScrollView.contentSize = CGSizeMake(self.view.bounds.size.width*5, self.view.bounds.size.height);
    
    for (int i = 1; i < 6; i++) {
        NSString *imagName =  [NSString stringWithFormat:@"new_features_%d.jpg",i];
        NSLog(@"%@",imagName);
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*(i-1), 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        imageView.image = [UIImage imageNamed:imagName];
        [self.bgScrollView addSubview:imageView];
    }
    
    pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(30, self.view.bounds.size.height - 50, 260, 40)];
    pageControl.numberOfPages = 5;
    pageControl.pageIndicatorTintColor = [UIColor blackColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    [self.view addSubview:self.bgScrollView];
//    一定要注意添加的顺序， 因为要考虑到视图的层次结构
    [self.view addSubview:pageControl];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSLog(@"%f",scrollView.contentOffset.x);
    if ((scrollView.contentOffset.x - self.view.bounds.size.width * 4) > 80) {
        QYLoginViewController *loginViewController = [[QYLoginViewController alloc] init];
        [self presentViewController:loginViewController animated:YES completion:nil];
    }
    pageControl.currentPage = scrollView.contentOffset.x / self.view.bounds.size.width;
    
}


@end
