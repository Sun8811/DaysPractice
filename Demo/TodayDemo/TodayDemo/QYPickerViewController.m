//
//  QYPickerViewController.m
//  TodayDemo
//
//  Created by qingyun on 14-6-27.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYPickerViewController.h"
#import "customPickerSource.h"
@interface QYPickerViewController ()
@property(nonatomic,retain) NSArray *pickerViewArray;
@property(nonatomic,retain) UIPickerView *pickerView;
@property(nonatomic,retain) UILabel *pickerLabel;
@property(nonatomic,retain) UISegmentedControl *segmentedCtl;

@property(nonatomic,retain) UIDatePicker *datePicker;
@property(nonatomic,retain) UILabel *datePickerLabel;
@property(nonatomic,retain) UISegmentedControl *datePickerSegmented;

@property(nonatomic,retain) UIPickerView *customePicker;
@property(nonatomic,strong) customPickerSource *customPickerDataSource;

@end

@implementation QYPickerViewController

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
    //1.设标题和背景色
    self.title =@"Pickers";
    self.view.backgroundColor =[UIColor lightGrayColor];
    //1.1创建数组并初始化
    self.pickerViewArray =@[@"John Appleseed",@"Chris Armstrong",@"Serena Auroux",@"Susan Bean",@"Luis Becerra",@"Kate Bell",@"Alain Briere"];
    //2.创建pickerView
    
    [self createAndSetPicker];
    
    //3.创建toolBar 和segmentedController
    
    [self createToolBarAndSegmentControl];
    
    //4.创建datePicker
    
    [self createAndSetDatePicker];
   
    //4.1创建segmentedControl
    [self creatSegmentControl];
    //5 创建customePicker
  //  [self creatCustomePicker];

   }
//制定component的制定row的属性标题
//属性标题的优先级比较高，若果设置了属性标题，回复该正常的标题
-(void)creatCustomePicker
{
    self.customPickerDataSource =[[customPickerSource alloc]init];
    self.customePicker =[[UIPickerView alloc]initWithFrame:CGRectZero];

    //[self.view addSubview:self.customePicker];
    
    self.customePicker.delegate =self.customPickerDataSource;
    self.customePicker.dataSource =self.customPickerDataSource;
    
   // self.customePicker.showsSelectionIndicator = YES;
    self.pickerView.hidden = YES;
    self.pickerLabel.hidden =YES;
    //self.customePicker.hidden=YES;

    [self.view addSubview:self.customePicker];
    
}
-(void)createAndSetPicker
{
    _pickerView =[[UIPickerView alloc]initWithFrame:CGRectMake(0, 70, 0, 0)];
    
    //1属性设置
    _pickerView.delegate =self;
    _pickerView.dataSource =self;
    
    //2添加到self.view
    [self.view addSubview:_pickerView];
    //3创建pickerView 里面的label
    _pickerLabel =[[UILabel alloc]initWithFrame:CGRectMake(70, 300, 200, 30)];
    _pickerLabel.textColor =[UIColor blackColor];
    _pickerLabel.textAlignment =NSTextAlignmentCenter;
    _pickerLabel.font =[UIFont systemFontOfSize:12];
  //  _pickerLabel.text= @"John Appleseed - 0";
    
    [self.view addSubview:_pickerLabel];
  
    
}
-(void)createToolBarAndSegmentControl
{
    UIToolbar *toolbar =[[UIToolbar alloc]initWithFrame:CGRectMake(0, 480-44, 320, 44)];
    
    NSArray *items =@[@"UIPicker",@"UIDatePicker",@"Custom"];
    _segmentedCtl =[[UISegmentedControl alloc]initWithItems:items];
    _segmentedCtl.frame =CGRectMake(10, 5, 300, 34) ;
    _segmentedCtl.tintColor =[UIColor grayColor];
    _segmentedCtl.backgroundColor =[UIColor lightGrayColor];
    [_segmentedCtl addTarget:self action:@selector(segmentedSelectedAction:) forControlEvents:UIControlEventValueChanged];
    [toolbar addSubview:_segmentedCtl];
    
    [self.view addSubview:toolbar];
    [toolbar release];

    
}
-(void)createAndSetDatePicker
{
    _datePicker =[[UIDatePicker alloc]initWithFrame:CGRectMake(0, 70, 320, 0)];
    //属性设置
    _datePicker.datePickerMode =UIDatePickerModeTime;
    //添加到self.view
    [self.view addSubview:_datePicker];
    _datePicker.hidden =YES;
    
    //创建datePickerLable
    _datePickerLabel =[[UILabel alloc]initWithFrame:CGRectMake(60, 300, 200, 30)];
    _datePickerLabel.textColor =[UIColor darkGrayColor];
    _datePickerLabel.textAlignment =NSTextAlignmentCenter;
    _datePickerLabel.font =[UIFont systemFontOfSize:12];
    _datePickerLabel.text = @"DFSGSDFG";
    
    [self.view addSubview:_datePickerLabel];
    _datePickerLabel.hidden =YES;
    

    
}
-(void)creatSegmentControl
{
    NSArray *items2 =@[@"1",@"2",@"3",@"4"];
    _datePickerSegmented =[[UISegmentedControl alloc]initWithItems:items2];
    _datePickerSegmented.frame =CGRectMake(60, 330, 200, 30) ;
    //_datePickerSegmented.backgroundColor =[UIColor grayColor];
    _datePickerSegmented.tintColor =[UIColor blackColor];
    [_datePickerSegmented addTarget:self action:@selector(datePickerAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_datePickerSegmented];
    
    _datePickerSegmented.hidden =YES;

    
}
#pragma -mark  uipickerViewDelegate
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{
        if (component == 0) {
            return 240;
        }else{
            return 80;
        }

    
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSString *retStr =nil;
    if (pickerView ==_pickerView) {
        if (component ==0) {
            retStr =self.pickerViewArray[row];
        }else{
            retStr =[[NSNumber numberWithInt:row]stringValue];
        }
    }
    return retStr;
}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _pickerLabel.text =[NSString stringWithFormat:@"%@ - %d",[_pickerViewArray objectAtIndex:[_pickerView selectedRowInComponent:0]],[_pickerView selectedRowInComponent:1]
                        ];
}


