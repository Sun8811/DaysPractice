//
//  QYButtonsViewController.m
//  TodayDemo
//
//  Created by qingyun on 14-6-25.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYButtonsViewController.h"

#define kStdButtonWidth    106
#define kStdButtonHeight   40
#define kViewTag           101

static NSString *kSectionTitleKey = @"sectionTitle";
static NSString *kLabelKey = @"label";
static NSString *kViewKey = @"button";
static NSString *kSourceKey = @"source";

static NSString *kViewCellID = @"viewCellID";
static NSString *kSourceCellID = @"sourceCellID";


@interface QYButtonsViewController ()
@property(nonatomic,retain) NSArray *dataArray;
@property(nonatomic,retain) UIButton *gratButton;
@property(nonatomic,retain) UIButton *imageButton;
@property (nonatomic, retain) UIButton *roundedButtonType;
@property (nonatomic, retain) UIButton *attrTextButton;
@property (nonatomic, retain) UIButton *detailDisclosureButton;
@property (nonatomic, retain) UIButton *infoLightButtonType;
@property (nonatomic, retain) UIButton *infoDarkButtonType;
@property (nonatomic, retain) UIButton *contactAddButtonType;
@end

@implementation QYButtonsViewController

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
    self.title =@"Buttons";

    //init data
    
    self.dataArray =@[@{ kSectionTitleKey:@"UIButton",
                         kLabelKey :@"Backgroud Image",
                         kViewKey :self.gratButton,
                         kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)grayButton"
    
                          },
                      @{ kSectionTitleKey:@"UIButton",
                         kLabelKey:@"Button with Image",
                         kViewKey:self.imageButton,
                         kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)imageButton"
                         },
                      @{ kSectionTitleKey:@"UIButtonTypeRoundedRect",
                         kLabelKey:@"Rounded Button",
                         kViewKey:self.roundedButtonType,
                         kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)roundedButtonType"
                         },
                      @{ kSectionTitleKey:@"UIButtonTypeRoundedRect",
                         kLabelKey:@"Attributed Text",
                         kViewKey:self.attrTextButton,
                         kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)attrTextButton"
                         },
                      @{ kSectionTitleKey:@"UIButtonTypeDetailDisclosure",
                         kLabelKey:@"Detail Disclosure",
                         kViewKey:self.detailDisclosureButton,
                         kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)detailDisclosureButton"
                         },
                      @{ kSectionTitleKey:@"UIButtonTypeInfoLight",
                         kLabelKey:@"Info Light",
                         kViewKey:self.infoLightButtonType,
                         kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)infoLightButtonType"
                         },
                      @{ kSectionTitleKey:@"UIButtonTypeInfoDark",
                         kLabelKey:@"Info Dark",
                         kViewKey:self.infoDarkButtonType,
                         kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)infoDarkButtonType"
                         },
                      @{ kSectionTitleKey:@"UIButtonTypeContactAdd",
                         kLabelKey:@"Contact Add",
                         kViewKey:self.contactAddButtonType,
                         kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)contactAddButtonType"
                         },
                      ];
    //注册cell(标示这种cell类型是UITableViewCell)
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kViewCellID];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kSourceCellID];
    
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
    UITableViewCell *cell;
    NSDictionary *dict =self.dataArray[indexPath.section];
    
    if (indexPath.row ==0) {
          cell= [tableView dequeueReusableCellWithIdentifier:kViewCellID forIndexPath:indexPath];
        // 移除之前cell上嵌入的view
        UIView *view2remove = [cell.contentView viewWithTag:kViewTag];
        if (view2remove) {
            [view2remove removeFromSuperview];
        }
        cell.textLabel.text =[dict objectForKey:kLabelKey];
        UIButton *btn =[dict objectForKey:kViewKey];
        CGRect newFrame = btn.frame;
        newFrame.origin.x =CGRectGetWidth(cell.contentView.frame)-CGRectGetWidth(newFrame)-10;
        btn.frame =newFrame;
        
        [cell.contentView addSubview:btn];
        
    }else{
       cell = [tableView dequeueReusableCellWithIdentifier:kSourceCellID forIndexPath:indexPath];
        cell.textLabel.text =[dict objectForKey:kSourceKey];
        cell.textLabel.textAlignment =NSTextAlignmentCenter;
        cell.textLabel.numberOfLines =2;
        cell.textLabel.font =[UIFont systemFontOfSize:12];
        cell.textLabel.textColor =[UIColor grayColor];
        
    }
    // Configure the cell...
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (indexPath.row ==0)? 50 : 38;
}

