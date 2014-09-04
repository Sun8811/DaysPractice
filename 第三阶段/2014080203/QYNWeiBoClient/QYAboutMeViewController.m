//
//  QYAboutMeViewController.m
//  QYNWeiBoClient
//
//  Created by QingYun on 14-7-24.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYAboutMeViewController.h"
#import "UIImageView+WebCache.h"
#import "QYStatuesTableViewCell.h"

@interface QYAboutMeViewController ()<SinaWeiboRequestDelegate>

@end

@implementation QYAboutMeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        [self.tabBarItem initWithTitle:@"我" image:[UIImage imageNamed:@"tabbar_profile"] selectedImage:[UIImage imageNamed:@"tabbar_profile_selected"]];
        _isHideNavigationBar = YES;
        self.title = @"个人中心";
//        实际如果不写这个初始化，那么默认的也是nil
        _userID = nil;
         [self requestUserTimelineFromSinaServer];
    }
    return self;
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect headFrame = CGRectMake(0, 0, 320, 255);
    UIView *headView = [[UIView alloc] initWithFrame:headFrame];
    
    CGRect imageViewFrame = CGRectMake(0, -100, 320, 250);
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:imageViewFrame];
    imageView.image = [UIImage imageNamed:@"profile_cover_background@2x.jpg"];
    [headView addSubview:imageView];
    
    self.tableView.tableHeaderView = headView;
    
    if (!self.isHideNavigationBar) {
        //    采用KVC从HomeViewController对象取出当前登录用户的数据
        UINavigationController *nav = (UINavigationController*)self.tabBarController.viewControllers[0];
        UIViewController *viewController = nav.topViewController;
        //    NSString *strAvatarUrl = [viewController valueForKeyPath:@"currentUserInfo.avatar_hd"];
        self.currentUserInfo = [viewController valueForKey:@"currentUserInfo"];
    }
    
    //创建用户头像视图并配置相关属性
    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(20, 125, 60, 60)];
    [avatarImageView setImageWithURL:[NSURL URLWithString:[self.currentUserInfo objectForKey:kUserAvatarHd]]];
    [headView addSubview:avatarImageView];
    
//    个人信息的名字 UILabel对象
    CGFloat interWidth = 15.0f;
    CGFloat interHeight = 5.0f;
    UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(avatarImageView.frame)+interWidth, avatarImageView.frame.origin.y, 100, 30)];
    labelName.textColor = [UIColor whiteColor];
    labelName.font = [UIFont boldSystemFontOfSize:14.0f];
    labelName.text = [self.currentUserInfo objectForKey:kUserInfoScreenName];
    [headView addSubview:labelName];
    
//    个人信息图片右边的两个button setImage setTitle UIEdgeInset的结构体，让图片和文字之间有一个间隔
    UIButton *btnWriteStatus = [self createButton:[UIImage imageNamed:@"userinfo_relationship_indicator_compose_os7"]
                                            Title:@"写微博"
                                            Frame:CGRectMake(CGRectGetMaxX(avatarImageView.frame)+interWidth, CGRectGetMaxY(labelName.frame)+interHeight, 100, 25)];
    [headView addSubview:btnWriteStatus];
    
    UIButton *btnFriends = [self createButton:[UIImage imageNamed:@"userinfo_relationship_indicator_friends_os7"]
                                        Title:@"好友列表"
                                        Frame:CGRectMake(CGRectGetMaxX(btnWriteStatus.frame)+interWidth,btnWriteStatus.frame.origin.y,100,25 )];
    [headView addSubview:btnFriends];
    
    
    UIButton *btnPersonDesp = [[UIButton alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(avatarImageView.frame)+5.0f, 300, 20)];
    btnPersonDesp.titleLabel.font = [UIFont systemFontOfSize:12.0f];
    [btnPersonDesp setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
    [btnPersonDesp setTitleColor:[UIColor grayColor] forState:UIControlStateHighlighted];
    NSString *personDespTitle = [self.currentUserInfo objectForKey:kUserVerifiedReson];
    if (nil == personDespTitle || personDespTitle.length == 0) {
        personDespTitle = [self.currentUserInfo objectForKey:kUserDescription];
    }
    [btnPersonDesp setTitle:personDespTitle forState:UIControlStateNormal];
    [btnPersonDesp setTitle:personDespTitle forState:UIControlStateHighlighted];
    [btnPersonDesp setContentHorizontalAlignment:UIControlContentHorizontalAlignmentLeft];
//    btnPersonDesp.titleLabel.textAlignment = NSTextAlignmentLeft;
    [headView addSubview:btnPersonDesp];
    
//    个人描述下方添加一条线
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(btnPersonDesp.frame)+5, 320, 1)];
    lineImageView.image = [UIImage imageNamed:@"settings_statistic_form_background_line"];
    [headView addSubview:lineImageView];
    
