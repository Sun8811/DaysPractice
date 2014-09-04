//
//  ViewController.m
//  SQLiteDQLSample
//
//  Created by qingyun on 14-8-7.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "ViewController.h"
#import <sqlite3.h>
#import "QYEmployee.h"

@interface ViewController ()

@property (nonatomic, retain) NSMutableArray *employee;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    _employee = [[NSMutableArray alloc] initWithCapacity:7];
	// 声明一个指针， 这个指针表示数据库句柄，这个句柄实际上将来就代表打开的数据库，可以理解这个指就是用于在程序中标识数据库
    sqlite3 *qingyunDb = NULL;//nil Nil NULL [NSNull null]
    NSString *dbFileName = [[NSBundle mainBundle] pathForResource:@"qingyuntest" ofType:@"sqlite"];
    NSLog(@"fileDbName is %@",dbFileName);
    //    打开一个新的数据库连接，第一个参数表示数据库文件的绝对路径名字，第二个参数是数据库句柄的地址
    int result = sqlite3_open([dbFileName UTF8String], &qingyunDb);
    if (result != SQLITE_OK)
    {
        NSLog(@"Open db %@ failure.",dbFileName);
        return;
    }
    //定义查询sql语句
//    硬编码
    NSString *selectSql = @"select * from company";
//    NSString *selectSql = @"select * from company where salary >= ? and age > ?";
    sqlite3_stmt *stmt = NULL;

    //对查询sql语句进行预编译
    sqlite3_prepare_v2(qingyunDb, [selectSql UTF8String], -1, &stmt, NULL);
    sqlite3_bind_double(stmt, 1, 20000.0);
    sqlite3_bind_int(stmt, 2, 25);
    
    
    //执行查询动作，并对结果进行处理,数据保存在stmt里，
    result = sqlite3_step(stmt);
//    当result ＝＝ sqlite_row表示，查询的结量还有下一条数据,取数据的是从0开始，绑定数据的时候， 从1天始
    while (result == SQLITE_ROW) {
        QYEmployee *em = [[QYEmployee alloc] init];
        em.eID = sqlite3_column_int(stmt, 0);
        em.name = [NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 1)];
        em.age = sqlite3_column_int(stmt, 2);
        em.address = [NSString stringWithFormat:@"%s",sqlite3_column_text(stmt, 3)];
        em.salary = sqlite3_column_double(stmt, 4);
        [self.employee addObject:em];
        result = sqlite3_step(stmt);
    }
//    查询后，需要对编译后的sql语句进行销毁动作
    sqlite3_finalize(stmt);
    sqlite3_close(qingyunDb);
    
    NSLog(@"%@",self.employee);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
