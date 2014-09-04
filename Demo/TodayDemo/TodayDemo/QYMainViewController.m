//
//  QYMainViewController.m
//  TodayDemo
//
//  Created by qingyun on 14-6-25.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYMainViewController.h"
static NSString *kCellIdentify =@"QYMainViewController";
static NSString *kTitlekey =@"title";
static NSString *kSubTitleKey =@"subTitle";
static NSString *kViewControllerKey =@"viewController";
// QYTableViewCell的接口
@interface QYTableViewCell : UITableViewCell
@end

// QYTableViewCell的实现
@implementation QYTableViewCell

-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    return [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:kCellIdentify];
}
@end

@interface QYMainViewController ()
@property(nonatomic,retain) NSMutableArray *menulist;
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
    
    self.title =@"Catalog";
    self.clearsSelectionOnViewWillAppear = YES;
    self.menulist =[NSMutableArray array];
    //初始化数据
    [self.menulist addObject:@{
                              kTitlekey: @"Buttons",
                              kSubTitleKey:@"Various uses of Button",
                              kViewControllerKey:@"QYButtonsViewController"
                              }
     ];
    [self.menulist addObject:@{kTitlekey: @"Controls",
                               kSubTitleKey:@"Various uses of UiControl",
                               kViewControllerKey:@"QYControlsViewController"
                               }];
    [self.menulist addObject:@{
                               kTitlekey: @"TextFields ",
                               kSubTitleKey:@" Uses of UiTextField ",
                               kViewControllerKey:@"QYTextFieldsViewController"
                               }
     
     ];
    [self.menulist addObject:@{
                               kTitlekey: @"Search Bar",
                               kSubTitleKey:@"Uses of Search Bar",
                               kViewControllerKey:@"QYSearchBarViewController"
                               }
     ];
    [self.menulist addObject:@{
                               kTitlekey: @"TextView",
                               kSubTitleKey:@"Uses of UITextView",
                            kViewControllerKey:@"QYTextViewController"
                               }
     ];
    [self.menulist addObject:@{
                               kTitlekey: @"Image",
                               kSubTitleKey:@"Uses of UIImageview",
                               kViewControllerKey:@"QYImageViewController"
                               }
     ];
    [self.menulist addObject:@{
                               kTitlekey: @"Webs",
                               kSubTitleKey:@"Use of WebView",
                               kViewControllerKey:@"QYWEBViewController"
                               }
     ];
    [self.menulist addObject:@{
                               kTitlekey: @"Transitions",
                               kSubTitleKey:@"ShowsUIviewAnimationTransitions",
                               kViewControllerKey:@"QYTransitionViewController"
                               }
     ];
    [self.menulist addObject:@{
                               kTitlekey: @"Pickers",
                               kSubTitleKey:@"Uses of UIdatePicker,UIPickerView",
                               kViewControllerKey:@"QYPickerViewController"
                               }
     ];
    [self.menulist addObject:@{
                               kTitlekey: @"Segments",
                               kSubTitleKey:@"Various uses of UISegmentedContrl",
                               kViewControllerKey:@"QYSegmentViewController"
                               }
     ];
    [self.menulist addObject:@{
                               kTitlekey: @"ToorBar",
                               kSubTitleKey:@"Uses of UIToorbar",
                               kViewControllerKey:@"QYToolBarViewController"
                               }
     ];
    [self.menulist addObject:@{
                               kTitlekey: @"Alerts",
                               kSubTitleKey:@"Various uses of UiAlertView,UIActionSheet",
                               kViewControllerKey:@"QYAlertsTableViewController"
                               }
     ];
    
    //创建UIBarButtonItem
    UIBarButtonItem *backBarButtonItem =[[UIBarButtonItem alloc]init];
    [backBarButtonItem setTitle:@"Back"];
    
    self.navigationItem.backBarButtonItem =backBarButtonItem;
    [backBarButtonItem release];
    //设置navigationBar的填充色
    [self.navigationController.navigationBar setTintColor:[UIColor grayColor]];
    //注册cell风格
    [self.tableView registerClass:[QYTableViewCell class] forCellReuseIdentifier:kCellIdentify];
    
}



#pragma mark - Table view data source

//TableView里面的Section有多少行
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
     return self.menulist.count;
}
//显示每一行是什么样子
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
     UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kCellIdentify forIndexPath:indexPath];
    
    NSDictionary *dict= self.menulist[indexPath.row];
    
    //配置cell
    cell.textLabel.text =[dict objectForKey:kTitlekey];
    cell.detailTextLabel.text =[dict objectForKey:kSubTitleKey];
    cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    
    return cell;
}
#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
     NSString *vcName =[self.menulist[indexPath.row] objectForKey:kViewControllerKey];
    UIViewController *viewController;
    if (vcName) {
        viewController =[[NSClassFromString(vcName) alloc]init];
    }
    [self.navigationController pushViewController:viewController animated:YES];
    [viewController release ];

}
-(void)dealloc
{
    [_menulist release];
    [super dealloc];
}

@end
