//
//  QYHomeViewController.m
//  QYNWeiBoClient
//
//  Created by QingYun on 14-7-24.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYHomeViewController.h"
#import "QYPlaySound.h"
#import "UIImageView+WebCache.h"
#import "QYStatuesTableViewCell.h"
#import "NSString+FrameHeight.h"
#import "TSActionSheet.h"
#import "QYAboutMeViewController.h"
#import "QYEditStatusViewController.h"

@interface QYHomeViewController ()<SinaWeiboRequestDelegate,QYStatuesTableViewCellDelegate>
//微博列表数据， 用于存储从新浪服务器上获取的最新的微博数据
@property (nonatomic, retain) NSDictionary *currentUserInfo;
@end

CGFloat fontSize = 14.0f;
@implementation QYHomeViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle: style];
    if (self) {
        [self.tabBarItem initWithTitle:@"首页"
                                 image:[UIImage imageNamed:@"tabbar_home"]
                         selectedImage:[UIImage imageNamed:@"tabbar_home_selected"]];
////        以下两个数据请求都是异步的，但是这两个请求对象的委托是相同的， 都是当前viewController
        [SVProgressHUD showWithStatus:@"获取数据"];
        [self requestHomeLineFromSinaServer];
        [self requestUserInfoFromSinaServer];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    下拉刷新控件
    UIRefreshControl *refresthControl = [[UIRefreshControl alloc] init];
    refresthControl.tintColor = [UIColor lightGrayColor];
    refresthControl.backgroundColor = [UIColor clearColor];
//    注意刷新控制的事件类型， 是ValueChanged
    [refresthControl addTarget:self action:@selector(onRefreshControl:) forControlEvents:UIControlEventValueChanged];
    self.refreshControl = refresthControl;
    QYSafeRelease(refresthControl);
    
//    导航栏上左边的按纽
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_compose_os7"] style:UIBarButtonItemStylePlain target:self action:@selector(onLeftButtonItem:)];
    self.navigationItem.leftBarButtonItem = leftItem;
    QYSafeRelease(leftItem);
    
    UIButton *btnTitle = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 100, 40)];
//    初始化的时候， 这个值是空的， 后续需要根据具体的数据来填写这个值， 其值就是当前登录用户的screen_name
//    [btnTitle setTitle:@"" forState:UIControlStateNormal];
    [btnTitle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btnTitle setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    btnTitle.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    [btnTitle addTarget:self action:@selector(onTitleButtonTapped:forEvent:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.titleView = btnTitle;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"navigationbar_pop_os7"] style:UIBarButtonItemStylePlain target:self action:@selector(onRightButtonItem:forEvent:)];
    self.navigationItem.rightBarButtonItem = rightItem;
    QYSafeRelease(rightItem);
}

- (void)onTitleButtonTapped:(UIButton*)sender forEvent:(UIEvent*)event
{
//    创建弹出式菜单对象
    TSActionSheet *tsActionSheet = [[TSActionSheet alloc] initWithTitle:@""];
    //设置弹出式菜童的背景颜色
    tsActionSheet.popoverBaseColor = [UIColor darkGrayColor];
//    添加弹出工菜单里的按纽，第二参数block的功能， 当点击按纽的时候， 会调用这个block块
    CGRect oldFrame = tsActionSheet.frame;
    CGRect newFrame = (CGRect){oldFrame.origin,160,oldFrame.size.height};
    tsActionSheet.frame = newFrame;

    tsActionSheet.titleFont = [UIFont boldSystemFontOfSize:14.0f];
    [tsActionSheet addButtonWithTitle:@"时间排序" block:^{
        
    }];
    [tsActionSheet addButtonWithTitle:@"智能排序" block: ^{
        
    }];
    [tsActionSheet addButtonWithTitle:@"我的微博" block: ^{
        
    }];
    [tsActionSheet addButtonWithTitle:@"密友圈" block: ^{
        
    }];
    [tsActionSheet addButtonWithTitle:@"互相关注" block: ^{
        
    }];
    
    tsActionSheet.cornerRadius = 1.0f;
    [tsActionSheet showWithTouch:event];

}

