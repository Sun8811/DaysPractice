//
//  ViewController.m
//  SQLiteSample
//
//  Created by qingyun on 14-8-7.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//


//引入第三方库
//包含头文件
//打开数据库
//使用对应的API接口，操作数据库 //对数据库的数据进行操作， 增、删、改、查
#import "ViewController.h"
#import <sqlite3.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
//    声明一个指针， 这个指针表示数据库句柄，这个句柄实际上将来就代表打开的数据库，可以理解这个指就是用于在程序中标识数据库
    sqlite3 *qingyunDb = NULL;//nil Nil NULL [NSNull null]
    NSString *dbFileName = [[NSBundle mainBundle] pathForResource:@"qingyun" ofType:@"sqlite"];
    NSLog(@"fileDbName is %@",dbFileName);
//    打开一个新的数据库连接，第一个参数表示数据库文件的绝对路径名字，第二个参数是数据库句柄的地址
    int result = sqlite3_open([dbFileName UTF8String], &qingyunDb);
    if (result != SQLITE_OK)
    {
        NSLog(@"Open db %@ failure.",dbFileName);
        return;
    }
    /*
//    定义一条插入数据的sql语句 dml
    NSString *strSql = @"INSERT INTO COMPANY VALUES (1,'HAIYUAN',25,'LUOYANG',50000.0,'M','1992-03-04')";
//    执行sql语句
    char *error = NULL;
    result = sqlite3_exec(qingyunDb, [strSql UTF8String], NULL, NULL, &error);
    if (result != SQLITE_OK) {
        NSLog(@"insert into table failure:%@,%s",strSql,error);
        return;
    }
     */
    
    
     //    定义一条插入数据的sql语句 dml
     NSString *strSql = @"INSERT INTO COMPANY VALUES (1,'HAIYUAN',25,?,50000.0,'M','1992-03-04')";
    sqlite3_stmt *stmt = NULL;
    sqlite3_prepare_v2(qingyunDb, [strSql UTF8String], -1, &stmt, NULL);
    sqlite3_bind_text(stmt, 1, "BEIJING", -1, NULL);
    result = sqlite3_step(stmt);
     //    执行sql语句
//     char *error = NULL;
//     result = sqlite3_exec(qingyunDb, [strSql UTF8String], NULL, NULL, &error);
//     if (result != SQLITE_OK) {
//     NSLog(@"insert into table failure:%@,%s",strSql,error);
//     return;
//     }
    
    
//    如何删除一条数据
//    定义删除数据的sql语句
//    NSString *delSql = @"DELETE FROM COMPANY WHERE ID = 1";
//    char *error = NULL;
//    // 在打开的数据库上执行这条sql语句
//    result = sqlite3_exec(qingyunDb, [delSql UTF8String], NULL, NULL, &error);
//    if (result != SQLITE_OK) {
//        NSLog(@"Del data failure:%@,%s",delSql,error);
//        return;
//    }
    
//    需要注意的是， 数据库打开后， 如果不再使用，需要关闭数据，防止数据库打开过， 导至不能再次打开数据库的问题
    sqlite3_close(qingyunDb);

    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
