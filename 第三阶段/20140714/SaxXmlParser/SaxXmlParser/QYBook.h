//
//  QYBook.h
//  SaxXmlParser
//
//  Created by QingYun on 14-7-14.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QYBook : NSObject

//书的类别
@property (nonatomic, retain) NSString *category;
//书名
@property (nonatomic, retain) NSString *bookName;
//书的语言，比如是中文 还是英文
@property (nonatomic, retain) NSString *language;
@property (nonatomic, retain) NSString *author;
@property (nonatomic, retain) NSString *year;
@property (nonatomic, assign) CGFloat price;
@end