- (void)onRightButtonItem:(UIBarButtonItem*)buttonItem forEvent:(UIEvent*)event
{

    TSActionSheet *actionSheet = [[TSActionSheet alloc] initWithTitle:@""];
    actionSheet.popoverBaseColor = [UIColor darkGrayColor];
    CGRect oldFrame = actionSheet.frame;
    CGRect newFrame = (CGRect){oldFrame.origin,130.0f,oldFrame.size.height};
    actionSheet.frame = newFrame;
    [actionSheet addButtonWithTitle:@"刷新" block:^{
        [self onRefreshControl:nil];
    }];
    
    [actionSheet addButtonWithTitle:@"扫－扫" block:^{
        
    }];
    actionSheet.cornerRadius = 2.0f;
    [actionSheet showWithTouch:event];
}

- (void)onLeftButtonItem:(UIBarButtonItem*)buttonItem
{
    //实现写微博界面
    QYEditStatusViewController *editStatueViewController = [[QYEditStatusViewController alloc] init];
//    以模态视图弹出，所谓模态视图弹出指的是， 如果我没有消失， 不允许其它动作发生
    [self presentViewController:editStatueViewController animated:YES completion:NULL];
    QYSafeRelease(editStatueViewController);
}

- (void)requestHomeLineFromSinaServer
{
    [appDelegate.sinaWeibo requestWithURL:@"statuses/home_timeline.json" params:[NSMutableDictionary dictionaryWithObject:appDelegate.sinaWeibo.userID forKey:@"uid"] httpMethod:@"GET" delegate:self];
    //由于请求数据异步动作， 所以不能在这调用 [SVProgressHUD dismissWithSuccess:@"成功"];
}

- (void)requestUserInfoFromSinaServer
{
    [appDelegate.sinaWeibo requestWithURL:@"users/show.json" params:[NSMutableDictionary dictionaryWithObject:appDelegate.sinaWeibo.userID forKey:@"uid"] httpMethod:@"GET" delegate:self];
}


- (void)onRefreshControl:(UIRefreshControl*)refreshcontrol
{
    [SVProgressHUD showWithStatus:@"获取数据"];
    //到新浪服务器请求最新的数据
    QYPlaySound *playSound = [[QYPlaySound alloc] initForPlayingSoundEffectWith:@"msgcome.wav"];
    [playSound play];
    [self requestHomeLineFromSinaServer];
    [self requestUserInfoFromSinaServer];
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.statuesList.count;
}

