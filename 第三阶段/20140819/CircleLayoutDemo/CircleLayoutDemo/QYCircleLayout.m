//
//  QYCircleLayout.m
//  CircleLayoutDemo
//
//  Created by qingyun on 14-8-19.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYCircleLayout.h"

@implementation QYCircleLayout

//在布局对象， 执行布局动作之前，调用这个方法， 一般情况下， 我们会在这个方法里完成一些数据的初始化动作。
- (void)prepareLayout
{
    [super prepareLayout];
    CGSize size = self.collectionView.frame.size;
    self.cellCount = [self.collectionView numberOfItemsInSection:0];
    self.center = CGPointMake(size.width / 2.0,size.height / 2.0);
//    取size的宽和高两个数值最小的那个值，之所以要除以2.5而不是除以2，是因为每一个单元格都是有长和宽，如果除以2,则会出现显示不全的问题。
    self.radius = MIN(size.width, size.height) / 2.5;
}

-(CGSize)collectionViewContentSize
{
    return self.collectionView.frame.size;
}

//对于UICollectionView的布局来说， 最重要的就是为每一个item也就是单元格设计布局属性对象
- (UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewLayoutAttributes *attributes = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    attributes.size = CGSizeMake(30, 30);
    attributes.center = CGPointMake(_center.x + _radius * cosf(2 * indexPath.item * M_PI / _cellCount),
                                    _center.y + _radius * sinf(2 * indexPath.item * M_PI / _cellCount));
//    if (indexPath.item % 2 == 0) {
//        attributes.size = CGSizeMake(40, 40);
//    }
    return attributes;
}

//返回，在rect范围内的所有的item的布局属性
- (NSArray *)layoutAttributesForElementsInRect:(CGRect)rect
{
    NSMutableArray *attributes = [NSMutableArray array];
//    循环生成每一个item的布局属性
    for (int i = 0 ;  i < self.cellCount; i++) {
        //indexPath可以唯一标识，CollectionView里任意一个item
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        [attributes addObject:[self layoutAttributesForItemAtIndexPath:indexPath]];
        
        
    }
    return attributes;
}

@end
