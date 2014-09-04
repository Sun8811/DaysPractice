//
//  QYRootViewController.m
//  IndexTableViewDemo
//
//  Created by qingyun on 14-6-24.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "QYRootViewController.h"

@interface QYRootViewController ()
// 经过分析，我们要读取的plist文件是个NSDictionary,所以，我们通过字典来保存这些数据
@property (nonatomic, retain) NSMutableDictionary *names;
@property (nonatomic, retain) NSArray *allKeys;
@end

@implementation QYRootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {

    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 加载plist文件的内容
    [self loadDataFromFile];
    
    // 1. 创建UITableView
    _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    [_tableView release];
    
    // 2. rightBarButtonItem
    UIBarButtonItem *rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Edit" style:UIBarButtonItemStyleDone target:self action:@selector(editDemo:)];
    self.navigationItem.rightBarButtonItem = rightBarButtonItem;
    [rightBarButtonItem release];
}

- (void)loadDataFromFile
{
    // 根据当前应用的bundle取得plist文件在系统中的路径
    NSString *path = [[NSBundle mainBundle] pathForResource:@"sortednames" ofType:@"plist"];
    
    // 根据文件路径来初始化字典
    self.names = [NSMutableDictionary dictionaryWithContentsOfFile:path];
    //NSLog(@"plist file: %@", self.names);
    
    // 通过字典的allKeys方法来取得所有的键值
    self.allKeys = [self.names.allKeys sortedArrayUsingSelector:@selector(compare:)];
    NSLog(@"allKeys: %@", self.allKeys);
}

#pragma mark - tableView dataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.allKeys.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.names[self.allKeys[section]] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *identify = @"QYRootViewController";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identify];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
    }
    
    // 配置cell
    
        cell.textLabel.text = self.names[self.allKeys[indexPath.section]][indexPath.row];
    
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return self.allKeys[section];
}

//section右边  表示首字母的那个
- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return self.allKeys;
}
//根据字母进入到相应的section中

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString *)title atIndex:(NSInteger)index
{
    return index;
}
#if 1
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return NO;
    } else {
        return YES;
    }
}
#endif

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    static int counter;
//    NSLog(@"%s", __func__);
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // 删除数据
        [self.names[self.allKeys[indexPath.section]] removeObjectAtIndex:indexPath.row];
        
        // UI（界面）上移除
        [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationRight];
    } else {
        // 添加数据
        NSString *name = [NSString stringWithFormat:@"newName%d", counter++];
        [self.names[self.allKeys[indexPath.section]] insertObject:name atIndex:indexPath.row+1];
        
        // UI上添加
        NSIndexPath *newIndexPath = [NSIndexPath indexPathForRow:indexPath.row+1 inSection:indexPath.section];
        [_tableView insertRowsAtIndexPaths:@[newIndexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }
}

- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    // 把字典中对应section位置的名字数组取出来
    NSMutableArray *srcNameArray = self.names[self.allKeys[sourceIndexPath.section]];
    // 保存的改行数据
    NSString *name = [srcNameArray[sourceIndexPath.row] copy];
    
    // 在对应原section位置的名字数组里删除改行数据
    [srcNameArray removeObjectAtIndex:sourceIndexPath.row];
    
    // 在目的section位置的名字数组里添加改行数据
    NSMutableArray *dstNameArray = self.names[self.allKeys[destinationIndexPath.section]];
    [dstNameArray insertObject:name atIndex:destinationIndexPath.row];
    [name release];
}

#pragma mark - tableView delegate
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row % 3) {
        return UITableViewCellEditingStyleInsert;
    } else {
        return UITableViewCellEditingStyleDelete;
    }
}

#pragma mark - navigation controller actions
- (void)editDemo:(UIBarButtonItem *)sender
{
    if ([sender.title isEqualToString:@"Edit"]) {
        [_tableView setEditing:YES animated:YES];
        sender.title = @"Done";
    } else {
        [_tableView setEditing:NO animated:YES];
        sender.title = @"Edit";
    }

}

- (void)dealloc
{
    [_names release];
    [_allKeys release];
    [super dealloc];
}

@end
