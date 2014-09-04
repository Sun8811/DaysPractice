//
//  QYViewController.m
//  AnimationWithUIViewSample
//
//  Created by QingYun on 14-7-7.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController ()
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (nonatomic, assign) CGRect oldFrame;

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (IBAction)startAnimation:(id)sender
{
    
    self.oldFrame = self.greenView.frame;
    CGPoint oldCenter = self.greenView.center;
//    开始动画
    [UIView beginAnimations:@"AnimationWithView"  context:"zhangsan"];
//    CGRect oldFrame = self.greenView.frame;
  //   设置整个动画持续的时长，单位：秒
    [UIView setAnimationDuration:5.0f];
//    从commitAnimations提交之后，动画延迟执行的时间 单位：秒
//    [UIView setAnimationDelay:2.0f];
    

//    虽然设置动画的重复次数是3次，或者是多次， 那么所有在beginAnimations 和 commitAnimations之间的代码块，均作为一次动画效果
    [UIView setAnimationRepeatCount:1];
    [UIView setAnimationDelegate:self];
//    设置当动画结束后，回调的方法
    [UIView setAnimationDidStopSelector:@selector(animationDidStop:finished:context:)];
    [UIView setAnimationWillStartSelector:@selector(animationWillStart:context:)];
    self.greenView.frame = CGRectMake(self.oldFrame.origin.x+100, self.oldFrame.origin.y+100, self.oldFrame.size.width,self.oldFrame.size.height);
    self.greenView.center = CGPointMake(oldCenter.x+300, oldCenter.y+100);
//    self.greenView.alpha = 0.0f;
    self.greenView.backgroundColor = [UIColor blackColor];
    
//    添加旋转动画
    self.greenView.transform = CGAffineTransformMakeRotation(160);
//    添加放大，缩小动画， 两个参数：分别在x ,y 放大缩小的比例（0.0 － 1.0
    self.greenView.transform = CGAffineTransformMakeScale(1.0, 0.5);
//    self.greenView.transform = CGAffineTransformMakeTranslation(0.6, 0.6);
    
// 提交动画，之后动画由系统接管并开始
    [UIView commitAnimations];
    
}

-(void)animationDidStop:(NSString *)animationID finished:(NSNumber *)finished context:(void *)context
{
    NSLog(@"%s",__func__);
    NSLog(@"%@",animationID);
    NSLog(@"%@",[NSString stringWithUTF8String:context]);
    [UIView beginAnimations:nil  context:nil];
    [UIView setAnimationDuration:5.0f];
    [UIView setAnimationRepeatCount:1];
    self.greenView.alpha = 1.0f;
    self.greenView.backgroundColor = [UIColor redColor];
    self.greenView.frame = self.oldFrame;
    // 提交动画，之后动画由系统接管并开始
    [UIView commitAnimations];
}

-(void)animationWillStart:(NSString *)animationID context:(void *)context
{
    NSLog(@"%s",__func__);
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
