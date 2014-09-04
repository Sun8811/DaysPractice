//
//  QYCollectionViewCell.m
//  CollectionViewDemo
//
//  Created by qingyun on 14-8-19.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYCollectionViewCell.h"

@implementation QYCollectionViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _imageView  = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_imageView];
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

@end
