//
//  QYEditStatusViewController.m
//  QYNWeiBoClient
//
//  Created by qingyun on 14-8-1.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYEditStatusViewController.h"
#import "QYEmojiPageView.h"

//遵守代理协议
//实现代理协议约定的方法
//最后，完成点击事件的逻辑
@interface QYEditStatusViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,QYEmojPageViewDelegate>

@property (nonatomic, retain) UISwipeGestureRecognizer *swipGestureReconginzer;
@property (nonatomic, retain) UIToolbar    *kbTopBarView;
@property (nonatomic, retain) NSMutableString *cacheTextViewText;
@property (nonatomic, retain) UIScrollView *emojScrollView;
@end
@implementation QYEditStatusViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.textView becomeFirstResponder];
    self.btnSend.enabled = NO;
    self.btnSend.alpha = 0.5f;
    
    self.kbTopBarView = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 568, 320, 44)];
    [self.view addSubview:self.kbTopBarView];
    
    [self createKeyboardTopBarItems];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
//    注册键盘弹出，消失通知事件
    [QYNSDC addObserver:self selector:@selector(keyBoardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [QYNSDC addObserver:self selector:@selector(keyBoardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
//    注销键盘弹出，消失通知事件
    [QYNSDC removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [QYNSDC removeObserver:self name:UIKeyboardWillHideNotification object:nil];
}

- (void)createKeyboardTopBarItems
{
    UIBarButtonItem *flexSpaceItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
//    照相机按纽
    UIBarButtonItem *cameraItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCamera target:self action:@selector(onCameraBarItemTapped:)];
//    图片库按纽
    UIBarButtonItem *photoItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemOrganize target:self action:@selector(onPhotoBarItemTapped:)];
//    联系人列表
    UIBarButtonItem *atContactItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemBookmarks target:self action:@selector(onAtContactBarItemTapped:)];
//    表情
    UIBarButtonItem *emotionItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAction target:self action:@selector(onEmotionBarItemTapped:)];
//    更多
    UIBarButtonItem *addItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(onAddBarItemTapped:)];
    
    [self.kbTopBarView setItems:@[cameraItem,flexSpaceItem,photoItem,flexSpaceItem,atContactItem,flexSpaceItem,emotionItem,flexSpaceItem,addItem]];
}

#pragma mark - 
#pragma mark UIBarButtonItem Callback
- (void)getMediaFromSource:(UIImagePickerControllerSourceType)sourceType
{
    //    首先需要判断一下， 你的设备是否支持照相机
    if ([UIImagePickerController isSourceTypeAvailable:sourceType]) {
        UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        //        对于UIImagePickerController来说必须遵守两个协议
        //        UIImagePickerControllerDelegate,UINavigationControllerDelegate
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.videoQuality = UIImagePickerControllerQualityTypeLow;
        //        sourceType决定了，当前调出的是照相机还是图片库
        picker.sourceType = sourceType;
        //        必须以模态的形式来弹出界面
        [self presentViewController:picker animated:YES completion:nil];
    }else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Error accessing media" message:@"Device doesn't support that media source" delegate:nil cancelButtonTitle: @"OK" otherButtonTitles:nil, nil];
        [alert show];
    }
    
}

//当点击键盘上方，UIToolBar上的照相机按纽的时候，调用此方法
- (void)onCameraBarItemTapped:(UIBarButtonItem*)sender
{
    [self getMediaFromSource:UIImagePickerControllerSourceTypeCamera];
}

//当点击键盘上方，UIToolBar上的图片库的按纽的时候，调用此方法
- (void)onPhotoBarItemTapped:(UIBarButtonItem*)sender
{
    [self getMediaFromSource:UIImagePickerControllerSourceTypePhotoLibrary];
}

//当点击键盘上方，UIToolBar上的联系人的按纽的时候，调用此方法
- (void)onAtContactBarItemTapped:(UIBarButtonItem*)sender
{
    
}