//未使用封装自定义UITableViewCell类的实现
/*
 const int widthSpace = 10;
NSUInteger statusImageWidth = 70.0f;
NSUInteger statusImageHeight = 70.0f;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellIndentifier = @"StatusCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (nil == cell ) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
        UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 35, 35)];
        avatarImageView.tag = 1000;
        [cell.contentView addSubview:avatarImageView];
        
        UILabel *labelName = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(avatarImageView.frame) + widthSpace, 5, 100, 20)];
        labelName.font = [UIFont systemFontOfSize:fontSize];
        [cell.contentView addSubview:labelName];
        labelName.tag = 1001;
        
        UILabel *labelCreateTime = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(avatarImageView.frame)+widthSpace,  CGRectGetMaxY(labelName.frame)+2, 100, 20)];
        labelCreateTime.font = [UIFont systemFontOfSize:fontSize];
        [cell.contentView addSubview:labelCreateTime];
        labelCreateTime.tag = 1002;
        
        UILabel *labelStatuesSource = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(labelCreateTime.frame)+widthSpace, labelCreateTime.frame.origin.y, 200, 20)];
        labelStatuesSource.font = [UIFont systemFontOfSize:fontSize];
        [cell.contentView addSubview:labelStatuesSource];
        labelStatuesSource.tag = 1003;
        
//        用户展示原创微博正文 CGRectZero表示原点和宽，高都是0的值，在此处起到占位的作用
        UILabel *labelStatusText = [[UILabel alloc] initWithFrame:CGRectZero];
        labelStatusText.font = [UIFont systemFontOfSize:fontSize];
        [cell.contentView addSubview:labelStatusText];
        labelStatusText.tag = 1004;
        QYSafeRelease(labelStatusText);
        //创建微博图片视图,背景视图，将来微博附带的图片要放在这个视图，实际上相当于一个容器
        UIView *stImageViewBg = [[UIView alloc] initWithFrame:CGRectZero];
        stImageViewBg.tag = 1005;
        [cell.contentView addSubview:stImageViewBg];
        QYSafeRelease(stImageViewBg);
        
//        转发微博正文的UILabel对象
        UILabel *labelRetweetStatus = [[UILabel alloc] initWithFrame:CGRectZero];
        labelRetweetStatus.font = [UIFont systemFontOfSize:fontSize];
        labelRetweetStatus.tag = 1006;
        labelRetweetStatus.numberOfLines = 0; //多行显示
        labelRetweetStatus.backgroundColor = [UIColor lightGrayColor];//为了区分原创微博与转发微博
        [cell.contentView addSubview:labelRetweetStatus];
        QYSafeRelease(labelRetweetStatus);
//        转发微博附带图片显示的背景视图
        
        UIView *retStImageViewBg = [[UIView alloc] initWithFrame:CGRectZero];
        retStImageViewBg.tag = 1007;
        [cell.contentView addSubview:retStImageViewBg];
        QYSafeRelease(retStImageViewBg);
        
        QYSafeRelease(labelName);
        QYSafeRelease(labelCreateTime);
        QYSafeRelease(labelStatuesSource)
        QYSafeRelease(avatarImageView);
    }
    
    NSDictionary *statusInfo = self.statuesList[indexPath.section];
    NSDictionary *userInfo = [statusInfo objectForKey:@"user"];
    
    UIImageView *avatarView = (UIImageView*)[cell.contentView viewWithTag:1000];
    NSString *strUrl = [userInfo objectForKey:@"profile_image_url"];
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:strUrl]];
    avatarView.image = [UIImage imageWithData:imgData];
    
    UILabel *name = (UILabel*)[cell.contentView viewWithTag:1001];
    name.text = [userInfo objectForKey:@"screen_name"];;
    
    UILabel *createTime = (UILabel*)[cell.contentView viewWithTag:1002];
    NSString *strDate = [statusInfo objectForKey:@"created_at"];
//    将字符串类型的日期转换成NSDate类型，，这样就可以参预计算
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE MMM dd HH:mm:ss ZZZ yyyy"];
    NSDate *dateFromString = [dateFormatter dateFromString:strDate];
//    计算时间与微博创建时间间隔，单位：秒
    NSTimeInterval interval = [dateFromString timeIntervalSinceNow];
    createTime.text = [NSString stringWithFormat:@"%d分钟之前",abs((int)interval/60)];
    
    UILabel *statuesSource = (UILabel*)[cell.contentView viewWithTag:1003];
    NSDictionary *dicSoucreInfo = [NSDictionary  dictionaryWithXMLString:[statusInfo objectForKey:@"source"]];
    statuesSource.text = [dicSoucreInfo objectForKey:XMLDictionaryTextKey];;
    
    
    UILabel *statuesText = (UILabel*)[cell.contentView viewWithTag:1004];
    statuesText.numberOfLines = 0;
    statuesText.text = [statusInfo objectForKey:@"text"];
    CGRect newFrame = CGRectMake(5,
                                 CGRectGetMaxY(statuesSource.frame)+5,
                                 310,
                                 [statuesText.text frameHeightWithFontSize:fontSize forViewWidth:310.0]);

    statuesText.frame = newFrame;
    
    
//    为了防止因为tableView的重用机制带来的视图重叠问题， 在向微博图片背景视图或者是转发微博图片背景视图放置图片之前，
//    先清空一下。

    UIView *retBgView = [cell.contentView viewWithTag:1007];
    for (UIView *retView in [retBgView subviews]) {
        [retView removeFromSuperview];
    }
    
    UIView *statusBgView = [cell.contentView viewWithTag:1005];
    for (UIView *stView in [statusBgView subviews]) {
        [stView removeFromSuperview];
    }
    
//    尝试取出转发微博数据，如果取出的nil表示，这仅仅是一条原创的微博，如果不空，说明这是一条转发微博
    NSDictionary *retweetStatusInfo = [statusInfo objectForKey:@"retweeted_status"];
    UILabel *retLabelStatus = (UILabel*)[cell.contentView viewWithTag:1006];
    retLabelStatus.frame = CGRectZero;
    if (nil == retweetStatusInfo ) {
//        因为是一条原创微博， 所以接下来直接显示附带的图片， 如果有的话。
        NSArray *statusPicUrls = [statusInfo objectForKey:@"pic_urls"];
        if (statusPicUrls.count == 1) {
//            如果原阶微博附带的只有一张图片 ， 则按原始大小显示就可以了。
//            将表示图片的字符串URL从数据集里取出
            NSString *strPicUrls = [statusPicUrls[0] objectForKey:@"thumbnail_pic"];
            NSURL *dataUrl = [NSURL URLWithString:strPicUrls];
            NSData *dataImage = [NSData dataWithContentsOfURL:dataUrl];
            UIImage *image = [UIImage imageWithData:dataImage];
            UIImageView *stImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, image.size.width, image.size.height)];
            stImgView.image = image;
            [statusBgView addSubview:stImgView];
            statusBgView.frame = CGRectMake(widthSpace, CGRectGetMaxY(statuesText.frame), image.size.width, image.size.height);
            QYSafeRelease(stImgView);
        }else  //statusPicUrls.count != 1
        {
            statusBgView.frame = CGRectMake(0, CGRectGetMaxY(statuesText.frame), 310, 80 * ceilf(statusPicUrls.count /3.0f));
            for (int i = 0 ; i < statusPicUrls.count; i++) {
                UIImageView *stImgView = nil;
                if (statusPicUrls.count == 4) {
                    stImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5+statusImageWidth*(i%2), statusImageHeight*ceil(i/2), statusImageWidth, statusImageHeight)];
                }else
                {
                    stImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5+statusImageWidth*(i%3), statusImageHeight*ceil(i/3), statusImageWidth, statusImageHeight)];
                }
                
                NSString *strPicUrls = [statusPicUrls[i] objectForKey:@"thumbnail_pic"];
                [stImgView setImageWithURL:[NSURL URLWithString:strPicUrls]];
                [statusBgView addSubview:stImgView];
            }
        }
    }else //有转发微博内容 (retweetSTatusInfo != nil)
    {
        NSString *retStatusText = [retweetStatusInfo objectForKey:@"text"];
        retLabelStatus.text = retStatusText;
        //根据转发微博的正文内容，计算转发微博label所点的高度
        CGFloat height4RetStatusText = [retStatusText frameHeightWithFontSize:fontSize forViewWidth:310.0f];
        CGRect newFrame = CGRectMake(5, CGRectGetMaxY(statuesText.frame), 310.0f, height4RetStatusText);
//        根据计算得到的新的fram更新转发微博内容的label的frame
        retLabelStatus.frame = newFrame;
        
        NSArray *retStatusPicUrls = [retweetStatusInfo objectForKey:@"pic_urls"];
        if (retStatusPicUrls.count == 1) {
            NSString *strPicUrls = [retStatusPicUrls[0] objectForKey:@"thumbnail_pic"];
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strPicUrls]]];
            
            UIImageView *stImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, image.size.width, image.size.height)];
            [stImgView setImage:image];
            
            [retBgView addSubview:stImgView];
            retBgView.frame = CGRectMake(5, CGRectGetMaxY(retLabelStatus.frame), image.size.width, image.size.height);

        }else if (retStatusPicUrls.count > 1)
        {
            retBgView.frame = CGRectMake(0, CGRectGetMaxY(retLabelStatus.frame), 310, 80 * ceilf(retStatusPicUrls.count /3.0f));
            for (int i = 0 ; i < retStatusPicUrls.count; i++) {
                UIImageView *stImgView = nil;
                if (retStatusPicUrls.count == 4) {
                    stImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5+statusImageWidth*(i%2), statusImageHeight*ceil(i/2), statusImageWidth, statusImageHeight)];
                }else
                {
                    stImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5+statusImageWidth*(i%3), statusImageHeight*ceil(i/3), statusImageWidth, statusImageHeight)];
                }
                
                NSString *strPicUrls = [retStatusPicUrls[i] objectForKey:@"thumbnail_pic"];
                [stImgView setImageWithURL:[NSURL URLWithString:strPicUrls]];
                [retBgView addSubview:stImgView];
            }

        }
        
    }
    return cell;
}
 
 */