- (NSAttributedString *)pickerView:(UIPickerView *)pickerView attributedTitleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    NSMutableAttributedString *attStr = nil;
    NSString *title = nil;
    if (row == 0) {
        if (component == 0) {
            title = self.pickerViewArray[row] ;
        } else {
            title = [[[NSNumber numberWithInt:row] stringValue] retain];
        }
        
        attStr = [[NSMutableAttributedString alloc] initWithString:title];
        [title release];
        [attStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, attStr.length)];
    }
    
    
    
    return attStr;
    //return [attStr autorelease];
}


#pragma -mark  uipickerViewDataSource
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.pickerViewArray.count;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
-(void)hideMiscViews
{
   // _pickerLabel.hidden =YES;
    _datePicker.hidden =YES;
    _datePickerLabel.hidden =YES;
    _datePickerSegmented.hidden=YES;
    
}
-(void)showPicker:(UIView *)picker
{
    _pickerLabel.hidden=NO;
    _pickerView.hidden =NO;
    self.customePicker.hidden =YES;

}
-(void)showDatePicker:(UIView *)datePicker
{
    _pickerView.hidden =YES;
    _datePicker.hidden =NO;
    
    _pickerLabel.hidden=YES;
    _datePickerLabel.hidden =NO;
    _datePickerSegmented.hidden =NO;
     self.customePicker.hidden =YES;
}
-(void)segmentedSelectedAction:(UISegmentedControl *)sender
{
    [self hideMiscViews];
    switch (sender.selectedSegmentIndex) {
        case 0:
            [self showPicker:_pickerView];
            break;
        case 1:
            NSLog(@"123");
            [self showDatePicker:_datePicker];
            break;
        case 2:
            NSLog(@"123");
             [self creatCustomePicker];
            
            break;
        default:
            break;
    }
    
}
//- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
//{
//    
//    UIView *retView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 216)];
//    UIImageView *image1 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"12-6AM"]];
//    image1.frame =CGRectMake(100, 60, 30, 30);
//    UILabel *label1 =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image1.frame)+20,60 , 30, 30)];
//    label1.text =@"Early Moring";
//    
//    
//    UIImageView *image2 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"6-12AM"]];
//    image2.frame =CGRectMake(100, 60, 30, 30);
//    UILabel *label2 =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image2.frame)+20,60 , 30, 30)];
//    label2.text =@"Late Moring";
//    
//    UIImageView *image3 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"12-6PM"]];
//    image3.frame =CGRectMake(100, 60, 30, 30);
//    UILabel *label3 =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image3.frame)+20,60 , 30, 30)];
//    label3.text =@"Afternoon";
//    
//    UIImageView *image4 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"6-12PM"]];
//    image4.frame =CGRectMake(100, 60, 30, 30);
//    UILabel *label4 =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image4.frame)+20,60 , 30, 30)];
//    label4.text =@"Evening";
//    NSArray *array1=@[image1,image2,image3,image4];
//    NSArray *array2 =@[label1,label2,label3,label4];
//    
//    if (pickerView ==_customePicker) {
//        // if (component ==0) {
//        NSLog(@"12321312");
//        [retView addSubview:array1[row]];
//        [retView addSubview:array2[row]];
//        
//        // }
//    }
//    return retView;
//    
//}

-(void)datePickerAction:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
            _datePicker.datePickerMode =UIDatePickerModeTime;
             _datePickerSegmented.backgroundColor =[UIColor grayColor];
            _datePickerLabel.text =@"UIDatePickerModeTime";
            break;
        case 1:
            _datePicker.datePickerMode =UIDatePickerModeDate;
             _datePickerLabel.text =@"UIDatePickerModeDate";
            break;
        case 2:
            _datePicker.datePickerMode =UIDatePickerModeDateAndTime;
             _datePickerLabel.text =@"UIDatePickerModeDateAndTimer";
            break;
        case 3:
            _datePicker.datePickerMode =UIDatePickerModeCountDownTimer;
           _datePickerLabel.text =@"UIDatePickerModeCountDownTimer";
            NSDate *now = [NSDate date];
            [_datePicker setDate:now animated:YES];
            break;
        default:
            break;
    }
    
}

-(void)dealloc
{
    [_segmentedCtl release];
    [_pickerViewArray release];
    [_pickerLabel release];
    [_pickerView release];
    [_datePicker release];
    [_datePickerLabel release];
    [_datePickerSegmented release];
    [super dealloc];
}

@end
