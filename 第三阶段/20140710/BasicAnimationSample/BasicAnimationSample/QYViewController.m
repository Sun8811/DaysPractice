//
//  QYViewController.m
//  BasicAnimationSample
//
//  Created by QingYun on 14-7-10.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController ()
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *mainView;
@property (strong, nonatomic) IBOutlet UIView *superView;

@end


@implementation QYViewController


- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//- (IBAction)doAnimation:(id)sender
//{
////    transfor.scale 是执行动画的视图的keyPath.在这里指的是greenView.layer
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    animation.duration = 1.0f;
////    设置动画的重复次数， 默认是1
//    animation.repeatCount = 1;
//    animation.autoreverses = YES;
////    设置动画开始的时候， 的初始值
//    animation.fromValue  = [NSNumber numberWithFloat:0.5];
////    设置动画结束的时候的值
//    animation.toValue = [NSNumber numberWithFloat:1.0f];
//    
//    [self.greenView.layer addAnimation:animation forKey:nil];
//
//}

//- (IBAction)doAnimation:(id)sender
//{
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"bounds"];
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    animation.duration = 1.0f;
//    //    设置动画的重复次数， 默认是1
//    animation.repeatCount = 3;
//    animation.autoreverses = YES;
//    
//    //    设置动画开始的时候， 的初始值
//    animation.fromValue  = [NSValue valueWithCGRect:self.greenView.bounds];
//    //    设置动画结束的时候的值
//    animation.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 100, 100)];
//    
//    [self.greenView.layer addAnimation:animation forKey:nil];
//    
//}


//- (IBAction)doAnimation:(id)sender
//{
//    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
//    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//    animation.duration = 5.0f;
//    //    设置动画的重复次数， 默认是1
//    animation.repeatCount = CGFLOAT_MAX;
//    animation.autoreverses = YES;
//    
//    //    设置动画开始的时候， 的初始值
//    animation.fromValue  = [NSNumber numberWithFloat:0.0f];
//    //    设置动画结束的时候的值
////    animation.byValue = [NSNumber numberWithFloat:1.0f];
//    animation.toValue = [NSNumber numberWithFloat:30.0f];
//    
//    [self.greenView.layer addAnimation:animation forKey:nil];
//    
//}

//- (IBAction)doAnimation:(id)sender
//{
//    CABasicAnimation *animationOne = [[self class] opacityForever_Animation:3.0f];
//    CABasicAnimation *animationTwo = [[self class] moveX:3.0f X:[NSNumber numberWithFloat:260.0f]];
//    CABasicAnimation *animationThree = [[self class] scale:[NSNumber numberWithFloat:0.8f] orgin:[NSNumber numberWithFloat:0.1f] durTimes:3.0f Rep:3];
//    
//    CABasicAnimation *animationFour = [[self class] animationWithKeyPath:@"transform.scale" FromValue:[NSNumber numberWithFloat:0.1f] ToValue:[NSNumber numberWithFloat:0.9f] DurTimes:3];
//    
//    CAAnimationGroup *animation = [[self class] groupAnimation:@[
//                                                                 animationOne,animationTwo,animationThree,animationFour] durTimes:3.0f Rep:3];
//    
//    [self.greenView.layer addAnimation:animation forKey:nil];
//    
//}

- (IBAction)doAnimation:(id)sender
{
    CATransition *transition = [CATransition animation];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromLeft;
    
    transition.duration = 2.5f;
    transition.repeatCount = 1;
    [self.superView.layer addAnimation:transition forKey:@"teacher_zhang"];
    
    if (!self.greenView.hidden) {
        self.greenView.hidden = YES;
    }else
    {
        self.greenView.hidden = NO;
    }
    
//
}



+(CABasicAnimation *)opacityForever_Animation:(float)time
{
  
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"opacity"];

    animation.fromValue=[NSNumber numberWithFloat:1.0];

    animation.toValue=[NSNumber numberWithFloat:0.0];

    animation.autoreverses=YES;

    animation.duration=time;

//    animation.repeatCount=CGFLOAT_MAX;
    animation.repeatCount = 1;

    animation.removedOnCompletion=NO;

    /*
     fillMode
        作用就是决定当前对象过了非active时间段的行为. 比如动画开始之前,动画结束之后。
        如果是一个动画CAAnimation,则需要将其removedOnCompletion设置为NO,要不然fillMode不起作用.
        fillMode的意义
        kCAFillModeRemoved   是默认值,也就是说当动画开始前和动画结束后,动画对layer都没有影响,动画结束后,layer会恢复到之前的状态
        kCAFillModeForwards  当动画结束后,layer会一直保持着动画最后的状态
        kCAFillModeBackwards 这个和kCAFillModeForwards是相对的,就是在动画开始前,你只要将动画加入了一个layer,layer便立即进入动画的初始状态并等待动画开始.你可以这样设定测试代码,将一个动画加入一个layer的时候延迟5秒执行.然后就会发现在动画没有开始的时候,只要动画被加入了layer,layer便处于动画初始状态
        kCAFillModeBoth 理解了上面两个,这个就很好理解了,这个其实就是上面两个的合成.动画加入后开始之前,layer便处于动画初始状态,动画结束后layer保持动画最后的状态.
     */
    
    animation.fillMode=kCAFillModeBackwards;

    return animation;
  
}

//可以修改transform.translation.x来实现平移
//修改transform.translation.y 来实现垂直移动
+(CABasicAnimation *)moveX:(float)time X:(NSNumber *)x
{
   
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
    
    animation.toValue=x;
    
    animation.duration=time;
    
    animation.repeatCount = 2;
    
    animation.removedOnCompletion=NO;
    animation.autoreverses = YES;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
   
}


+(CABasicAnimation *)scale:(NSNumber *)Multiple orgin:(NSNumber *)orginMultiple durTimes:(float)time Rep:(float)repeatTimes{
    
    CABasicAnimation *animation=[CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    animation.fromValue=orginMultiple;
    
    animation.toValue=Multiple;
    
    animation.duration=time;
    
    animation.autoreverses=YES;
    
    animation.repeatCount=repeatTimes;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    return animation;
    
}

+ (CABasicAnimation*)animationWithKeyPath:(NSString*)keyPath FromValue:(NSNumber*)fromValue ToValue:(NSNumber*)toValue DurTimes:(CGFloat)duration
{
    CABasicAnimation *animtion = [CABasicAnimation animationWithKeyPath:keyPath];
    animtion.fromValue = fromValue;
    animtion.toValue = toValue;
    animtion.duration = duration;
    animtion.autoreverses = YES;
    animtion.fillMode = kCAFillModeForwards;
    animtion.removedOnCompletion = NO;
    return animtion;
}


+(CAAnimationGroup *)groupAnimation:(NSArray *)animationAry durTimes:(float)time Rep:(float)repeatTimes
{
         
    CAAnimationGroup *animation=[CAAnimationGroup animation];
    
    animation.animations= animationAry;
    
    animation.duration=time;
    
    animation.repeatCount=repeatTimes;
    
    animation.removedOnCompletion=NO;
    
    animation.fillMode=kCAFillModeForwards;
    
    
    return animation;
    
}


@end
