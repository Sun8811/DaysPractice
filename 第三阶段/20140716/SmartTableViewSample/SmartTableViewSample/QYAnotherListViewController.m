//
//  QYAnotherListViewController.m
//  SmartTableViewSample
//
//  Created by QingYun on 14-7-7.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYAnotherListViewController.h"
#import "QYSmartTableViewCell.h"

@interface QYAnotherListViewController () <UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, retain) NSArray *anotherList;
@end

@implementation QYAnotherListViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.anotherList = @[@"ZhanFa",@"HaiYuan",@"DeLong"];
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

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return  self.anotherList.count;
}

- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    QYSmartTableViewCell *cell = [QYSmartTableViewCell cellForTableViewWithIdentifer:tableView withCellStyle:UITableViewCellStyleDefault];
    cell.textLabel.text = self.anotherList[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self dismissViewControllerAnimated:YES completion:nil];
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