//当点击键盘上方，UIToolBar上的表情的按纽的时候，调用此方法
- (void)onEmotionBarItemTapped:(UIBarButtonItem*)sender
{
    if (self.emojScrollView != nil) {
        [self.emojScrollView removeFromSuperview];
        self.emojScrollView = nil;
        [self.textView becomeFirstResponder];
    }else{
        _emojScrollView = [[UIScrollView alloc ] initWithFrame:CGRectMake(0, [[UIScreen mainScreen]bounds].size.height-216, 320, 216)];
        self.emojScrollView.backgroundColor = [UIColor whiteColor];
        self.emojScrollView.pagingEnabled = YES;
        self.emojScrollView.showsHorizontalScrollIndicator = NO;
        self.emojScrollView.showsVerticalScrollIndicator = NO;
        NSUInteger nPageCount = [QYEmojiPageView pageForAllEmoji:35];
        self.emojScrollView.contentSize = CGSizeMake(320*nPageCount, 216);
        
        for (int i = 0 ;  i < nPageCount; i++) {
            QYEmojiPageView *fView = [[QYEmojiPageView alloc] initWithFrame:CGRectMake(10+320*i, 15, 320, 170)];
            fView.delegate = self;
            fView.backgroundColor = [UIColor clearColor];
            [fView LoadEmojiItem:i size:CGSizeMake(33, 43)];
            [self.emojScrollView addSubview:fView];
        }
        
        self.textView.inputView = self.emojScrollView;
        [self.textView resignFirstResponder];
    }
}

//当点击键盘上方，UIToolBar上的添加的按纽的时候，调用此方法
- (void)onAddBarItemTapped:(UIBarButtonItem*)sender
{
    
}

#pragma mark -
#pragma mark Keyboar notification 
//当键盘弹出的时候， 会发现弹出的通知事件， 因为我们注册了这个通知， 通知的这个回调就是这个方法，
//所以， 当键盘弹出的时候， 调用这个方法
- (void)keyBoardWillShow:(NSNotification*)notification
{
//    在这里添加向上滑动的手势， 将会跟UITextView的向下手势发生冲突
    //添加一个手势
    self.swipGestureReconginzer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(onSwipGesture:)];
    self.swipGestureReconginzer.direction = UISwipeGestureRecognizerDirectionDown;
    [self.textView addGestureRecognizer:self.swipGestureReconginzer];
    QYSafeRelease(self.swipGestureReconginzer);
    
    NSDictionary *userInfo = notification.userInfo;
    CGRect keyboardFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGRect kbTopBarViewShowFrame = (CGRect){keyboardFrame.origin.x,keyboardFrame.origin.y - 44,320,44};
    CGFloat timerInterval = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    UIViewAnimationOptions animationOptions = [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    [UIView animateWithDuration:timerInterval
                          delay:0.0
                        options:animationOptions
                     animations:^{
                         self.kbTopBarView.frame = kbTopBarViewShowFrame;
                     }
                     completion:nil];
//    取出当前textView的frame
    CGRect oldTextViewFrame = self.textView.frame;
//    oldTextViewFrame.size.height = oldTextViewFram.size.heiht - (CGRectGetHeight(keyboardFrame)+44)
    oldTextViewFrame.size.height -= (CGRectGetHeight(keyboardFrame)+44);
//    然后将其高度减去键盘的高度，再减去kbTopBarView的高度
    self.textView.frame = oldTextViewFrame;
}

