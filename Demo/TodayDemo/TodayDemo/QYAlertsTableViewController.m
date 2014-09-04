//
//  QYAlertsTableViewController.m
//  TodayDemo
//
//  Created by qingyun on 14-6-29.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYAlertsTableViewController.h"

static NSString *kSectionTitleKey = @"sectionTitle";
static NSString *kLabelKey = @"label";
static NSString *kSourceKey = @"source";

static NSString *kViewCellID = @"viewCellID";
static NSString *kSourceCellID = @"sourceCellID";


@interface QYAlertsTableViewController ()
@property(nonatomic,retain) NSArray *items;
@end

@implementation QYAlertsTableViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:UITableViewStyleGrouped];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title =@"Alerts";
    //初始化数据
    self.items =@[@{ kSectionTitleKey :@"UIActionSheet",
                 kLabelKey :@"Show Simple",
                 kSourceKey :@"AlertsViewController.m -dialogSimpleAction"
                  },
              @{
                  kSectionTitleKey :@"UIActionSheet",
                  kLabelKey :@"Show OK -Cancel",
                  kSourceKey :@"AlertsViewController.m -dialogSimpleAction"
                  
                  },
              @{
                  kSectionTitleKey :@"UIActionSheet",
                  kLabelKey :@"Show Customized",
                  kSourceKey :@"AlertsViewController.m -dialogSimpleAction"
                  
                  },
              @{
                  kSectionTitleKey :@"UIALertView",
                  kLabelKey :@"Show Simple",
                  kSourceKey :@"AlertsViewController.m -dialogSimpleAction"
                  
                  },
              @{
                      kSectionTitleKey :@"UIALertView",
                      kLabelKey :@"Show OK-Cancle",
                      kSourceKey :@"AlertsViewController.m -dialogSimpleAction"
                      
                },
                  @{
                      kSectionTitleKey :@"UIALertView",
                      kLabelKey :@"Show Custom",
                      kSourceKey :@"AlertsViewController.m -dialogSimpleAction"
                      
                      },
                  @{
                      kSectionTitleKey :@"UIALertView",
                      kLabelKey :@"Secure Text Input",
                      kSourceKey :@"AlertsViewController.m -dialogSimpleAction"
                      
                      },
              ];
    //注册cell
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kViewCellID];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSourceCellID];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{


    return self.items.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{


    return 2;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.items[section] objectForKey:kSectionTitleKey];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    NSDictionary *dict =self.items[indexPath.section];
    if (indexPath.row ==0) {
        cell= [tableView dequeueReusableCellWithIdentifier:kViewCellID forIndexPath:indexPath];
         // Configure the cell...
         cell.textLabel.text =[dict objectForKey:kLabelKey];
        
        
    }else{
        cell= [tableView dequeueReusableCellWithIdentifier:kSourceCellID forIndexPath:indexPath];
         // Configure the cell...
        cell.textLabel.text =[dict objectForKey:kSourceKey];
        cell.textLabel.textAlignment =NSTextAlignmentCenter;
        cell.textLabel.font =[UIFont systemFontOfSize:12];
        cell.userInteractionEnabled =NO;
        
    }
    
    
   
    
    return cell;
}
//=======delegate方法==========
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (indexPath.row ==0) ? 50 :38;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
   // NSDictionary *dict =self.items[indexPath.section];
    switch (indexPath.section ) {
        case 0:
                {
            
                    UIActionSheet *ActionSheet =[[UIActionSheet alloc]initWithTitle:@"UIActionSheet<title>" delegate:self cancelButtonTitle:@"OK" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
                    [ActionSheet showInView:self.view];
                    [ActionSheet release];
                }
            break;
        case 1:
        {
            
            UIActionSheet *ActionSheet =[[UIActionSheet alloc]initWithTitle:@"UIActionSheet<title>" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [ActionSheet showInView:self.view];
            [ActionSheet release];
        }
            break;
        case 2:
        {
            
            UIActionSheet *ActionSheet =[[UIActionSheet alloc]initWithTitle:@"UIActionSheet<title>" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"Button1" otherButtonTitles:@"Button2", nil];
           
            [ActionSheet showInView:self.view];
            [ActionSheet release];
        }
            break;
        case 3:
        {
            
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"UIAlertView" message:@"<Alert message>" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [alertView show];
            [alertView release];
            
        }
            break;
        case 4:
        {
            
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"UIAlertView" message:@"<Alert message>" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"OK", nil];
            [alertView show];
            [alertView release];
            
        }
            break;
        case 5:
        {
            
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"UIAlertView" message:@"<Alert message>" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"Button1", @"Button2", nil];
            [alertView show];
            [alertView release];
            
        }
            break;
        case 6:
        {
            
            UIAlertView *alertView=[[UIAlertView alloc]initWithTitle:@"UIAlertView" message:@"<Alert message>" delegate:self cancelButtonTitle:@"Cancle" otherButtonTitles:@"OK", nil];
            alertView.alertViewStyle =UIAlertViewStyleSecureTextInput;
            [alertView show];
            [alertView release];
            
        }
            break;

        default:
            break;
    }
    
}
-(void)dealloc
{
    [_items release];
    [super dealloc];
}

@end
