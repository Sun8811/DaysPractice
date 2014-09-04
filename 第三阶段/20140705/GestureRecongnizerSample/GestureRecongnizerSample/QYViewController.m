//
//  QYViewController.m
//  GestureRecongnizerSample
//
//  Created by QingYun on 14-7-5.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYViewController.h"

@interface QYViewController ()

@end

@implementation QYViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    /*
    UITapGestureRecognizer *tapGestureGecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapped:)];
    tapGestureGecognizer.numberOfTapsRequired = 1;
    tapGestureGecognizer.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:tapGestureGecognizer];
    
    
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(doubleTapped:)];
    doubleTap.numberOfTapsRequired = 2;
    doubleTap.numberOfTouchesRequired = 1;
    [self.view addGestureRecognizer:doubleTap];
    
//   就是说双击手势的优先级比单击高， 如果双击手势执行的话， 那么单击手势将不会执行
//   在单击手势和双击手势之间建立一种依赖关系。只有当双击手势失效的时候， 单击手势才会起作用。
    [tapGestureGecognizer requireGestureRecognizerToFail:doubleTap];
    
    
    UIPinchGestureRecognizer *pinch = [[ UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(onPinchGestureRrecognizer:)];
    [self.view addGestureRecognizer:pinch];
    
    */
    UIRotationGestureRecognizer *rotation = [[UIRotationGestureRecognizer alloc] initWithTarget:self action:@selector(onRotation:)];
    [self.view addGestureRecognizer:rotation];
    
    
}

- (void)onRotation:(UIRotationGestureRecognizer*)sender
{
    NSLog(@"%f",sender.rotation);
}

- (void)onPinchGestureRrecognizer:(UIPinchGestureRecognizer*)sender
{
    NSLog(@"%f",sender.scale);
}

- (void)singleTapped:(UITapGestureRecognizer*)sender
{
    NSLog(@"单击");
}

- (void)doubleTapped:(UITapGestureRecognizer*)sender
{
    NSLog(@"双击");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
