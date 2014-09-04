//
//  QYCustomView.m
//  ScaleSample
//
//  Created by QingYun on 14-7-5.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYCustomView.h"

@implementation QYCustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
//        注意，对于UIView视图来说， 默认情况不支持多点触摸
        self.multipleTouchEnabled = YES;
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (touches.count < 2) {
        return;
    }
    NSArray *allObjects = [touches allObjects];
    
    UITouch *firstTouch = allObjects[0];
    UITouch *secondTouch = allObjects[1];
    
//    获取第一个手指初始点
    CGPoint preFirstTouchPoint = [firstTouch previousLocationInView:self];
//    获取第一年手指当前点，可以理解为第一个手指的结束点
    CGPoint curFirstTouchPoint = [firstTouch locationInView:self];
    
//    获取第二个手指的初始点
    CGPoint preSecondTouchPoint = [secondTouch previousLocationInView:self];
//    获取第二个手指的当前点。可以理解为第二个手指的结束点
    CGPoint curSecondTouchPoint = [secondTouch locationInView:self];
    
//    计算初始的时候， 两个手指的距离  sqrtf是C语言的库函数， 功能是开方，powf也是C语言的库函数，表示N次方，因为是2,所以求的是平方
    CGFloat startDistance = sqrtf(powf(preSecondTouchPoint.x - preFirstTouchPoint.x, 2) +
                                  powf(preSecondTouchPoint.y-preFirstTouchPoint.y, 2));
//    计算结束的时候，两年手指的距离
    CGFloat endDistance = sqrtf(powf(curSecondTouchPoint.x - curFirstTouchPoint.x, 2) +
                                powf(curSecondTouchPoint.y - curFirstTouchPoint.y, 2));
    
//    如果结束的时候， 两点之间的距离经初始的时候变大， 就表示是放大功以有， 反之则是缩小功能。
    if (endDistance - startDistance > 0) {
        NSLog(@"放大");
    }else
    {
        NSLog(@"缩小");
    }
    
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    
}

@end
