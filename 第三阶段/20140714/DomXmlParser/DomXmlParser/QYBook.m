//
//  QYBook.m
//  SaxXmlParser
//
//  Created by QingYun on 14-7-14.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYBook.h"

@implementation QYBook

- (NSString *)description
{
    return [NSString stringWithFormat:@"category:%@,bookName:%@,author:%@,Price:%f,Year:%@", self.category,self.bookName,self.author,self.price,self.year];
}

@end
