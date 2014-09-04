//
//  QYSegmentViewController.m
//  TodayDemo
//
//  Created by qingyun on 14-6-28.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYSegmentViewController.h"

@interface QYSegmentViewController ()
@property(nonatomic,retain) UILabel *label1;
@property(nonatomic,retain) UILabel *label2;
@property(nonatomic,retain) UILabel *label3;
@property(nonatomic,retain) UILabel *label4;
@property(nonatomic,retain) UILabel *label5;
@property(nonatomic,retain) UIImageView *image;
@property(nonatomic,retain) UISegmentedControl *segmented5;
@end

@implementation QYSegmentViewController

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
    self.title =@"Segments";
    self.view.backgroundColor =[UIColor grayColor];
    //创建label
    _label1 =[[UILabel alloc]initWithFrame:CGRectMake(10, 80, 260, 30)];
    _label1.textColor =[UIColor blackColor];
    _label1.text =@"UISegmentedControl:";
    
    [self.view addSubview:_label1];
    
    //创建segmented
    
    [self creatSegmented];
    
   //创建label2
    _label2 =[[UILabel alloc]initWithFrame:CGRectMake(10, 160, 300, 30)];
    _label2.textColor =[UIColor blackColor];
    _label2.text =@"UISegmentedControlStyleBorder:";
    
    [self.view addSubview:_label2];
    
    //创建segments2
    
    [self creatSegmented2];
    
    //创建label3
    _label3 =[[UILabel alloc]initWithFrame:CGRectMake(10, 230, 300, 30)];
    
    _label3.text =@"UISegmentControlStyleBar:";
    _label3.textColor =[UIColor blackColor];
   // _label3.textAlignment =NSTextAlignmentCenter;
    
    [self.view addSubview:_label3];
    
    //创建segmented3
    
    [self creatSegmented3];
   
    //创建label4
    _label4 =[[UILabel alloc]initWithFrame:CGRectMake(10, 300, 300, 30)];
    _label4.text=@"UISegmentControlStyleBar:Tint";
    _label4.textColor =[UIColor blackColor];
    
    [self.view addSubview:_label4];
    
    //创建segmented4
    [self creatSegmented4];
    //创建label5
    _label5 =[[UILabel alloc]initWithFrame:CGRectMake(10, 370, 300, 30)];
    _label5.text=@"UISegmentControlStyleBar:Image";
    _label5.tintColor =[UIColor redColor];
    
    [self.view addSubview:_label5];

    //创建segmented5
    
    [self creatSegmented5];
}

-(void)creatSegmented
{
    UIImage *imageVC1 =[UIImage imageNamed:@"segment_check"];
    UIImage *imageVC2 =[UIImage imageNamed:@"segment_search"];
    UIImage *imageVC3 =[UIImage imageNamed:@"segment_tools"];
    NSArray *items =@[imageVC1,imageVC2,imageVC3];
    
    
    UISegmentedControl  *segmented =[[UISegmentedControl alloc]initWithItems:items];
    segmented.frame =CGRectMake(10, 120, 300, 40);
    segmented.selectedSegmentIndex =1;
    
    [self.view addSubview:segmented];
    [segmented release];
    
}
-(void)creatSegmented2
{
    NSArray *items2 =@[@"Check",@"Search",@"Tools"];
    UISegmentedControl *segmented2 =[[UISegmentedControl alloc]initWithItems:items2];
    segmented2.frame =CGRectMake(10, 190, 300, 40);
    segmented2.selectedSegmentIndex =1;
    // segmented2.segmentedControlStyle =UISegmentedControlStyleBordered;
    
    [self.view addSubview:segmented2];
    [segmented2 release];
    
}
-(void)creatSegmented3
{
    NSArray *items3 =@[@"Check",@"Search",@"Tools"];
    UISegmentedControl *segmented3 =[[UISegmentedControl alloc]initWithItems:items3];
    segmented3.frame =CGRectMake(10, 260, 300, 40) ;
    
    //segmented3.segmentedControlStyle =UISegmentedControlStyleBar;
    segmented3.selectedSegmentIndex=1;
    
    [self.view addSubview:segmented3];
    [segmented3 release];
    
}
-(void)creatSegmented4
{
    NSArray *items3 =@[@"Check",@"Search",@"Tools"];
    UISegmentedControl *segmented4 =[[UISegmentedControl alloc]initWithItems:items3];
    segmented4.frame =CGRectMake(10, 330, 300, 40) ;
    segmented4.selectedSegmentIndex=1;
    segmented4.tintColor =[UIColor redColor];
    [self.view addSubview:segmented4];
    [segmented4 release];
    
}
-(void)creatSegmented5
{
     NSArray *items3 =@[@"Check",@"Search",@"Tools"];
    UISegmentedControl *segmented5=[[UISegmentedControl alloc]initWithItems:items3];
    segmented5.frame =CGRectMake(10, 400, 300, 40);
    [segmented5 setBackgroundImage:[UIImage imageNamed:@"searchBarBackground"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    [segmented5 addTarget:self action:nil forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:segmented5];

    
}

-(void)dealloc
{
    [_label3 release];
    [_label1 release];
    [_label2 release];
    [_label4 release];
    [_label5 release];
    [_image release];
    [_segmented5 release];
    [super dealloc];
}
@end
