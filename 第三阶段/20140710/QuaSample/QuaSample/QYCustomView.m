//
//  QYCustomView.m
//  QuaSample
//
//  Created by QingYun on 14-7-10.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYCustomView.h"

@interface QYCustomView ()

@property (nonatomic, retain) UIImage *image;
@end
@implementation QYCustomView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.image = [UIImage imageNamed:@"IMG_0004.JPG"];
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
//- (void)drawRect:(CGRect)rect
//{
////    获取当前绘图的上下文， 在这里实际是指当前视图
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
////    设置画线的宽度，单位：象素
//    CGContextSetLineWidth(ctx, 2.0f);
////    设置画笔的起始点
//    CGContextMoveToPoint(ctx, 20, 20);
////    画一条线， 线的开始点在设置的起始点，参数是结束点
//    CGContextAddLineToPoint(ctx, 20, 200);
//    CGContextAddLineToPoint(ctx, 200, 200);
//    CGContextAddLineToPoint(ctx, 200, 20);
//    CGContextAddLineToPoint(ctx, 20, 20);
////    设置画笔颜色
//    CGContextSetStrokeColorWithColor(ctx, [UIColor orangeColor].CGColor);
////    绘制
//    CGContextStrokePath(ctx);
////    CGContextFillPath(ctx);
//}

//- (void)drawRect:(CGRect)rect
//{
//    //    获取当前绘图的上下文， 在这里实际是指当前视图
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //    设置画线的宽度，单位：象素
//    CGContextSetLineWidth(ctx, 2.0f);
//    //    设置画笔的起始点
//    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
//    //    绘制
//    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
//    
//    CGRect rt = {30,100,100,100};
//    CGContextAddRect(ctx, rt);
////    绘制矩形区域
//    CGContextStrokeRect(ctx, rt);
////    可以通过第二个参数， 来确定是绘制边界，还是填冲区域
////    CGContextDrawPath(ctx, kCGPathFillStroke);
////    填冲矩形区域
//    CGContextFillRect(ctx, rt);
//}

//- (void)drawRect:(CGRect)rect
//{
//    //    获取当前绘图的上下文， 在这里实际是指当前视图
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //    设置画线的宽度，单位：象素
//    CGContextSetLineWidth(ctx, 2.0f);
//    //    设置画笔的起始点
//    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
//    //    绘制
//    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
//    
//    CGRect rt = {30,100,200,200};
////    绘制椭圆，如果矩形区域是一个正方形，那么绘制的是一个圆
//    CGContextAddEllipseInRect(ctx, rt);
//    CGContextDrawPath(ctx, kCGPathFillStroke);
//}


//- (void)drawRect:(CGRect)rect
//{
//    //    获取当前绘图的上下文， 在这里实际是指当前视图
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //    设置画线的宽度，单位：象素
//    CGContextSetLineWidth(ctx, 2.0f);
//    //    设置画笔的起始点
//    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
//    //    绘制
//    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
//    
//    CGRect rt = {30,100,200,200};
////    将创建好的图像数据， 绘制在当前视图上
//    [self.image drawInRect:rt];
//}


//- (void)drawRect:(CGRect)rect
//{
//    //    获取当前绘图的上下文， 在这里实际是指当前视图
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //    设置画线的宽度，单位：象素
//    CGContextSetLineWidth(ctx, 2.0f);
//    //    设置画笔的起始点
//    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
//    //    绘制
//    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
//    
//    CGRect rt = {30,100,200,200};
//    //    将创建好的图像数据， 绘制在当前视图上
//    [self.image drawInRect:rt];
//}

//- (void)drawRect:(CGRect)rect
//{
//    //    获取当前绘图的上下文， 在这里实际是指当前视图
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //    设置画线的宽度，单位：象素
//    CGContextSetLineWidth(ctx, 2.0f);
//    //    设置画笔的起始点
//    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
//    //    绘制
//    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
//    
//    CGContextMoveToPoint(ctx, 100, 100);
//    CGContextAddLineToPoint(ctx, 100, 200);
//    CGContextAddLineToPoint(ctx, 300, 200);
//
//    CGContextMoveToPoint(ctx, 100, 100);
//    CGContextAddArcToPoint(ctx, 100, 200, 300, 200, 100);
//    CGContextStrokePath(ctx);
//    
//}

//- (void)drawRect:(CGRect)rect
//{
//    //    获取当前绘图的上下文， 在这里实际是指当前视图
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //    设置画线的宽度，单位：象素
//    CGContextSetLineWidth(ctx, 2.0f);
//    //    设置画笔的起始点
//    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
//    //    绘制
//    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
//    
////    CGContextMoveToPoint(ctx, 100, 100);
////    CGContextAddLineToPoint(ctx, 100, 200);
////    CGContextAddLineToPoint(ctx, 300, 200);
//    
//    CGContextMoveToPoint(ctx, 20, 20);
//
//    CGContextAddCurveToPoint(ctx, 220, 200, 30, 250, 260, 400);
//    CGContextStrokePath(ctx);
//    
//}

//- (void)drawRect:(CGRect)rect
//{
//    //    获取当前绘图的上下文， 在这里实际是指当前视图
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    //    设置画线的宽度，单位：象素
//    CGContextSetLineWidth(ctx, 2.0f);
//    //    设置画笔的起始点
//    CGContextSetStrokeColorWithColor(ctx, [UIColor blueColor].CGColor);
//    //    绘制
//    CGContextSetFillColorWithColor(ctx, [UIColor orangeColor].CGColor);
//    
//    //    CGContextMoveToPoint(ctx, 100, 100);
//    //    CGContextAddLineToPoint(ctx, 100, 200);
//    //    CGContextAddLineToPoint(ctx, 300, 200);
//    
//    CGContextMoveToPoint(ctx, 100, 400);
//    
//    CGContextAddQuadCurveToPoint(ctx, 300, 460, 300, 400);
//    CGContextStrokePath(ctx);
//    
//}


//- (void)drawRect:(CGRect)rect
//{
//    CGMutablePathRef path;
//    CGPathAddRect(path, NULL, CGRectMake(0, 0, 300, 400));
//    
//    CAKeyframeAnimation *animation = [[self class] keyframeAniamtion:path durTimes:3.0f Rep:2];
//    [self.layer addAnimation:animation forKey:nil];
//}
//
//
//+(CAKeyframeAnimation *)keyframeAniamtion:(CGMutablePathRef)path durTimes:(float)time Rep:(float)repeatTimes
//{
//    
//    CAKeyframeAnimation *animation=[CAKeyframeAnimation animationWithKeyPath:@"position"];
//    
//    animation.path=path;
//    animation.removedOnCompletion=NO;
//    animation.fillMode=kCAFillModeForwards;
//    animation.timingFunction=[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
//    animation.autoreverses=NO;
//    animation.duration=time;
//    animation.repeatCount=repeatTimes;
//    
//    return animation;
//    
//}
//



@end
