//
//  QYImageViewController.m
//  TodayDemo
//
//  Created by qingyun on 14-6-27.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYImageViewController.h"

@interface QYImageViewController ()
@property(nonatomic,retain) UIImageView *imageview;
@end

@implementation QYImageViewController

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
    
    self.title =@"Image";
    self.view.backgroundColor =[UIColor blackColor];
   //创建UIImageView
    [self createImageView];
    
    //创建Slider
    
    [self createSlider];
    
    //创建label
    [self createLabel];
}

-(void)createSlider
{
    UISlider *slider =[[UISlider alloc]initWithFrame:CGRectMake(10, 300, 300, 30)];
    slider.minimumValue =1;
    slider.maximumValue =10;
    slider.value=3;
    [slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:slider];
    [slider release];
 
}
-(void)createImageView
{
    _imageview =[[UIImageView alloc]initWithFrame:CGRectMake(30, 70, 260, 160)];
    [_imageview setAnimationDuration:3];
    NSMutableArray *imageArray =[NSMutableArray array];
    for (int i =0; i<5; i++) {
        [imageArray addObject:[UIImage imageNamed:[NSString stringWithFormat:@"scene%d.jpg",i+1]]];
        
    }
    [_imageview setAnimationImages:imageArray];
    [_imageview setAnimationDuration:3];
    [_imageview startAnimating];
    [self.view addSubview:_imageview];
  
}
-(void)createLabel
{
    UILabel *label =[[UILabel alloc]initWithFrame:CGRectMake(140, 350-44, 320, 44)];
    label.text =@"Duration";
    label.textColor =[UIColor whiteColor];
    [self.view addSubview:label];

}

-(void)sliderAction:(UISlider *)sender
{
    _imageview.animationDuration =sender.value ;
    
    [_imageview startAnimating];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)dealloc
{
    [_imageview release];
    [super dealloc];
}


@end
