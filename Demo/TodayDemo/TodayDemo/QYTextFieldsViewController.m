//
//  QYTextFieldsViewController.m
//  TodayDemo
//
//  Created by qingyun on 14-6-26.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYTextFieldsViewController.h"

static NSString *kSectionTitleKey = @"sectionTitle";
static NSString *kViewKey = @"TextFields";
static NSString *kSourceKey = @"source";

static NSString *kViewCellID = @"viewCellID";
static NSString *kSourceCellID = @"sourceCellID";

#define kViewTag           101

@interface QYTextFieldsViewController ()
@property(nonatomic,retain) NSArray *dataArray;
@property(nonatomic,retain) UITextField *textFieldNormal;
@property(nonatomic,retain) UITextField *textFieldRounded;
@property(nonatomic,retain) UITextField *textFieldSecure;
@property(nonatomic,retain) UITextField *textFieldLeftView;
@end

@implementation QYTextFieldsViewController

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
    
   self.title =@"TextFields";
    //init data
    self.dataArray =@[@{
                          kSectionTitleKey: @"UITextField",
                          kViewKey :self.textFieldNormal,
                          kSourceKey:@"TextFieldController.m:textFieldNormal"
                       },
                      @{
                          kSectionTitleKey: @"UITextField Rounded",
                          kViewKey :self.textFieldRounded,
                          kSourceKey:@"TextFieldController.m:textFieldRounded"
                          },
                      @{
                          kSectionTitleKey: @"UITextField Secure",
                          kViewKey :self.textFieldSecure,
                          kSourceKey:@"TextFieldController.m:textFieldSecure"
                          },
                      @{
                          kSectionTitleKey: @"UITextField (LeftView)",
                          kViewKey :self.textFieldLeftView,
                          kSourceKey:@"TextFieldController.m:textFieldLeftView"
                          },

                      
                      ];
    
    
    //regist cell style
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kViewCellID];
    [self.tableView  registerClass:[UITableViewCell class] forCellReuseIdentifier:kSourceCellID];
    
}


#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.dataArray.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return 2;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.dataArray[section] objectForKey:kSectionTitleKey];;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dict =self.dataArray[indexPath.section];
    UITableViewCell *cell;
    if (indexPath.row ==0) {
       cell = [tableView dequeueReusableCellWithIdentifier:kViewCellID forIndexPath:indexPath];
        // Configure the cell...
        //delete precious cell's view
        UIView *view2Remove =[cell.contentView viewWithTag:kViewTag];
        if (view2Remove) {
            [view2Remove removeFromSuperview];
        }
        UIView *view =[dict objectForKey:kViewKey];
        CGRect newFrame =view.frame;
        newFrame.origin.x =CGRectGetWidth(cell.contentView.frame)-10-CGRectGetWidth(newFrame);
        view.frame =newFrame;
        
        [cell.contentView addSubview:view];

    }else{
     cell = [tableView dequeueReusableCellWithIdentifier:kSourceCellID forIndexPath:indexPath];
        // Configure the cell...
  
        cell.textLabel.text =[dict objectForKey:kSourceKey];
        cell.textLabel.textColor=[UIColor grayColor];
        cell.textLabel.textAlignment =NSTextAlignmentCenter;
       // cell.textLabel.numberOfLines =2;
        cell.textLabel.font =[UIFont systemFontOfSize:12];

    }
    cell.selectionStyle =UITableViewCellSelectionStyleNone;

    return cell;
}
//========delegate 里实现的方法=============
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (indexPath.row ==0) ? 50 :25;
}
//=========Lazy load==============
-(UITextField *)textFieldRounded
{
    if (_textFieldRounded ==nil) {
        _textFieldRounded =[[UITextField alloc]initWithFrame:CGRectMake(10, 10, 280, 30)];
        _textFieldRounded.tintColor =[UIColor darkGrayColor];
       // _textFieldRounded.backgroundColor =[UIColor orangeColor];
        _textFieldRounded.placeholder =@"<enter Text>";
        _textFieldRounded.borderStyle =UITextBorderStyleBezel;
        _textFieldRounded.clearButtonMode =UITextFieldViewModeWhileEditing;
        _textFieldRounded.returnKeyType =UIReturnKeyDone;
        _textFieldRounded.delegate =self;
    }
    return _textFieldRounded;
}


-(UITextField *)textFieldNormal
{
    if (_textFieldNormal ==nil) {
        _textFieldNormal =[[UITextField alloc]initWithFrame:CGRectMake(10, 10, 280, 30)];
        _textFieldNormal.tintColor =[UIColor darkGrayColor];
        //_textFieldNormal.backgroundColor =[UIColor orangeColor];
        _textFieldNormal.borderStyle =UITextBorderStyleBezel;
        _textFieldNormal.placeholder =@"<enter Text>";
        _textFieldNormal.returnKeyType=UIReturnKeyDone;
        _textFieldNormal.clearButtonMode =UITextFieldViewModeWhileEditing;
        _textFieldNormal.delegate =self;
        _textFieldNormal.tag =kViewTag;
           }
    return _textFieldNormal;
}
-(UITextField *)textFieldSecure
{
    if (_textFieldSecure ==nil) {
        _textFieldSecure =[[UITextField alloc]initWithFrame:CGRectMake(10, 10, 280, 30)];
        _textFieldSecure.tintColor =[UIColor darkGrayColor];
        //_textFieldNormal.backgroundColor =[UIColor orangeColor];
        _textFieldSecure.borderStyle =UITextBorderStyleBezel;
        _textFieldSecure.placeholder =@"<enter Password>";
        _textFieldSecure.returnKeyType=UIReturnKeyDone;
        _textFieldSecure.clearButtonMode =UITextFieldViewModeWhileEditing;
        _textFieldSecure.delegate =self;
        _textFieldSecure.tag =kViewTag;
        
        _textFieldSecure.secureTextEntry=YES;
    }
    return _textFieldSecure;
}
-(UITextField *)textFieldLeftView
{
    if (_textFieldLeftView ==nil) {
        _textFieldLeftView =[[UITextField alloc]initWithFrame:CGRectMake(10, 10, 280, 30)];
        _textFieldLeftView.tintColor =[UIColor darkGrayColor];
        //_textFieldNormal.backgroundColor =[UIColor orangeColor];
        _textFieldLeftView.borderStyle =UITextBorderStyleBezel;
        _textFieldLeftView.placeholder =@"<enter Text>";
        _textFieldLeftView.returnKeyType=UIReturnKeyDone;
        _textFieldLeftView.clearButtonMode =UITextFieldViewModeWhileEditing;
        _textFieldLeftView.delegate =self;
        _textFieldLeftView.tag =kViewTag;
        
        //====createUIIamgeView========
        UIImageView *image =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"segment_check"]];
        _textFieldLeftView.leftView =image;
        _textFieldLeftView.leftViewMode =UITextFieldViewModeAlways;
        
        [image release];
        
        
    }
    return _textFieldLeftView;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%s", __func__);
    [textField resignFirstResponder];
    return YES;
}
-(void)dealloc
{
    [_dataArray release];
    [_textFieldLeftView release];
    [_textFieldNormal release];
    [_textFieldRounded release];
    [_textFieldSecure release];
    [super dealloc];
    
}

@end
