//
//  QYAnimationWithBlockViewC.m
//  AnimationWithUIViewSample
//
//  Created by QingYun on 14-7-7.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYAnimationWithBlockViewC.h"

@interface QYAnimationWithBlockViewC ()
@property (weak, nonatomic) IBOutlet UIView *orangelView;

@end

@implementation QYAnimationWithBlockViewC

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)doAnimation:(id)sender
{
//    [UIView animateWithDuration:5.0f animations:^{
////        self.orangelView.backgroundColor = [UIColor blackColor];
//        self.orangelView.alpha = 0.2;
//    }];
    
//    [UIView animateWithDuration:5.0f animations:^{
//        self.orangelView.alpha = 0.2;
//    } completion:^(BOOL finished) {
//        self.orangelView.alpha = 1.0f;
//    }];
    CGPoint backupCenter = self.orangelView.center;
    CGPoint center = self.orangelView.center;
    center.x += 200;
    center.y += 200;
    [UIView animateWithDuration:5.0f delay:1.0f options:UIViewAnimationOptionCurveEaseOut animations:^{
        self.orangelView.center = center;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:5.0f animations:^{
                    self.orangelView.center = backupCenter;
        }];
    }];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