-(UIButton *)gratButton
{
    if (_gratButton ==nil) {
        _gratButton =[[UIButton alloc]initWithFrame:CGRectMake(0, 5, kStdButtonWidth, kStdButtonHeight)];
        [_gratButton setTitle:@"Gray" forState:UIControlStateNormal];
        [_gratButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        
        UIImage *bgImg =[[UIImage imageNamed:@"whiteButton"]resizableImageWithCapInsets:UIEdgeInsetsMake(8, 8, 8, 8)resizingMode:UIImageResizingModeStretch];
         UIImage *hlBgImg =[[UIImage imageNamed:@"blueButton"]resizableImageWithCapInsets:UIEdgeInsetsMake(8, 8, 8, 8)resizingMode:UIImageResizingModeStretch];
        
        [_gratButton setBackgroundImage:bgImg forState:UIControlStateNormal];
        [_gratButton setBackgroundImage:hlBgImg forState:UIControlStateHighlighted];
         _gratButton.tag = kViewTag;
    }
    return _gratButton;
}
-(UIButton *)imageButton
{
    if (_imageButton ==nil) {
    _imageButton =[[UIButton alloc]initWithFrame:CGRectMake(0, 5, kStdButtonWidth, kStdButtonHeight)];
    //[_imageButton setTitle:@"Gray" forState:UIControlStateNormal];
    [_imageButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    UIImage *bgImg =[[UIImage imageNamed:@"whiteButton"]resizableImageWithCapInsets:UIEdgeInsetsMake(8, 8, 8, 8)resizingMode:UIImageResizingModeStretch];
    UIImage *hlBgImg =[[UIImage imageNamed:@"blueButton"]resizableImageWithCapInsets:UIEdgeInsetsMake(8, 8, 8, 8)resizingMode:UIImageResizingModeStretch];
    
    [_imageButton setBackgroundImage:bgImg forState:UIControlStateNormal];
    [_imageButton setBackgroundImage:hlBgImg forState:UIControlStateHighlighted];
        [_imageButton setImage:[UIImage imageNamed:@"UIButton_custom"] forState:UIControlStateNormal];
      _imageButton.tag = kViewTag;
    }

    return _imageButton;
}
- (UIButton *)roundedButtonType
{
    if (_roundedButtonType ==nil) {
        _roundedButtonType =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        _roundedButtonType.frame =CGRectMake(0, 5, kStdButtonWidth, kStdButtonHeight);
        
        [_roundedButtonType setTitle:@"Rounded" forState:UIControlStateNormal];
        _roundedButtonType.tag=kViewTag;
    }
    return _roundedButtonType;
}
- (UIButton *)attrTextButton
{
    if (_attrTextButton ==nil) {
        _attrTextButton =[UIButton buttonWithType:UIButtonTypeRoundedRect];
        _attrTextButton.frame =CGRectMake(0, 5, kStdButtonWidth, kStdButtonHeight);
        //创建可变属性字符串
        NSMutableAttributedString *normalAttrString =[[NSMutableAttributedString alloc]initWithString:@"Rounded"];
        //给属性字符串添加属性
        [normalAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, normalAttrString.length)];
        
        NSMutableAttributedString *hlAttrString =[[NSMutableAttributedString alloc]initWithString:@"Rounded"];
        [hlAttrString addAttribute:NSForegroundColorAttributeName value:[UIColor greenColor] range:NSMakeRange(0, hlAttrString.length)];
        [_attrTextButton setAttributedTitle:normalAttrString forState:UIControlStateNormal];
        [_attrTextButton setAttributedTitle:hlAttrString forState:UIControlStateHighlighted];
        _attrTextButton.tag =kViewTag;
    }
    
    return _attrTextButton;
}
- (UIButton *)detailDisclosureButton
{
    if (_detailDisclosureButton == nil) {
        _detailDisclosureButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        _detailDisclosureButton.frame = CGRectMake(0, 10, 30, 30);
        _detailDisclosureButton.tag = kViewTag;
    }
    return _detailDisclosureButton;
}

- (UIButton *)infoLightButtonType
{
    if (_infoLightButtonType == nil) {
        _infoLightButtonType = [UIButton buttonWithType:UIButtonTypeInfoLight];
        _infoLightButtonType.frame = CGRectMake(0, 10, 30, 30);
        _infoLightButtonType.tag = kViewTag;
    }
    return _infoLightButtonType;
}

- (UIButton *)infoDarkButtonType
{
    if (_infoDarkButtonType == nil) {
        _infoDarkButtonType = [UIButton buttonWithType:UIButtonTypeInfoDark];
        _infoDarkButtonType.frame = CGRectMake(0, 10, 30, 30);
        _infoDarkButtonType.tag = kViewTag;
    }
    return _infoDarkButtonType;
}
-(UIButton *)contactAddButtonType
{
    if (_contactAddButtonType == nil) {
        _contactAddButtonType = [UIButton buttonWithType:UIButtonTypeContactAdd];
        _contactAddButtonType.frame = CGRectMake(0, 10, 30, 30);
        _contactAddButtonType.tag = kViewTag;
    }
    return _contactAddButtonType;

}

-(void)dealloc
{
    [_dataArray release];
    [_imageButton release];
    [_gratButton release];
    [super dealloc];
}

@end