//    创建一个背景视图， 用于布局详细资料、当前用户发送微博数据、当前用户关注、当前用户的粉数等对象
    UIView *detailUserInfoBgView = [[UIView alloc] initWithFrame:CGRectMake(0, CGRectGetMaxY(lineImageView.frame), 320, 40)];
    detailUserInfoBgView.backgroundColor = [UIColor whiteColor];
    detailUserInfoBgView.tag = 3000;
    NSString *statusCountTitle = [NSString stringWithFormat:@"%@\n微博",[self.currentUserInfo objectForKey:kUserStatusCount]];
    NSString *friendCountTitle = [NSString stringWithFormat:@"%@\n关注",[self.currentUserInfo objectForKey:kUserFriendCount]];
    NSString *followCountTitle = [NSString stringWithFormat:@"%@\n粉丝",[self.currentUserInfo objectForKey:kUserFollowersCount]];
    [headView addSubview:detailUserInfoBgView];
    
    NSArray *detailUserInfoTitles = @[@"详细\n资料",statusCountTitle,friendCountTitle,followCountTitle,@"更多"];
    for (int i = 0;  i < detailUserInfoTitles.count; i++) {
        NSString *title = detailUserInfoTitles[i];
        [self createDetailUserInfoItem:title Frame:CGRectMake(i*64, 0, 64, 40)];
    }

    QYSafeRelease(imageView);
    QYSafeRelease(labelName);
    QYSafeRelease(headView);
    QYSafeRelease(detailUserInfoBgView);
}

- (void)createDetailUserInfoItem:(NSString*)title Frame:(CGRect)frame
{
    UIView *bgView = [self.tableView.tableHeaderView viewWithTag:3000];
    UIButton *btnUserDetail = [[UIButton alloc] initWithFrame:frame];
    btnUserDetail.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    btnUserDetail.titleLabel.numberOfLines = 2;
    btnUserDetail.titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
    [btnUserDetail setTitle:title forState:UIControlStateNormal];
    [btnUserDetail setTitle:title forState:UIControlStateHighlighted];
    [btnUserDetail setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnUserDetail setTitleColor:[UIColor blackColor] forState: UIControlStateHighlighted];
    [bgView addSubview:btnUserDetail];
    QYSafeRelease(btnUserDetail);
}

- (UIButton*)createButton:(UIImage*)bgImage Title:(NSString*)title Frame:(CGRect)frame
{
    UIButton *retBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    retBtn.frame = frame;
//    设置button的边界显示，主要是有边界并且是圆角
    retBtn.layer.borderColor = [UIColor lightGrayColor].CGColor;
    retBtn.layer.cornerRadius = 3.0f;
    retBtn.layer.borderWidth = 1.0f;
    
    [retBtn setTitle:title forState:UIControlStateNormal];
    [retBtn setTitle:title forState:UIControlStateHighlighted];
    [retBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [retBtn setTitleColor:[UIColor darkGrayColor] forState:UIControlStateHighlighted];
    
    [retBtn setImage:bgImage forState:UIControlStateNormal];
    [retBtn setImage:bgImage forState:UIControlStateHighlighted];
    
    [retBtn setImageEdgeInsets:UIEdgeInsetsMake(0, 15, 0, 60)];
    [retBtn setTitleEdgeInsets:UIEdgeInsetsMake(0, 10, 0, 10)];
    retBtn.titleLabel.font = [UIFont systemFontOfSize:13.0f];
    retBtn.backgroundColor = [UIColor whiteColor];
    return retBtn;
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    if (self.isHideNavigationBar) {
//        self.navigationController.navigationBarHidden = YES;
//    }else
//    {
//        self.navigationController.navigationBarHidden = NO;
//    }
    self.navigationController.navigationBarHidden = self.isHideNavigationBar;
   
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)requestUserTimelineFromSinaServer
{
    NSString *strUserID = nil;
    if (self.userID == nil) {
        strUserID = appDelegate.sinaWeibo.userID;
    }else
    {
        strUserID = self.userID;
    }
    [appDelegate.sinaWeibo requestWithURL:@"statuses/user_timeline.json" params:[NSMutableDictionary dictionaryWithObject:strUserID forKey:@"uid"] httpMethod:@"GET" delegate:self];
    
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"AboutMeTableViewCell";
    QYStatuesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (nil == cell) {
        cell = [[QYStatuesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.cellData = self.userTimeLine;
    return cell;
}



/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Table view delegate

// In a xib-based application, navigation from a table can be handled in -tableView:didSelectRowAtIndexPath:
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here, for example:
    // Create the next view controller.
    <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:<#@"Nib name"#> bundle:nil];
    
    // Pass the selected object to the new view controller.
    
    // Push the view controller.
    [self.navigationController pushViewController:detailViewController animated:YES];
}
*/

#pragma mark -
#pragma mark SinaWeiBoRequestDelegate
- (void)request:(SinaWeiboRequest *)request didReceiveResponse:(NSURLResponse *)response
{
    
}
- (void)request:(SinaWeiboRequest *)request didReceiveRawData:(NSData *)data
{
    
}
- (void)request:(SinaWeiboRequest *)request didFailWithError:(NSError *)error
{
    NSLog(@"%@",error);
}

- (void)request:(SinaWeiboRequest *)request didFinishLoadingWithResult:(id)result
{
    
    self.fullTimeLines = [result objectForKey:kUserStatuses];
    if (self.userTimeLine == nil) {
        self.userTimeLine =  self.fullTimeLines[0];
        [self.tableView reloadData];
    }
}

@end