- (UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIndentifier = @"StatusCell";
    QYStatuesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndentifier];
    if (nil == cell) {
        cell = [[QYStatuesTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndentifier];
    }
    cell.cellData = self.statuesList[indexPath.section];
    cell.delegate = self;
    
    return cell;
    
}
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
  
//    需要判断是什么类型数据从新浪服务器返回来，然后根据具体的情况来进行具体的处理
    
//    不推荐的比较方法，因为字符串比较是逐个字符进行比较的，所以尽力降低字符的比较个数
    /*
    if ([request.url isEqualToString:@"https://open.weibo.cn/2/users/show.json"]) {
        self.currentUserInfo = (NSDictionary*)result;
        UIButton *btnTitle = (UIButton*)self.navigationItem.titleView;
        NSString *title = [self.currentUserInfo objectForKey:kUserInfoScreenName];
        [btnTitle setTitle:title forState:UIControlStateNormal];
        [btnTitle setTitle:title forState:UIControlStateHighlighted];
    }else if ([request.url isEqualToString:@"https://open.weibo.cn/2/statuses/home_timeline.json"])
    {
        self.statuesList = [result objectForKey:@"statuses"];
        [self.tableView reloadData];
    }*/
//    推荐以下的比较方法
    NSURL *url = [NSURL URLWithString:request.url];
    NSString *indentifierUrl = [[url pathComponents] lastObject];
    if ([indentifierUrl isEqualToString:@"show.json"]) {
        self.currentUserInfo = (NSDictionary*)result;
        UIButton *btnTitle = (UIButton*)self.navigationItem.titleView;
        NSString *title = [self.currentUserInfo objectForKey:kUserInfoScreenName];
        [btnTitle setTitle:title forState:UIControlStateNormal];
        [btnTitle setTitle:title forState:UIControlStateHighlighted];
    }else if ([indentifierUrl isEqualToString:@"home_timeline.json"])
    {
        self.statuesList = [result objectForKey:@"statuses"];
        NSLog(@"%@",self.statuesList);
        [self.tableView reloadData];
        
    }
    [self.refreshControl endRefreshing];
    [SVProgressHUD dismiss];
}

