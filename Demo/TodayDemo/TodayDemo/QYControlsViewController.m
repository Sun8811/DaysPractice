//
//  QYControlsViewController.m
//  TodayDemo
//
//  Created by qingyun on 14-6-26.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYControlsViewController.h"
#define kStdButtonWidth    106
#define kStdButtonHeight   40
#define kViewTag           101

static NSString *kSectionTitleKey = @"sectionTitle";
static NSString *kLabelKey = @"label";
static NSString *kViewKey = @"button";
static NSString *kSourceKey = @"source";

static NSString *kViewCellID = @"viewCellID";
static NSString *kSourceCellID = @"sourceCellID";

@interface QYControlsViewController ()
@property(nonatomic,retain) NSArray *dataArray;
@property(nonatomic,retain) UISwitch *switchCtl;
@property(nonatomic,retain) UISlider *sliderCtl;
@property(nonatomic,retain) UISlider *customSlider;
@property(nonatomic,retain) UIPageControl *pageControl;
@property(nonatomic,retain) UIActivityIndicatorView *progressInd;
@property(nonatomic,retain) UIProgressView *progressBar;
@property(nonatomic,retain) UIStepper *stepper;
@end

@implementation QYControlsViewController

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
    self.title =@"Controls";
    UIBarButtonItem *rightBarButtonItem =[[UIBarButtonItem alloc]initWithTitle:@"Tinted" style:UIBarButtonItemStyleDone target:self action:@selector(tintedAction:)];
    self.navigationItem.rightBarButtonItem =rightBarButtonItem;
   
    [rightBarButtonItem release];
    
    //init data
    
    self.dataArray =@[@{
                          kSectionTitleKey:@"UISwitch",
                          kLabelKey :@"Standard Switch ",
                          kViewKey :self.switchCtl,
                          kSourceKey:@"QYControlsViewController.m:\n(UISwitch *)switchCtl"
                          },
                      @{
                          kSectionTitleKey:@"UISlider",
                          kLabelKey :@"Standard Slider ",
                          kViewKey :self.sliderCtl,
                          kSourceKey:@"QYControlsViewController.m:\n(sliderCtl *)sliderCtl"
                          },
                      @{
                          kSectionTitleKey:@"UISlider",
                          kLabelKey :@"Customized Slider ",
                          kViewKey :self.customSlider,
                          kSourceKey:@"QYControlsViewController.m:\n(customSlider *)customSlider"
                          },
                      @{
                          kSectionTitleKey:@"UIPageControl",
                          kLabelKey :@"Ten Pages ",
                          kViewKey :self.pageControl,
                          kSourceKey:@"QYControlsViewController.m:\n(UIPageControl *)pageControl"
                          },
                      @{
                          kSectionTitleKey:@"UIActivityIndicatorView",
                          kLabelKey :@"Style Gray ",
                          kViewKey :self.progressInd,
                          kSourceKey:@"QYControlsViewController.m:\n(UIActivityIndicatorView *)progressInd"
                          },
                      @{ kSectionTitleKey:@"UIProgressView",
                         kLabelKey:@"Style Default",
                         kViewKey:self.progressBar,
                         kSourceKey:@"QYControlsViewController.m:\n-(UIProgressView *)progressBar"
                         },
                      @{ kSectionTitleKey:@"UIStepper",
                         kLabelKey:@"Stepper 1 to 10",
                         kViewKey:self.stepper,
                         kSourceKey:@"QYControlsViewController.m:\n-(UIStepper *)stepper"
                         },




                      ];
    //注册cell标识
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kViewCellID];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSourceCellID];
    
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.dataArray[section] objectForKey:kSectionTitleKey];;
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


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    
    NSDictionary *dict =self.dataArray[indexPath.section];
    if (indexPath.row ==0) {
        cell = [tableView dequeueReusableCellWithIdentifier:kViewCellID forIndexPath:indexPath];
         // Configure the cell...
        //=======移除cell上之前的视图=========
        UIView *view2Remove =[cell.contentView viewWithTag:kViewTag];
        if (view2Remove) {
            [view2Remove removeFromSuperview];
        }
        //===========================
        cell.textLabel.text =[dict objectForKey:kLabelKey];
        UIView *view =[dict objectForKey:kViewKey];
        CGRect newFrame = view.frame;
        newFrame.origin.x =CGRectGetWidth(cell.contentView.frame)-CGRectGetWidth(newFrame)-10;
        view.frame =newFrame;
        [cell.contentView addSubview:view];
        if ([view isKindOfClass:[UIActivityIndicatorView class]]) {
            UIActivityIndicatorView *progresInd =(UIActivityIndicatorView *)view;
            [progresInd startAnimating];
        }
        
        
    }else{
       cell = [tableView dequeueReusableCellWithIdentifier:kViewCellID forIndexPath:indexPath];
         // Configure the cell...
        cell.textLabel.text =[dict objectForKey:kSourceKey];
        cell.textLabel.textColor=[UIColor grayColor];
        cell.textLabel.textAlignment =NSTextAlignmentCenter;
        cell.textLabel.numberOfLines =2;
        cell.textLabel.font =[UIFont systemFontOfSize:12];
    }
    cell.selectionStyle =UITableViewCellSelectionStyleNone;
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (indexPath.row ==0) ? 50 :38;
}
-(void)switchAction:(UISwitch *)sender
{
    NSLog(@"%s,%d",__func__,sender.on);

}
-(void)sliderAction:(UISlider *)sender
{
    NSLog(@"%s,%.2f",__func__,sender.value);
}
-(void)customSliderAction:(UISlider *)sender
{
     NSLog(@"%s,%.2f",__func__,sender.value);
    
}
-(void)pageControlAction:(UIPageControl *)sender
{
    NSLog(@"%s,%ld",__func__,(long)sender.currentPage);
}
-(void)steeperAction:(UIStepper *)sender
{
    NSLog(@"%s,%.2f",__func__,sender.value);

}
#pragma mark - event process
-(UIStepper *)stepper
{
    if (_stepper ==nil) {
        _stepper =[[UIStepper alloc]initWithFrame:CGRectMake(0, 10, 100, 20)];
        _stepper.tag =kViewTag;
        _stepper.value =1;
        _stepper.minimumValue=1;
        _stepper.maximumValue=10;
        _stepper.stepValue=1;
        [_stepper addTarget:self action:@selector(steeperAction:) forControlEvents:UIControlEventValueChanged];
    }
    return _stepper;
}
-(UIProgressView *)progressBar
{
    if (_progressBar ==nil) {
        _progressBar =[[UIProgressView alloc]initWithProgressViewStyle:UIProgressViewStyleDefault];
        _progressBar.frame =CGRectMake(0, 20, 120, 10);
        _progressBar.progress = 0.5;
        _progressBar.tag = kViewTag;
    }
    return _progressBar;
}
-(UIActivityIndicatorView *)progressInd
{
    if (_progressInd ==nil) {
        _progressInd =[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _progressInd.frame =CGRectMake(0, 20, 160, 20);
        [_progressInd startAnimating];
        _progressInd.tag =kViewTag;
        
    }
    return _progressInd;
}
-(UIPageControl *)pageControl
{
    if (_pageControl ==nil) {
        _pageControl =[[UIPageControl alloc]initWithFrame:CGRectMake(0, 10, 150, 30)];
        _pageControl.numberOfPages =10;
        _pageControl.backgroundColor =[UIColor grayColor];
        _pageControl.currentPage =0;
        [_pageControl addTarget:self action:@selector(pageControlAction:) forControlEvents:UIControlEventValueChanged];
        _pageControl.tag =kViewTag;
    }
    return _pageControl;
}
-(UISlider *)customSlider
{
    if (_customSlider ==nil) {
        _customSlider =[[UISlider alloc]initWithFrame:CGRectMake(0, 20, 100, 10)];
        _customSlider.minimumValue=0;
        _customSlider.maximumValue =100;
        _customSlider.value =50;
        [_customSlider addTarget:self action:@selector(customSliderAction:) forControlEvents:UIControlEventValueChanged];
        
        UIImage *minImg =[[UIImage imageNamed:@"orangeslide"]resizableImageWithCapInsets:UIEdgeInsetsMake(2, 8, 2, 8)];
        
        UIImage *maxImg =[[UIImage imageNamed:@"yellowslide"]resizableImageWithCapInsets:UIEdgeInsetsMake(2, 8, 2, 8)];
        [_customSlider setMinimumTrackImage:minImg forState:UIControlStateNormal];
        [_customSlider setMaximumTrackImage:maxImg forState:UIControlStateNormal];
        [_customSlider setThumbImage:[UIImage imageNamed:@"slider_ball"] forState:UIControlStateNormal];
        _customSlider.tag =kViewTag;
        
    }
    return _customSlider;
}
-(UISlider *)sliderCtl
{
    if (_sliderCtl ==nil) {
        _sliderCtl =[[UISlider alloc]initWithFrame:CGRectMake(0, 20, 100, 10)];
        _sliderCtl.minimumValue =0;
        _sliderCtl.maximumValue =100;
        _sliderCtl.value =50;
        _sliderCtl.tag =kViewTag;
        [_sliderCtl addTarget:self action:@selector(sliderAction:)forControlEvents:UIControlEventValueChanged];
        
        
    }
    return _sliderCtl;
}
-(UIControl *)switchCtl
{
    if (_switchCtl ==nil) {
        _switchCtl =[[UISwitch alloc]initWithFrame:CGRectMake(0, 10, kStdButtonWidth,kStdButtonHeight )];
       // _switchCtl.onTintColor =[UIColor greenColor];
       // _switchCtl.tintColor =[UIColor darkGrayColor];
        [_switchCtl addTarget:self action:@selector(switchAction:) forControlEvents:UIControlEventValueChanged];
        _switchCtl.on =NO;
        _switchCtl.tag =kViewTag;
    }
    return _switchCtl;
}
-(void)tintedAction:(UIBarButtonItem *)sender
{
}
-(void)dealloc
{
    [_dataArray release];
    [_sliderCtl release];
    [_switchCtl release];
    [_customSlider release];
    [_pageControl release];
    [_progressBar release];
    [_progressInd release];
    [_stepper release];
    [super dealloc];
}
@end
