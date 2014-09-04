//
//  QYToolBarViewController.m
//  TodayDemo
//
//  Created by qingyun on 14-6-29.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYToolBarViewController.h"

@interface QYToolBarViewController ()

@property(nonatomic,retain) UILabel *label1;
@property(nonatomic,retain) UILabel *label6;
@property(nonatomic,retain) UISwitch *switch1;
@property(nonatomic,retain) UISwitch *switch2;
@property(nonatomic,retain) UIPickerView *picker1;
@property(nonatomic,retain) NSArray *items;
@property(nonatomic,retain) UIToolbar *toolBar1;
@property(nonatomic,retain) UIImageView *image1;
@property(nonatomic,retain) UISegmentedControl *segmented1;
@property(nonatomic,retain) UIBarButtonItem *image;
@property(nonatomic,retain) UIBarButtonItem *leftButton;

@property(nonatomic,assign) UIBarButtonSystemItem currentItem;
@end

@implementation QYToolBarViewController

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
    self.title =@"ToolBar";
    self.currentItem =0;
    self.view.backgroundColor =[UIColor grayColor];
   
    //创建label
    _label1 =[[UILabel alloc]initWithFrame:CGRectMake(10, 80, 260, 30)];
    _label1.textColor =[UIColor blackColor];
    _label1.text =@"UIBarStyle:";
    
    [self.view addSubview:_label1];
   
    //创建segments
    
    [self creatSegmented];
    
    
    //创建Label2
    UILabel *label2 =[[UILabel alloc]initWithFrame:CGRectMake(30, 160, 50, 30)];
    label2.text = @"Image:";
    label2.font =[UIFont systemFontOfSize:12];
    [self.view addSubview:label2];

    //创建switch1
    
    [self creatSwitch1];
    
    //创建Label3
    
    UILabel *label3 =[[UILabel alloc]initWithFrame:CGRectMake(130, 160, 50, 30)];
    label3.text = @"Tinted:";
    label3.font =[UIFont systemFontOfSize:12];
    [self.view addSubview:label3];
   
    //创建switch2
    
    [self creatSwitch2];
    
    //创建label4
    UILabel *label4 =[[UILabel alloc]initWithFrame:CGRectMake(10, 200, 180, 30)];
    label4.text = @"UIBarButtonItemStyle:";
    label4.font =[UIFont systemFontOfSize:12];
    [self.view addSubview:label4];
    
    //创建label5
    UILabel *label5 =[[UILabel alloc]initWithFrame:CGRectMake(20, 230, 200, 30)];
    label5.text = @"UIBarButtonSystemItem:";
    label5.font =[UIFont systemFontOfSize:12];
    [self.view addSubview:label5];
    
    //创建UIPicker

    [self creatPicker];
    
    //创建toolBar
    
    [self creatToolBar];

}
-(void)creatSegmented
{
    NSArray *items =@[@"Default",@"Black",@"Translucent"];
    _segmented1 =[[UISegmentedControl alloc]initWithItems:items];
    _segmented1.frame =CGRectMake(10, 120, 300, 40);
    _segmented1.selectedSegmentIndex =1;
    _segmented1.tintColor =[UIColor darkGrayColor];
    _segmented1.alpha =0.5;
    _segmented1.selectedSegmentIndex =0;
    // segmented2.segmentedControlStyle =UISegmentedControlStyleBordered;
    
    [self.view addSubview:_segmented1];
    [_segmented1 release];
    
    
}
-(void)creatPicker
{
 self.items=@[@"Done",@"Cancel",@"Edit",@"Save",@"Add",@"FlexibleSpace",@"FixedSpace",@"Compose",@"Reply",@"Action",@"Organize",@"Bookmarks",@"Search",@"Refresh",@"Stop",@"Camera",@"Trash",@"Play",@"Pause",@"Rewind",@"TastForward",@"Undo",@"Redo",@"PageCurl"];
    _picker1 =[[UIPickerView alloc]initWithFrame:CGRectMake(0, 240, 320, 30)];
    //属性设置
    _picker1.delegate =self;
    _picker1.dataSource =self;
    
    [self.view addSubview:_picker1];
}
-(void)creatSwitch1
{
    _switch1 =[[UISwitch alloc]initWithFrame:CGRectMake(80, 160, 30, 40)];
    _switch1.tag =101;
    [_switch1 addTarget:self action:@selector(switch1Action) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_switch1];
    
}
-(void)creatSwitch2
{
    _switch2 =[[UISwitch alloc]initWithFrame:CGRectMake(180, 160, 30, 40)];
    _switch2.tag =102;
    [_switch2 addTarget:self action:@selector(switch2Action) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_switch2];
    
}
-(void)creatToolBar
{
     _toolBar1 =[[UIToolbar alloc]initWithFrame:CGRectMake(0, 480-44, 320, 44)];
    
    UIImage *bgimge =[[UIImage imageNamed:@"whiteButton"]resizableImageWithCapInsets:UIEdgeInsetsMake(8, 8, 8, 8) resizingMode:UIImageResizingModeStretch];
    UIBarButtonItem *button1 =[[UIBarButtonItem alloc]initWithTitle:@"Item1" style:UIBarButtonItemStyleBordered target:self action:nil];
    [button1 setBackgroundImage:bgimge forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    button1.tintColor =[UIColor grayColor];
    _image =[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"segment_tools"] style:UIBarButtonItemStyleDone target:self action:nil];
    UIBarButtonItem *button2 =[[UIBarButtonItem alloc]initWithTitle:@"Item2" style:UIBarButtonItemStyleDone target:self action:nil];
    UIBarButtonItem *fixibleItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    fixibleItem.width =100;
    _leftButton =[[UIBarButtonItem  alloc]initWithBarButtonSystemItem:self.currentItem target:self action:nil];

    UIBarButtonItem *flexibleItem =[[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:self action:nil];
    
    NSArray *array =@[_leftButton,fixibleItem,button1,button2,flexibleItem,_image];
    _toolBar1.items =array;
    
    NSLog(@"%s",__func__);
    if (_switch2.on) {
        _toolBar1.tintColor =[UIColor redColor];
    }
    [self.view addSubview:_toolBar1];
    
    
}

//==============事件处理============================
-(void)switch1Action
{
   
    if (_switch1.on) {
         _switch2.enabled =NO;
        [_toolBar1 setBackgroundImage:[UIImage imageNamed:@"searchBarBackground"] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        _segmented1.enabled =NO;
        _segmented1.alpha =0.2;

    } else{
        _switch2.enabled =YES;
        [_toolBar1 setBackgroundImage:nil forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        _segmented1.enabled =YES;
        _segmented1.alpha =0.3;
    }
    
  }

-(void)switch2Action
{
    NSLog(@"%s",__func__);
    if (_switch2.on) {
        _switch1.enabled =NO;
        _segmented1.enabled =NO;
        _segmented1.alpha =0.2;
        _toolBar1.tintColor =[UIColor redColor];
        
        
    } else{
        _switch1.enabled =YES;
        _segmented1.enabled =YES;
        _segmented1.alpha =0.3;
        _toolBar1.tintColor =nil;
    }
    
}
//==============dataSource里的实现方法===================

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.items.count;
}


//==============delegate 里的实现方法====================
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    _currentItem =row;
    [self creatToolBar];

}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    
    NSString *retStr =nil;
    if (pickerView == _picker1) {
        retStr =_items[row];
    }
    return retStr;
}

-(void)dealloc
{
    [_label1 release];
    [_label6 release];
    [_switch1 release];
    [_switch2 release];
    [_image release];
    [_image1 release];
    [_picker1 release];
    [_segmented1 release];
    [_leftButton release];
    [_toolBar1 release];
    [super dealloc];
}



@end
