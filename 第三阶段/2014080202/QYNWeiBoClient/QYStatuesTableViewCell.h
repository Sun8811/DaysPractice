//
//  QYStatuesTableViewCell.h
//  QYNWeiBoClient
//
//  Created by qingyun on 14-7-28.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QYStatuesTableViewCell;
@protocol QYStatuesTableViewCellDelegate <NSObject>

@required
- (void)statuesTableViewCell:(QYStatuesTableViewCell*)cell StatuesImageViewDidSelected:(UIGestureRecognizer*)gesture;
- (void)statuesTableViewCell:(QYStatuesTableViewCell*)cell AvatarImageViewDidSelected:(UIGestureRecognizer*)gesture;
- (void)statuesTableViewCell:(QYStatuesTableViewCell*)cell RetweetStatuesImageViewDidSelected:(UIGestureRecognizer*)gesture;

@end

@interface QYStatuesTableViewCell : UITableViewCell
@property (nonatomic, retain) NSDictionary *cellData;
//显示微博单元格头部信息，主要有发送向博的博主的头像 名字 发布微博的时间以及发布微博的来源
@property (nonatomic, retain) UIImageView *avatarImageView;
@property (nonatomic, retain) UILabel   *labelName;
@property (nonatomic, retain) UILabel   *labelCreateTime;
@property (nonatomic, retain) UILabel   *labelSource;

//微博正文
@property (nonatomic, retain) UILabel   *labelStatues;
//原创微博图片背景视图
@property (nonatomic, retain) UIView    *stImageViewBg;
//转发微博正文
@property (nonatomic, retain) UILabel   *labelRetweetStatues;
//转发微博图片背景视图
@property (nonatomic, retain) UIView    *retweetImageViewBg;

//QYStatuesTableViewCell对象的代理对象必须遵守QYStatuesTableViewCellDelegate协议
//又因为，不确定到底是哪个类做为此cell的代理， 所以代理的类型是id,但是有一点是清楚的， 就是这个类必须遵社代理协议
@property (nonatomic, assign) id<QYStatuesTableViewCellDelegate> delegate;
@end
