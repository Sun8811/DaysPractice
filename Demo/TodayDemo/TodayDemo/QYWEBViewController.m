//
//  QYWEBViewController.m
//  TodayDemo
//
//  Created by qingyun on 14-6-27.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYWEBViewController.h"

@interface QYWEBViewController ()
@property(nonatomic,retain) UITextField *urlTextFields;
@property(nonatomic,retain) UIWebView *webView;

@end

@implementation QYWEBViewController

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
    //设置标题
    self.title =@"Webs";
    //创建UiTextFields
    
    [self createTextFields];
    
    //创建WebView
    
    [self createAndSetWebview];
}
-(void)createTextFields
{
    _urlTextFields =[[UITextField alloc]initWithFrame:CGRectMake(10, 64, 300, 30)];
    _urlTextFields.text =@"http://www.apple.com";
    _urlTextFields.textColor =[UIColor blackColor];
    _urlTextFields.borderStyle =UITextBorderStyleRoundedRect;
    _urlTextFields.clearButtonMode =UITextFieldViewModeWhileEditing;
    _urlTextFields.delegate =self;
    
    _urlTextFields.keyboardType =UIKeyboardTypeURL;
    _urlTextFields.returnKeyType =UIReturnKeyGo;
    
    [self.view addSubview:_urlTextFields];
 
}
-(void)createAndSetWebview
{
    _webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 94, 320, 480)];
    //设置代理
    _webView.delegate =self;
    _webView.scalesPageToFit =YES;
    [self.view addSubview:_webView];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlTextFields.text]]];
    
    
    
}
//================delegate里的实现方法============
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    [_webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_urlTextFields.text]]];
    return YES;
}

- (void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible =YES;
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible =NO;
}

-(void)dealloc
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible =NO;
    [_urlTextFields release];
    [_webView release];
    [super dealloc];
    
}

@end
