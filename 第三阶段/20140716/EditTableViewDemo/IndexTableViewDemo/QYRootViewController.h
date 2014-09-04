//
//  QYRootViewController.h
//  IndexTableViewDemo
//
//  Created by qingyun on 14-6-24.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYRootViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, retain) UITableView *tableView;
@end
