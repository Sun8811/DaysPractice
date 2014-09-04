//
//  QYMainViewController.m
//  UICatalogDemo
//
//  Created by qingyun on 14-6-25.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "QYMainViewController.h"

#pragma mark - constant values
static NSString *kCellIdentify = @"QYMainViewController";
static NSString *kTitleKey = @"title";
static NSString *kSubTitleKey = @"subTitle";
static NSString *kViewControllerKey = @"viewController";


// QYTableViewCell的接口
@interface QYTableViewCell : UITableViewCell
@end

// QYTableViewCell的实现
@implementation QYTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    return [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentify];
}

@end

#pragma mark -

@interface QYMainViewController ()
@property (nonatomic, retain) NSMutableArray *menulist;
@end

@implementation QYMainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.title = @"UICatalog";
    
    self.clearsSelectionOnViewWillAppear = YES;

    // 初始化数据
    self.menulist = [NSMutableArray array];
    // Buttons
    [self.menulist addObject:@{ kTitleKey:@"Buttons",
                                kSubTitleKey:@"Various uses of UIButton",
                                kViewControllerKey:@"QYButtonsViewController"
                               }];
    // Controls
    [self.menulist addObject:@{ kTitleKey:@"Controls",
                                kSubTitleKey:@"Various uses of UIControl",
                                kViewControllerKey:@"QYControlsViewController"
                                }];
    // TextField
    [self.menulist addObject:@{ kTitleKey:@"TextFields",
                                kSubTitleKey:@"Various uses of UITextField",
                                kViewControllerKey:@"QYTextFieldViewController"
                                }];
    
    // SearchBar
    [self.menulist addObject:@{ kTitleKey:@"SearchBar",
                                kSubTitleKey:@"Various uses of UISearchBar",
                                kViewControllerKey:@"QYSearchBarViewController"
                                }];
    
    // TextView
    [self.menulist addObject:@{ kTitleKey:@"TextView",
                                kSubTitleKey:@"Use of UITextView",
                                kViewControllerKey:@"QYTextViewController"
                                }];
    
    

    
    // 创建返回按钮,并设置导航栏的tintcolor
    UIBarButtonItem *backBarButtonItem = [[UIBarButtonItem alloc] init];
    backBarButtonItem.title = @"Back";
    self.navigationItem.backBarButtonItem = backBarButtonItem;
    [backBarButtonItem release];
    
    [self.navigationController.navigationBar setTintColor:[UIColor darkGrayColor]];
    
    // 注册Cell标示符
    [self.tableView registerClass:[QYTableViewCell class] forCellReuseIdentifier:kCellIdentify];
}

#pragma mark - Table view data source
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menulist.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentify forIndexPath:indexPath];
    
    // Configure the cell...
    NSDictionary *dict = self.menulist[indexPath.row];
    cell.textLabel.text = [dict objectForKey:kTitleKey];
    cell.detailTextLabel.text = [dict objectForKey:kSubTitleKey];
    
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}

#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *viewController;
    NSString *vcName = [self.menulist[indexPath.row] objectForKey:kViewControllerKey];
    if (vcName) {
        viewController = [[NSClassFromString(vcName) alloc] init];
    }
    
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release];
}

- (void)dealloc
{
    [_menulist release];
    [super dealloc];
}

@end
