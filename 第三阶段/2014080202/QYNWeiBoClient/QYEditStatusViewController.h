//
//  QYEditStatusViewController.h
//  QYNWeiBoClient
//
//  Created by qingyun on 14-8-1.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface QYEditStatusViewController : UIViewController<UITextViewDelegate,UIActionSheetDelegate>
@property (retain, nonatomic) IBOutlet UITextView *textView;
@property (retain, nonatomic) IBOutlet UIButton *btnSend;

@end
