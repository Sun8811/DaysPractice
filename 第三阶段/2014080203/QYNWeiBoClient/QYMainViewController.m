//
//  QYMainViewController.m
//  QYNWeiBoClient
//
//  Created by QingYun on 14-7-25.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYMainViewController.h"

#import "QYHomeViewController.h"
#import "QYMessageViewController.h"
#import "QYPlazaViewController.h"
#import "QYAboutMeViewController.h"
#import "QYMoreViewController.h"

@interface QYMainViewController ()

@end

@implementation QYMainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.tabBar setBackgroundImage:[UIImage imageNamed:@"tabbar_background"]];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    QYHomeViewController *homeVCtrl = [[QYHomeViewController alloc] initWithStyle:UITableViewStyleGrouped];
    QYMessageViewController *msgVctrl = [[QYMessageViewController alloc] initWithStyle:UITableViewStylePlain];
    QYPlazaViewController *plazaVCtrl = [[QYPlazaViewController alloc] init];
    QYAboutMeViewController *aboutMeVCtrl = [[QYAboutMeViewController alloc] initWithStyle:UITableViewStyleGrouped];
    QYMoreViewController *moreVCtrl = [[QYMoreViewController alloc] initWithStyle:UITableViewStylePlain];
    
    NSArray *viewControllers = @[homeVCtrl,msgVctrl,plazaVCtrl,aboutMeVCtrl,moreVCtrl];
    NSMutableArray *vcs = [NSMutableArray arrayWithCapacity:5];
    for (UIViewController *vc in viewControllers) {
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        [vcs addObject:nav];
        QYSafeRelease(nav);
        QYSafeRelease(vc);
    }
    self.viewControllers = vcs;
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