//同理
///当键盘消失的时候，这个方法会被回调
- (void)keyBoardWillHide:(NSNotification*)notification
{
//    删除手势
    [self.textView removeGestureRecognizer:self.swipGestureReconginzer];
 
    NSDictionary *userInfo = notification.userInfo;
    CGRect keyboardFrame = [[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    
    CGRect kbTopBarViewFrame = CGRectMake(0, CGRectGetMinY(keyboardFrame)-44, 320, 44);
    
    CGFloat timerInterval = [[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] floatValue];
    UIViewAnimationOptions animationOptions = [[userInfo objectForKey:UIKeyboardAnimationCurveUserInfoKey] integerValue];
    
    [UIView animateWithDuration:timerInterval
                          delay:0.0
                        options:animationOptions
                     animations:^{
                         self.kbTopBarView.frame = kbTopBarViewFrame;
                     }
                     completion:nil];
    //    取出当前textView的frame
    CGRect oldTextViewFrame = self.textView.frame;
    oldTextViewFrame.size.height += (CGRectGetHeight(keyboardFrame)+44);
    //    然后将其高度加上键盘的高度，再减去kbTopBarView的高度
    self.textView.frame = oldTextViewFrame;
    
}

#pragma mark -
#pragma mark GesturRecongnizer
- (void)onSwipGesture:(UISwipeGestureRecognizer*)gesture
{
    [self.textView resignFirstResponder];
}
#pragma mark -
#pragma mark NavItem button callback
- (IBAction)onCancelButton:(UIButton *)sender
{
//    对于模态弹出的视，需要使用对应的消失方法来让其消失
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"不保存" otherButtonTitles:@"保存草稿", nil];
    [actionSheet showInView:self.view];
}

- (IBAction)onSendButton:(UIButton *)sender
{
    
}

#pragma mark -
#pragma mark UIActionSheetDelegate
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    switch (buttonIndex) {
        case 0:
            [self dismissViewControllerAnimated:YES completion:NULL];
            break;
        case 1:
        {
//            将数据保存，可以保存到云端、服务器或者本地
            [self dismissViewControllerAnimated:YES completion:NULL];
        }
            
            break;
        case 2:
            break;
        default:
            break;
    }
    
}
#pragma mark -
#pragma mark UITextViewDelegate
- (BOOL)textViewShouldBeginEditing:(UITextView *)textView
{
    NSRange range;
    range.location = 0;
    range.length = 0;
    textView.selectedRange = range;
    return YES;
}

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    NSLog(@"old text is %@",textView.text);
    if ([textView.text isEqualToString:@"分享新鲜事..."]) {
        textView.text = @"";
    }else if (textView.text.length == 0)
    {
        textView.text = @"分享新鲜事...";
        textView.selectedRange = range;
    }else
    {
        [self.cacheTextViewText appendString:text];
        self.textView.text = self.cacheTextViewText;
    }
    return YES;
}

- (void)textViewDidChange:(UITextView *)textView
{
    if (textView.text.length > 0 && ![textView.text isEqualToString:@"分享新鲜事..."])
    {
        self.btnSend.enabled = YES;
        self.btnSend.alpha = 1.0f;
    }else
    {
        self.btnSend.enabled = NO;
        self.btnSend.alpha = 0.5f;
    }
}

#pragma mark-
#pragma mark UIPickerImageCongrollerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 30, 200, 100)];
    imageView.image = image;
    [self.textView addSubview:imageView];
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark -
#pragma mark QYEmojiPageViewDelegate
- (void)emojiViewDidSelected:(QYEmojiPageView *)emojiView Item:(UIButton *)btnItem
{
    [self textView:self.textView shouldChangeTextInRange:NSRangeFromString(nil) replacementText:[btnItem titleForState:UIControlStateNormal]];
}

- (NSMutableString*)cacheTextViewText
{
    if (_cacheTextViewText == nil) {
        _cacheTextViewText = [[NSMutableString alloc] initWithCapacity:20];
    }
    return _cacheTextViewText;
}

- (void)dealloc {
    [_textView release];
    [_btnSend release];
    QYSafeRelease(_emojScrollView);
    QYSafeRelease(_cacheTextViewText);
    QYSafeRelease(_swipGestureReconginzer);
    [super dealloc];
}
@end
