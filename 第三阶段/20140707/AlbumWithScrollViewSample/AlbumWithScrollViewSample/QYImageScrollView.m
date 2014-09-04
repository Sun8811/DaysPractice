//
//  QYImageScrollView.m
//  AlbumWithScrollViewSample
//
//  Created by QingYun on 14-7-7.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYImageScrollView.h"

@implementation QYImageScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.minimumZoomScale = 0.5f;
        self.maximumZoomScale = 2.5f;
        self.delegate = self;
        _imageView = [[UIImageView alloc] initWithFrame:self.bounds];
        _imageView.userInteractionEnabled = YES;
        _imageView.multipleTouchEnabled = YES;
        _imageView.layer.cornerRadius = 200.0f;
        _imageView.layer.masksToBounds = YES;
//        曾经说过，UIImageView 默认userInteractionEnable 是NO
        [self addSubview:_imageView];
    }
    return self;
}

#pragma mark -
#pragma mark UIScrollViewDelegate
- (UIView*)viewForZoomingInScrollView:(QYImageScrollView *)scrollView
{
    return self.imageView;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
