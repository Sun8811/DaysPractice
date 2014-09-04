//
//  QYRootViewController.m
//  QYCatalog
//
//  Created by QingYun on 14-4-23.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYRootViewController.h"

@interface QYRootViewController ()

@end

@implementation QYRootViewController
{
    UIImageView *imageView;
}

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
    // Do any additional setup after loading the view.
//    self.view.backgroundColor = [UIColor lightGrayColor];
    self.view.backgroundColor = [UIColor orangeColor];
//    
//    imageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 50, 280, 200)];
//    imageView.animationImages = @[[UIImage imageNamed:@"scene1.jpg"],
//                                 [ UIImage imageNamed:@"scene2.jpg"],
//                                  [UIImage imageNamed:@"scene3.jpg"],
//                                  [UIImage imageNamed:@"scene4.jpg"],
//                                  [UIImage imageNamed:@"scene5.jpg"]
//                                  ];
//    
//    imageView.animationDuration = 5.0;
//    
//    [self.view addSubview:imageView];
//    
//    
//    
//    UIButton *button = [[UIButton alloc ]initWithFrame:CGRectMake(30, 340, 260, 40)];
//    [button setTitle:@"动画" forState:UIControlStateNormal];
//    [button addTarget:self action:@selector(onButton:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:button];
    
    UIWebView *webView = [[UIWebView alloc] initWithFrame:self.view.bounds];
    webView.scalesPageToFit = YES;
    [self.view addSubview:webView];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"www.baidu.com"]]];
   
    
    
}


- (void)onButton:(UIButton*)sender
{
    if ([imageView isAnimating]) {
        [imageView stopAnimating];
    }else
    {
        [imageView startAnimating];
    }

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
