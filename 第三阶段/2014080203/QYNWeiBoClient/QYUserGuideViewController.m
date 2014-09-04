//
//  QYUserGuideViewController.m
//  QYNWeiBoClient
//
//  Created by QingYun on 14-7-24.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYUserGuideViewController.h"

@interface QYUserGuideViewController ()

@end

@implementation QYUserGuideViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//   按页进行滑动
    self.scrollView.pagingEnabled = YES;
//    水平、和垂直的指示器都不显示
    self.scrollView.showsHorizontalScrollIndicator = NO;
    self.scrollView.showsVerticalScrollIndicator = NO;
    
    self.scrollView.delegate = self;
//
    const NSUInteger nPageCount = 5;
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width*nPageCount, self.view.bounds.size.height);
    
    for (int i = 0; i < nPageCount; i++) {
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(320*i, 0, self.view.bounds.size.width, self.view.bounds.size.height)];
        imageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"new_features_%d.jpg",i+1]];
        [self.scrollView addSubview:imageView];
        QYSafeRelease(imageView);
    }
}


#pragma mark -
#pragma mark UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    NSUInteger offset = self.view.bounds.size.width * 4 + 100;
    if (scrollView.contentOffset.x - offset > 0) {
        [QYViewControllerManager presentQYViewController:QYViewControllerLogin];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_scrollView release];
    [super dealloc];
}
@end
