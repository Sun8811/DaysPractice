//
//  QYTextViewController.m
//  UICatalogDemo
//
//  Created by qingyun on 14-6-26.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "QYTextViewController.h"

@interface QYTextViewController ()
@property (nonatomic, retain) UITextView *textView;
@end

@implementation QYTextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // 标题
    self.title = @"TextView";
    
    // 创建并设置UITextView
    [self setupTextView];
    
    // 注册键盘通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillApear:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    
}

- (void)setupTextView
{
    // 创建
    _textView = [[UITextView alloc] initWithFrame:self.view.bounds];
    NSString *text = @"Now is the time for all good developers to come to serve their country.\n\nNow is the time for all good developers to come to serve their country\n\nThis text view can also use attributed strings.";
    
    _textView.delegate = self;
//    _textView.text = text;
    
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:text];
    
    // 标记成蓝色
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(text.length-23, 3)];
    
    // 添加下划线
    [attrString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:1] range:NSMakeRange(text.length-23, 3)];
    
    // 标记红色
    [attrString addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(text.length-19, 19)];
    
    _textView.attributedText = attrString;
    [attrString release];
    
    [self.view addSubview:_textView];
}

#pragma mark - textview delegate
- (void)textViewDidBeginEditing:(UITextView *)textView
{
    UIBarButtonItem *saveItem = [[UIBarButtonItem alloc] initWithTitle:@"Done" style:UIBarButtonItemStyleDone target:self action:@selector(saveAction:)];
    self.navigationItem.rightBarButtonItem = saveItem;
    [saveItem release];
}

- (void)saveAction:(UIBarButtonItem *)sender
{
    [_textView resignFirstResponder];
    self.navigationItem.rightBarButtonItem = nil;
}

#pragma mark - Notifications
- (void)keyboardWillApear:(NSNotification *)notification
{
    NSLog(@"%s", __func__);
    NSDictionary *userinfo = notification.userInfo;
    CGRect keyboardFrame = [[userinfo objectForKey:UIKeyboardBoundsUserInfoKey] CGRectValue];
    double animationDuration = [[userinfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    
    // 动画设置frame
    
}

- (void)keyboardWillHide:(NSNotification *)notification
{
    NSLog(@"%s", __func__);    
}

- (void)dealloc
{
    [_textView release];
    [super dealloc];
}

@end
