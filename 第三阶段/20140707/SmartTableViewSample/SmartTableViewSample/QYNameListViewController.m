//
//  QYNameListViewController.m
//  SmartTableViewSample
//
//  Created by QingYun on 14-7-7.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYNameListViewController.h"
#import "QYAnotherListViewController.h"
#import "QYSmartTableViewCell.h"
@interface QYNameListViewController () <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, retain) NSArray *nameList;
@end

@implementation QYNameListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.nameList = @[@"Zhangsan",@"LiSi",@"WangERMazi"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITableView *tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    tableView.delegate = self;
    tableView.dataSource = self;
    [self.view addSubview:tableView];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark -
#pragma mark UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.nameList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYSmartTableViewCell *cell = [QYSmartTableViewCell cellForTableViewWithIdentifer:tableView withCellStyle:UITableViewCellStyleDefault];
    cell.textLabel.text = self.nameList[indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYAnotherListViewController *anotherViewCtrl = [[QYAnotherListViewController alloc] init];
    [self presentViewController:anotherViewCtrl animated:YES completion:nil];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
