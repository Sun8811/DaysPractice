//
//  QYViewController.m
//  AlbumWithScrollViewSample
//
//  Created by QingYun on 14-7-7.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"
#import "QYImageScrollView.h"

@interface QYViewController () <UIScrollViewDelegate>

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIScrollView *scrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
    scrollView.backgroundColor = [UIColor orangeColor];
    scrollView.pagingEnabled = YES;
    scrollView.delegate = self;
    scrollView.contentSize = CGSizeMake(self.view.bounds.size.width *5 , self.view.bounds.size.height);
    
    for (int i = 0; i < 5; i++) {
        QYImageScrollView *imgScrollView = [[QYImageScrollView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width*i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        NSString *imgName = [NSString stringWithFormat:@"new_features_%d.jpg",i+1];
        imgScrollView.imageView.image = [UIImage imageNamed:imgName];
        imgScrollView.tag = i+1;
        [scrollView addSubview:imgScrollView];
    }
    [self.view addSubview:scrollView];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

static int preIndex = 1;
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    int curIndex = scrollView.contentOffset.x / 320 + 1;
    QYImageScrollView *imgScrollView =(QYImageScrollView*)[scrollView viewWithTag:preIndex];
    NSLog(@"%d",curIndex);
    if (curIndex != preIndex && imgScrollView.zoomScale != 1.0f) {
        imgScrollView.zoomScale = 1.0f;
    }
    preIndex = curIndex;
}
@end
