//
//  QYSegmentViewController.m
//  QYCatalog
//
//  Created by QingYun on 14-4-23.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYSegmentViewController.h"

#define kSegmentedControlHeight 40.0
#define kLabelHeight 20.0
@interface QYSegmentViewController ()

@end

@implementation QYSegmentViewController

+ (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title
{
    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    
	label.textAlignment = NSTextAlignmentLeft;
    label.text = title;
    label.font = [UIFont boldSystemFontOfSize:17.0];
    label.textColor = [UIColor colorWithRed:76.0/255.0 green:86.0/255.0 blue:108.0/255.0 alpha:1.0];
    label.backgroundColor = [UIColor clearColor];
	label.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
    return label;
}

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
    CGFloat yPlacement = 20;
    NSArray *secgmentTextContent = @[@"Check",@"Search",@"Tools"];
    CGRect frame = CGRectMake(20, yPlacement, 280, 40);
    
    [self.view addSubview:[[self class] labelWithFrame:frame title:@"UISegmentedControl:"]];
    
    UISegmentedControl *segmentedControl = [[UISegmentedControl alloc] initWithItems:
                                            @[
                                              [UIImage imageNamed:@"segment_check.png"],
                                              [UIImage imageNamed:@"segment_search.png"],
                                              [UIImage imageNamed:@"segment_tools.png"]
                                              ]];
	yPlacement += 20 + kLabelHeight;
	frame = CGRectMake(	20,
                       yPlacement,
                       CGRectGetWidth(self.view.bounds) - (20 * 2.0),
                       kSegmentedControlHeight);
	segmentedControl.frame = frame;
    segmentedControl.selectedSegmentIndex = 0;
    [self.view addSubview:segmentedControl];
    
    
    yPlacement += (10 * 2.0) + kSegmentedControlHeight;
	frame = CGRectMake(	20,
                       yPlacement,
                       CGRectGetWidth(self.view.bounds) - (20 * 2.0),
                       kLabelHeight);
	[self.view addSubview:[[self class] labelWithFrame:frame title:@"UISegmentControlStyleBordered:"]];
	
#pragma mark - UISegmentControlStyleBordered
	segmentedControl = [[UISegmentedControl alloc] initWithItems:secgmentTextContent];
	yPlacement += 10 + kLabelHeight;
	frame = CGRectMake(	20,
                       yPlacement,
                       CGRectGetWidth(self.view.bounds) - (20 * 2.0),
                       kSegmentedControlHeight);
	segmentedControl.frame = frame;
//	[segmentedControl addTarget:self
//                         action:@selector(segmentAction:)
//               forControlEvents:UIControlEventValueChanged];
	segmentedControl.selectedSegmentIndex = 1;
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
	[self.view addSubview:segmentedControl];
    
    
    yPlacement += (10 * 2.0) + kSegmentedControlHeight;
	frame = CGRectMake(	20 ,
					   yPlacement,
					   CGRectGetWidth(self.view.bounds) - (20 * 2.0),
					   kLabelHeight);
	[self.view addSubview:[[self class] labelWithFrame:frame title:@"UISegmentControlStyleBar:"]];
	
#pragma mark - UISegmentControlStyleBar
	yPlacement += 10 + kLabelHeight;
	segmentedControl = [[UISegmentedControl alloc] initWithItems:secgmentTextContent];
    segmentedControl.tintColor = [UIColor redColor];
	frame = CGRectMake(	20,
					   yPlacement,
					   CGRectGetWidth(self.view.bounds) - (20 * 2.0),
					   kSegmentedControlHeight);
	segmentedControl.frame = frame;
//	[segmentedControl addTarget:self
//                         action:@selector(segmentAction:)
//               forControlEvents:UIControlEventValueChanged];
//	segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
	segmentedControl.selectedSegmentIndex = 1;
	segmentedControl.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
    
	[self.view addSubview:segmentedControl];
    
    yPlacement += 30 + kLabelHeight ;
    segmentedControl = [[UISegmentedControl alloc] initWithItems:secgmentTextContent];
    segmentedControl.tintColor = [UIColor orangeColor];
    frame = CGRectMake(20, yPlacement, CGRectGetWidth(self.view.bounds) - (20 *2.0),kSegmentedControlHeight );
    segmentedControl.frame = frame;
    
    segmentedControl.selectedSegmentIndex = 0;
    [segmentedControl setBackgroundImage:[UIImage imageNamed:@"segmentedBackground"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [segmentedControl setDividerImage:[UIImage imageNamed:@"divider"] forLeftSegmentState:UIControlStateNormal rightSegmentState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.view addSubview:segmentedControl];
	


    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