#pragma mark -
#pragma mark UIButton callback on footerView
- (void)onRetweetButton:(UIButton*)button
{
//    创建一个新的界面（viewController),导航控制器push，
//    NSDictionary *statuesInfo = self.statuesList[button.tag];
    
    NSLog(@"%s",__func__);
}

//思路：主要是采用了UIButton的selected状态
- (void)onAttitudeBtn:(UIButton*)sender
{
    NSUInteger nAttitudeCount;
    if (sender.selected) {
        sender.selected = NO;
        nAttitudeCount = [[sender titleForState:UIControlStateSelected] integerValue];
        nAttitudeCount--;
        [sender setTitle:[NSString stringWithFormat:@"%d",nAttitudeCount] forState:UIControlStateNormal];
    }else
    {
        nAttitudeCount = [[sender titleForState:UIControlStateNormal] integerValue];
        nAttitudeCount++;
        sender.selected = YES;
        [sender setTitle:[NSString stringWithFormat:@"%d",nAttitudeCount] forState:UIControlStateSelected];
    }
    //需要将点赞之后得到数据上传到服务器
}

#pragma mark -
#pragma mark QYStatuesTableViewCellDelegate
static const NSInteger  tagImageView = 3333;
- (void)showFullImageViewWithUrl:(NSString *)strUrl
{
    NSData *imgData = [NSData dataWithContentsOfURL:[NSURL URLWithString:strUrl]];
    UIImage *image = [UIImage imageWithData:imgData];
    //    2、创建了一个UIImageView对象
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imageView.image = image;
    //    因为当点击放大后的图片时， 还需要将基缩小， 所以交互属性必须设置YES
    imageView.userInteractionEnabled = YES;
    //    因为， 需要当图片放大缩小， 所以多点触摸需要允许
    imageView.multipleTouchEnabled = YES;
//    给UIImageView对象添加一个手势，用于当放大后， 再次点击图片的时候， 消失这张图片
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onFullImageViewTapped:)];
    [imageView addGestureRecognizer:tapGesture];
    QYSafeRelease(tapGesture);
    
    imageView.tag = tagImageView;
    //    3､再创建一个UIScrollView对象，配置一下UIScrollView对象的属性、代理
    UIScrollView *imgScrollView = [[UIScrollView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    imgScrollView.contentSize = image.size;
    imgScrollView.backgroundColor = [UIColor blackColor];
    imgScrollView.delegate = self;
    imgScrollView.minimumZoomScale = 0.5f;
    imgScrollView.maximumZoomScale = 3.0f;
    [imgScrollView addSubview:imageView];
    QYSafeRelease(imageView);
    //    4、让UIScrollView对象全屏显示，将UIScrollView对象添加到window上
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    [window addSubview:imgScrollView];
    QYSafeRelease(imgScrollView);
}

//当点击原创微博所附带的图片的时候， 这个方法会被调用
- (void)statuesTableViewCell:(QYStatuesTableViewCell*)cell StatuesImageViewDidSelected:(UIGestureRecognizer*)gesture
{
//    1､从服务器上把原始图片下载下来
    NSString *strUrl = [cell.cellData objectForKey:kStatusOriginalPic];
    [self showFullImageViewWithUrl:strUrl];

}
//当点击微博的用户头像的时候， 此方法会被调用
- (void)statuesTableViewCell:(QYStatuesTableViewCell*)cell AvatarImageViewDidSelected:(UIGestureRecognizer*)gesture
{
    //如果设计的时候， 没有将cell回传回来，如何根据gesture这个参数，拿到用户数据信息？
    /*
//    确当前点击的位置，发生在tableView的哪一个点上
    CGPoint currentPoint = [gesture locationInView:self.tableView];
//  注意：重点是在tableView里， 可以根据手势点击的位置， 确定当前点击的indexPath
    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:currentPoint];
    NSDictionary *curUserInfo = [self.statuesList[indexPath.section] objectForKey:kStatusUserInfo];
   */
    //实例化一个QYAboutMeViewController对象
    QYAboutMeViewController *aboutMeViewController = [[QYAboutMeViewController alloc] initWithStyle:UITableViewStyleGrouped];
    aboutMeViewController.userID = [[[cell.cellData objectForKey:kStatusUserInfo] objectForKey:kUserID] stringValue];
    aboutMeViewController.isHideNavigationBar = NO;
//    传递数据
    aboutMeViewController.currentUserInfo = [cell.cellData objectForKey:kStatusUserInfo];
//    设置界面的显示效果
//    [aboutMeViewController setValue:cell.cellData forKeyPath:@"userTimeLine"];
    aboutMeViewController.userTimeLine = cell.cellData;
    [self.navigationController pushViewController:aboutMeViewController animated:YES];
    QYSafeRelease(aboutMeViewController);
}

//当点击， 转发微博图片的时候，这个方法会被调用
- (void)statuesTableViewCell:(QYStatuesTableViewCell*)cell RetweetStatuesImageViewDidSelected:(UIGestureRecognizer*)gesture
{
//    由于当只有转发微博内容的时候， 这个方法才可能会被调用到， 所以在这个方法里， 不需要判断是否有转发微博。但是还是需要判断是否有原始图片
    NSDictionary *retweetStautesInfo = [cell.cellData objectForKey:kStatusRetweetStatus];
    NSString *originalPicUrl = [retweetStautesInfo objectForKey:kStatusOriginalPic];
    if (originalPicUrl != nil) {
        [self showFullImageViewWithUrl:originalPicUrl];
    }
}

- (void)onFullImageViewTapped:(UITapGestureRecognizer*)gesture
{
//    可以以动画的形式让图片消失
    [UIView animateWithDuration:2.25f animations:^{
        [gesture.view.superview removeFromSuperview];
    }];
    
}
#pragma mark -
#pragma mark UIScrollViewDelegate
- (UIView*)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return [scrollView viewWithTag:tagImageView];
}
@end
