//
//  ViewController.m
//  QuaSample
//
//  Created by QingYun on 14-7-10.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import "QYCustomView.h"


@interface ViewController ()
            
@property (nonatomic, retain) QYCustomView *greenView;
@end

@implementation ViewController
            
- (void)viewDidLoad {
    [super viewDidLoad];
    self.greenView = [[QYCustomView alloc] initWithFrame:CGRectMake(30, 100, 50, 50)];
    self.greenView.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:self.greenView];
    
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(30, 200, 60, 40)];
    [button setTitle:@"Button" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(doAnimation:) forControlEvents:UIControlEventTouchUpInside];
    button.backgroundColor = [UIColor darkGrayColor];
    [self.view addSubview:button];
    
    
}


- (IBAction)doAnimation:(id)sender
{
    //需要分配内存，创建path
    CGMutablePathRef path = CGPathCreateMutable();
    
//  CGPathAddRect(path, NULL, CGRectMake(26.5, 26.5, 300, 400));
    CGPathMoveToPoint(path, NULL, 20, 20);
    CGPathAddCurveToPoint(path, NULL, 0, 70, 250, 200, 300, 400);

    
    CAKeyframeAnimation *animation = [[self class] keyframeAniamtion:path durTimes:3.0f Rep:2];
    [self.greenView.layer addAnimation:animation forKey:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

+(CAKeyframeAnimation *)keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes
{
    
    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
    
    animation.path=path;
    animation.removedOnCompletion=NO;
    animation.fillMode=kCAFillModeForwards;
    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation.autoreverses=NO;
    animation.duration=time;
    animation.repeatCount=repeatTimes;
    
    return animation;
    
}



@end
