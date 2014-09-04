//
//  QYTextViewController.m
//  TodayDemo
//
//  Created by qingyun on 14-6-27.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYTextViewController.h"

@interface QYTextViewController ()
@property(nonatomic,retain) UITextView *textView;
@end

@implementation QYTextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title =@"TextView";
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    //创建并设置TextView
    [self creatTextView];
    
    //添加textView到self.view
    [self.view addSubview:_textView];
   
    //注册notification
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyBoardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardWillHiden:) name:UIKeyboardWillHideNotification object:nil];
}
-(void)viewWillAppear
{
    //注册notification
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(KeyBoardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(keyBoardWillHiden:) name:UIKeyboardWillHideNotification object:nil];
 
    
}
-(void)viewWillDisappear
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
-(void)creatTextView
{
    _textView =[[UITextView alloc]initWithFrame:self.view.bounds];
    
    NSString *text = @"Now is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country\n\nThis text view can also use attributed strings.";
    
    NSMutableAttributedString *attrString =[[NSMutableAttributedString alloc]initWithString:text];
    
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(text.length -23, 3)];
    [attrString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:1] range:NSMakeRange(text.length -23, 3)];
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(text.length-19, 19)];
    
    _textView.attributedText = attrString;
    [attrString release];
    
    _textView.delegate=self;
}
#pragma mark - textview delegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    UIBarButtonItem *rightButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(doneBarButtonItemAction:)];
    self.navigationItem.rightBarButtonItem = rightButtonItem;
    [rightButtonItem release];
}
//UIBarButtonItem的rightButtonItem的事件处理
-(void)doneBarButtonItemAction:(UIBarButtonItem *)sender
{
    [_textView resignFirstResponder];
    self.navigationItem.rightBarButtonItem = nil;
}
#pragma mark - 通知里的方法
-(void)KeyBoardWillAppear:(NSNotification *)notification
{
   
    NSDictionary *userinfo =notification.userInfo;
    CGRect keyBoardFrame = [[userinfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    double animationDuration = [[userinfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
   
    //动画设置frame
    [UIView beginAnimations:@"resize4KeyBoard"  context:nil];
    [UIView setAnimationDuration:animationDuration];
    CGRect newFrame = _textView.frame;
    newFrame.size.height -= keyBoardFrame.size.height;
    _textView.frame = newFrame;
    
    [UIView commitAnimations];
    
}
-(void)keyBoardWillHiden:(NSNotification *)notification
{
    NSDictionary *userinfo =notification.userInfo;
    CGRect keyBoardFrame =[[userinfo objectForKey:UIKeyboardFrameEndUserInfoKey]CGRectValue];
    double animationDuration =[[userinfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    //动画设置frame
    [UIView beginAnimations:@"resize4KeyBoard"  context:nil];
    
    [UIView setAnimationDuration:animationDuration];
    CGRect newFrame = _textView.frame;
    newFrame.size.height +=keyBoardFrame.size.height;
    _textView.frame =newFrame;
    
    [UIView commitAnimations];
    
}
-(void)dealloc
{
    [_textView release];
    [super dealloc];
}

@end
