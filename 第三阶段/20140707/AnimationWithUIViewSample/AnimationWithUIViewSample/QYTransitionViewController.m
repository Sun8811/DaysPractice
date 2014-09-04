//
//  QYTransitionViewController.m
//  AnimationWithUIViewSample
//
//  Created by QingYun on 14-7-7.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYTransitionViewController.h"

@interface QYTransitionViewController ()
@property (weak, nonatomic) IBOutlet UIView *greenView;
@property (weak, nonatomic) IBOutlet UIView *orangleView;
@property (weak, nonatomic) IBOutlet UIView *bgView;

@property (nonatomic, retain) UIView *bkGreenView;
@property (nonatomic, retain) UIView *bkOrangleView;

@end

@implementation QYTransitionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


//- (IBAction)doTransition:(id)sender {
//    
//    [UIView beginAnimations:nil context:nil];
//    [UIView setAnimationDuration:3.0f];
//    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
//    
////    [self.view exchangeSubviewAtIndex:0 withSubviewAtIndex:2];
//    [UIView setAnimationTransition:UIViewAnimationTransitionCurlUp forView:self.greenView cache:YES];
//    
//    self.greenView.hidden = YES;
//    
//    
//    [UIView commitAnimations];
//    
//}

- (IBAction)doTransition:(id)sender {
    
//    [UIView transitionFromView:self.greenView toView:self.orangleView duration:3.0f options:UIViewAnimationOptionTransitionCurlUp completion:nil];
    
//    
//    [UIView transitionFromView:self.greenView toView:self.orangleView duration:3.0f options:UIViewAnimationOptionTransitionCurlUp completion:^(BOOL finished) {
//        [UIView transitionFromView:self.orangleView toView:self.greenView duration:3.0f options:UIViewAnimationOptionTransitionCurlDown completion:^(BOOL finished) {
//            NSArray *subView = self.bgView.subviews;
//            [self.bgView addSubview:self.bkOrangleView];
//            [self.bgView addSubview:self.bkGreenView];
//            NSLog(@"%d",subView.count);
//        }];
//    }];
    
//
    
    [UIView transitionWithView:self.bgView duration:3.0f options:UIViewAnimationOptionTransitionCurlUp animations:^{
        self.orangleView.hidden = NO;
        self.greenView.hidden = YES;
    } completion:nil];
    
    
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.bkGreenView = self.greenView;
    self.bkOrangleView = self.orangleView;
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
