//
//  QYViewController.m
//  DomXmlParser
//
//  Created by QingYun on 14-7-14.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"
#import "GDataXMLNode.h"
#import  "QYBook.h"


static  NSString * const kElementNameBook = @"book";
static  NSString * const kElementNameTitle = @"title";
static  NSString * const kElementNameAutor = @"author";
static  NSString * const kElementNameYear = @"year";
static  NSString * const kElementNamePrice = @"price";
static  NSString * const kAttributesNameBook = @"category";
static  NSString * const kAttributesTitle = @"lang";

@interface QYViewController ()

@property (nonatomic, retain) NSMutableArray *bookstore;
@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bookstore = [[NSMutableArray alloc] initWithCapacity:3];
    NSURL *xmlURL = [[NSBundle mainBundle] URLForResource:@"bookstore" withExtension:@"xml"];
//    相当于将bookstore文档里的所有数据全部读进了内存
    NSData *dataXML = [NSData dataWithContentsOfURL:xmlURL];
    
    NSError *error = nil;
    //第一步
    GDataXMLDocument *xmlDocument = [[GDataXMLDocument alloc] initWithData:dataXML options:0 error:&error];
    if (error != nil) {
        NSLog(@"Error:%@",error);
    }
    
    NSLog(@"==========%@",xmlDocument);
//  在例子里， 根元素是bookstore,根元素下的子元素是<book> </book> 
    GDataXMLElement *rootElement = [xmlDocument rootElement];
    NSLog(@"%@",rootElement);
    
//  要得到book标签的所有子元素,根据xml文档的数据情况，在这里得到的数组有三个元素， 分别对应的是三本书的相关信息
    NSArray *elements = [rootElement elementsForName:kElementNameBook];
    NSLog(@"elelments is %@",elements);
    //    来遍历所有的子标签。依次解析出子标签的属性和文本值
    for (GDataXMLElement *element in elements) {
        QYBook *book = [[QYBook alloc] init];
        //        根据属性的名字，解析出标签对应的属性值。
//        得到book标签的属性
        book.category = [[element attributeForName:kAttributesNameBook] stringValue];
        
//        得到book标签下的title标签以及子标签，因为xml文档里看到， title没有子标签，所以只获取数据唯一的这个值就可以
        GDataXMLElement *titleElement = [element elementsForName:kElementNameTitle][0];
        // 根据标签的名字， 解析到标签对应的文本内容
        book.bookName = [titleElement stringValue];
//        根据标签解title的属性值
        book.language = [[titleElement attributeForName:kAttributesTitle] stringValue];
        
        GDataXMLElement *authorElement = [element elementsForName:kElementNameAutor][0];
        book.author = [authorElement stringValue];
        
        GDataXMLElement *yearElement = [element elementsForName:kElementNameYear][0];
        book.year = [yearElement  stringValue];
        
        GDataXMLElement *priceElement = [element elementsForName:kElementNamePrice][0];
        book.price = [[priceElement stringValue] floatValue];
        
        [self.bookstore addObject:book];
        [book release],book = nil;
    }
    
    NSLog(@"%@",self.bookstore);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
