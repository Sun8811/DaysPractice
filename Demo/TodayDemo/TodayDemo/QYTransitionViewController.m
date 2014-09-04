//
//  QYTransitionViewController.m
//  TodayDemo
//
//  Created by qingyun on 14-6-27.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYTransitionViewController.h"

@interface QYTransitionViewController ()
@property(nonatomic,retain) UIImageView *firstImageView;
@property(nonatomic,retain) UIImageView *secondImageView;
@property(nonatomic,retain) UIToolbar *toolbar;
@property(nonatomic,retain) UIView *container;

@end

@implementation QYTransitionViewController

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
    self.title =@"Transitions";
    self.view.backgroundColor =[UIColor blackColor];
    //创建一个view容器
    _container =[[UIView alloc]initWithFrame:CGRectMake(10, 70, 300, 200)];
    [self.view addSubview:_container];
    //创建UIImageView
    
    [self createImageView];
    
    //创建UItoobar
    
    [self createToolBar];
    
}
-(void)createToolBar
{
    _toolbar =[[UIToolbar alloc]initWithFrame:CGRectMake(0, 480-44, 320, 44)];
    UIBarButtonItem *fipButton =[[UIBarButtonItem alloc]initWithTitle:@"Fip Images" style:UIBarButtonItemStyleDone target:self action:@selector(fipImageAction:)];
    UIBarButtonItem *curlButton =[[UIBarButtonItem alloc]initWithTitle:@"Curl Images" style:UIBarButtonItemStyleDone target:self action:@selector(curlImageAction:)];
    UIBarButtonItem *flexibleItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    //设置toobar
    
    NSArray *array =@[flexibleItem,fipButton,curlButton,flexibleItem];
    _toolbar.items =array;
    
    [self.view addSubview:_toolbar];
    [_toolbar release];

    
}

-(void)createImageView
{
    _firstImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
    
    _secondImageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 300, 200)];
    _firstImageView.image =[UIImage imageNamed:@"scene1.jpg"] ;
    _secondImageView.image =[UIImage imageNamed:@"scene2.jpg"];
    
    [_container addSubview:_firstImageView];

}
//===========事件处理===============
-(void)fipImageAction:(UIBarButtonItem *)sender
{
    if (_firstImageView.superview) {
        [UIView transitionWithView:_container duration:0.5 options:UIViewAnimationOptionTransitionFlipFromLeft animations:^{
            [_firstImageView removeFromSuperview];
            [_container addSubview:_secondImageView];
        } completion:nil];
    }else{
    
        [UIView transitionWithView:_container duration:0.5 options:UIViewAnimationOptionTransitionFlipFromRight animations:^{
            [_secondImageView removeFromSuperview];
            [_container addSubview:_firstImageView];
        } completion:nil];
    }
    
}
-(void)curlImageAction:(UIBarButtonItem *)sender
{
    NSLog(@"123");
    if (_firstImageView.superview) {
        [UIView transitionWithView:_container duration:0.5 options:UIViewAnimationOptionTransitionCurlUp animations:^{
            [_firstImageView removeFromSuperview];
            [_container addSubview:_secondImageView];
        } completion:nil];
        
    }else{
    
        [UIView transitionWithView:_container duration:0.5 options:UIViewAnimationOptionTransitionCurlDown animations:^{
            [_secondImageView removeFromSuperview];
            [_container addSubview:_firstImageView];
        } completion:nil];
    }

}

-(void)dealloc
{
    [_firstImageView release];
    [_secondImageView release];
    [_toolbar release];
    [_container release];
    [super dealloc];
}
@end
