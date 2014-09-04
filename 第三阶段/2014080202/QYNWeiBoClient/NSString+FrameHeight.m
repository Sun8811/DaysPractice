//
//  NSString+FrameHeight.m
//  QYNWeiBoClient
//
//  Created by QingYun on 14-7-26.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "NSString+FrameHeight.h"

@implementation NSString (FrameHeight)

//根据指定的显示视图宽度，和指定的字体大小， 计算字符串所以占的高度（单位：像素)
//总体思路：字符串的总宽度 / 控件每一行显示的宽度 得到的行数，然后行数＊ 单个字体的高度，就是返回的总高度
//注意：算法由于使用了向下取整， 所以为了高度的准确，不能把第一步和第二步合并
- (CGFloat)frameHeightWithFontSize:(CGFloat)fontSize forViewWidth:(CGFloat)width
{
    NSDictionary *attributs = @{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]};
    CGSize size = [self sizeWithAttributes:attributs];
    //    每一行可以显示的字数：使用控件的宽度 / 单个字体的宽度 向下取整
    NSUInteger wordsPerLine = floor(width / fontSize);
    //    每一行显示所使用的宽度（单个字体的宽度＊每一行显示的字数）
    CGFloat widthPerLine = fontSize * wordsPerLine;
    //    显示的行数，使用字符串的整体宽度 / 每一行宽度
    NSUInteger nLines = ceil( size.width / widthPerLine );
    //    根据字体的高度，获取字符串所点用的行高
    CGFloat height = nLines * size.height ;
    return height;
    
}
@end
