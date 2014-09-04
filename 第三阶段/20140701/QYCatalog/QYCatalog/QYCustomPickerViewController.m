//
//  QYCustomPickerViewController.m
//  QYCatalog
//
//  Created by QingYun on 14-7-1.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYCustomPickerViewController.h"
#import "QYCustomDataSource.h"

@interface QYCustomPickerViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>

//私有成员变量
@property (nonatomic, retain) UIPickerView *customPickerView;
@property (nonatomic, retain) UIPickerView *anotherPickerView;
@property (nonatomic, retain) QYCustomDataSource *dataSource;
@end

@implementation QYCustomPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect frame = {0,0,320,216};
    self.customPickerView = [[UIPickerView alloc] initWithFrame:frame];
    self.customPickerView.dataSource = self;
    self.customPickerView.delegate = self;
    [self.view addSubview:self.customPickerView];
    
//    QYCustomDataSource *dataSource = [[QYCustomDataSource alloc] init];
    self.dataSource = [[QYCustomDataSource alloc] init];
    
    self.anotherPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(frame)+20, 320, 216)];
    self.anotherPickerView.dataSource = self.dataSource;
    self.anotherPickerView.delegate = self.dataSource;
    [self.view addSubview:self.anotherPickerView];
    
    
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark UIPickerViewDataSource


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

#pragma mark UIPickerViewDelegate
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return @"QingYun";
}
//- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component NS_AVAILABLE_IOS(6_0); // attributed title is favored if both methods are implemented

- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UIView *retView = [[UIView alloc] initWithFrame:CGRectMake(10, 5, 100, 30)];
    UILabel *label = [[UILabel alloc] initWithFrame:retView.bounds];
    label.text = @"Hello";
    label.font = [UIFont systemFontOfSize:12.0f];
    [retView addSubview:label];
    
    retView.backgroundColor = [UIColor orangeColor];
    return retView;
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
