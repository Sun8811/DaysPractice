//
//  QYViewController.m
//  SaxXmlParser
//
//  Created by QingYun on 14-7-14.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"
#import "QYBook.h"

//static 目的是， 如果这个源文件是用于解析xml的， 那么对于这些常量来说， 不希望被其它的源文件所以看。 也就是说他的作用域仅限于当前文件
//const 本身表示的是常量，此处目的：1 在代码防止对这些变量的值进行修改， 2､阅读代的时候知道这些是就是常量。
//常量与宏的区是：宏没有类型检查， 所以尽量的使用const来表示常量
static  NSString * const kElementNameBook = @"book";
static  NSString * const kElementNameTitle = @"title";
static  NSString * const kElementNameAutor = @"author";
static  NSString * const kElementNameYear = @"year";
static  NSString * const kElementNamePrice = @"price";
static  NSString * const kAttributesNameBook = @"category";
static  NSString * const kAttributesTitle = @"lang";


@interface QYViewController () <NSXMLParserDelegate,UITableViewDataSource,UITableViewDelegate >

@property (nonatomic, retain) NSMutableArray *bookStore;

//目的是为把xml的内容解析成一个个对象， 这个对象类型是QYBook类型
@property (nonatomic, retain) QYBook *currentBook;
@property (nonatomic, retain) NSString *currentValue;
@property (retain, nonatomic) IBOutlet UITableView *tableView;
@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSURL *xmlFileUrl = [[NSBundle mainBundle] URLForResource:@"bookstore" withExtension:@"xml"];
//    根据xml的url 创建xml解析对象
    NSXMLParser *xmlParser = [[NSXMLParser alloc] initWithContentsOfURL:xmlFileUrl];
//  由于是事件驱动解析，也就是SAX方式解析，所以需要设置代理
    xmlParser.delegate = self;
    [xmlParser parse];
}


#pragma  mark -
#pragma  mark - NSXmlParserDelegate
//当开始解析xml文档的时候， 会首先调用此方法
- (void)parserDidStartDocument:(NSXMLParser *)parser
{
//    初始化bookStore，注意是懒加载
    self.bookStore = [[NSMutableArray alloc] initWithCapacity:3];
    NSLog(@"%s",__func__);
}

//当解析器，遇到xml元素的时候， 调用此方法
//第一参数：表示我们创建的xml解析器
//第二参数：遇到的元素值
//第三参数：遇到的到元的命名空间，主要作用是区在同一文档中， 同名的标签
//第四参数：根命名空间配合使用参数
//第五参数：遇到的元素，如果有属性的话，是属性的名字和值
- (void)parser:(NSXMLParser *)parser didStartElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName attributes:(NSDictionary *)attributeDict
{    
    NSLog(@"%s",__func__);
    NSLog(@"start elementName:%@",elementName);
    NSLog(@"attributes:%@",attributeDict);
    if ([elementName isEqualToString:kElementNameBook]) {
        self.currentBook = [[QYBook alloc] init];
        self.currentBook.category = [attributeDict objectForKey:kAttributesNameBook];
    }else if ([elementName isEqualToString:kElementNameTitle])
    {
        self.currentBook.language = [attributeDict objectForKey:kAttributesTitle];
    }
}

//当解析器，遇到元素值的时候， 调用此方法
- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string
{
    NSLog(@"%s",__func__);
    NSLog(@"elements value is %@",string);
    self.currentValue = string;
}

- (void)parser:(NSXMLParser *)parser didEndElement:(NSString *)elementName namespaceURI:(NSString *)namespaceURI qualifiedName:(NSString *)qName
{
    NSLog(@"%@",NSStringFromSelector(@selector(parser:didEndElement:namespaceURI:qualifiedName:)));
    NSLog(@"start elementName:%@",elementName);
    if ([elementName isEqualToString:kElementNameAutor]) {
        self.currentBook.author = self.currentValue;
    }else if ([elementName isEqualToString:kElementNamePrice])
    {
        self.currentBook.price = [self.currentValue floatValue];
    }else if ([elementName isEqualToString:@"book"])
    {
        [self.bookStore addObject:self.currentBook];
        [self.currentBook release],self.currentBook = nil;
    }else if ([elementName isEqualToString:kElementNameAutor])
    {
        self.currentBook.author = self.currentValue;
    }else if ([elementName isEqualToString:kElementNameYear])
    {
        self.currentBook.year = self.currentValue;
    }else if ([elementName isEqualToString:kElementNameTitle])
    {
        self.currentBook.bookName = self.currentValue;
    }
}

//当解析器， 在解析xml文档出现错误的时候， 会调用这个方法，当此方法调用后， 解析直接结束
- (void)parser:(NSXMLParser *)parser parseErrorOccurred:(NSError *)parseError
{
    NSLog(@"%s",__func__);
    NSLog(@"%@",parseError);
}
//当解析完成， 并且xml文档解析成功的时候， 会调用此方法
- (void)parserDidEndDocument:(NSXMLParser *)parser
{
    NSLog(@"%s",__func__);
    NSLog(@"bookstore's info if %@",self.bookStore);
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UITableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.bookStore.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (nil == cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIndentifier];
    }
    QYBook *book = self.bookStore[indexPath.row];
    cell.textLabel.text = book.bookName;
    cell.detailTextLabel.text = book.author;
    return cell;
}
- (void)dealloc
{
    [_bookStore release],_bookStore = nil;
    [_currentBook release],_currentBook = nil;
    [_currentValue release],_currentValue = nil;
    [_tableView release];
    [super dealloc];
}

@end
