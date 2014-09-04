//
//  QYCircleLayout.h
//  CircleLayoutDemo
//
//  Created by qingyun on 14-8-19.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYCircleLayout : UICollectionViewLayout
@property (nonatomic, assign) NSInteger cellCount;
@property (nonatomic, assign) CGPoint center;
@property (nonatomic, assign) CGFloat radius;
@end
