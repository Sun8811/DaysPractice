//
//  QYStatuesTableViewCell.m
//  QYNWeiBoClient
//
//  Created by qingyun on 14-7-28.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYStatuesTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "XMLDictionary.h"
#import "NSString+FrameHeight.h"

@implementation QYStatuesTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        const CGFloat fontSize = 14.0f;
        UIFont *customFont = [UIFont systemFontOfSize:fontSize];
        
        _avatarImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 35, 35)];
        _avatarImageView.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tapGestureRecongnizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onAvatarImageViewTapped:)];
        [_avatarImageView addGestureRecognizer:tapGestureRecongnizer];
        [self.contentView addSubview:_avatarImageView];
        
        _labelName = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelName.font = customFont;
        [self.contentView addSubview:_labelName];
        
        _labelCreateTime = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelCreateTime.font = customFont;
        [self.contentView addSubview:_labelCreateTime];
        
        _labelSource = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelSource.font = customFont;
        [self.contentView addSubview:_labelSource];
        
        _labelStatues = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelStatues.font = customFont;
        _labelStatues.numberOfLines = 0;
        [self.contentView addSubview:_labelStatues];
        
        _stImageViewBg = [[UIView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_stImageViewBg];
        
        _labelRetweetStatues = [[UILabel alloc] initWithFrame:CGRectZero];
        _labelRetweetStatues.font = customFont;
        _labelRetweetStatues.numberOfLines = 0;
        _labelRetweetStatues.backgroundColor = [UIColor lightGrayColor];
        [self.contentView addSubview:_labelRetweetStatues];
        
        
        _retweetImageViewBg = [[UIView alloc] initWithFrame:CGRectZero];
        [self.contentView addSubview:_retweetImageViewBg];
    }
    return self;
}

//由于cell在复用的时候，init方法是不会再次调用的， 所以被复用的控件的frame的高度需要重置，否则会出现视图重叠的问题。
- (void)restoreCellSubviewFrame
{
    self.labelStatues.frame = CGRectZero;
    self.labelRetweetStatues.frame = CGRectZero;
    self.stImageViewBg.frame = CGRectZero;
    self.retweetImageViewBg.frame = CGRectZero;
}
//在这个方法里， 我们会根据数据情况，对于cell的所有子视图进行重新布局
- (void)layoutSubviews
{
//    一定需要调用父类的layouSubviews
    [super layoutSubviews];
    [self restoreCellSubviewFrame];
    
    NSDictionary *statuesUserIno = [self.cellData objectForKey:kStatusUserInfo];
    NSDictionary *statuesInfo = self.cellData;
    NSUInteger widthSpace = 5;
    
    NSString *strUrl = [statuesUserIno objectForKey:kUserAvatarLarge];
    [self.avatarImageView setImageWithURL:[NSURL URLWithString:strUrl]];
    
    self.labelName.text = [statuesUserIno objectForKey:kUserInfoScreenName];
    self.labelName.frame = CGRectMake(CGRectGetMaxX(self.avatarImageView.frame) + widthSpace, 2, 100, 20);
    
    NSString *strDate = [statuesInfo objectForKey:kStatusCreateTime];
    //将字符串类型的日期转换成NSDate类型，，这样就可以参预计算
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"EEE MMM dd HH:mm:ss ZZZ yyyy"];
    NSDate *dateFromString = [dateFormatter dateFromString:strDate];
    //计算时间与微博创建时间间隔，单位：秒
    NSTimeInterval interval = [dateFromString timeIntervalSinceNow];
    self.labelCreateTime.text = [NSString stringWithFormat:@"%d分钟之前",abs((int)interval/60)];
    self.labelCreateTime.frame = CGRectMake( CGRectGetMaxX(self.avatarImageView.frame)+widthSpace,  CGRectGetMaxY(self.labelName.frame)+2, 100, 20);
    
    self.labelSource.frame = CGRectMake(CGRectGetMaxX(self.labelCreateTime.frame)+widthSpace, self.labelCreateTime.frame.origin.y, 200, 20);
    NSDictionary *dicSoucreInfo = [NSDictionary  dictionaryWithXMLString:[statuesInfo objectForKey:kStatusSource]];
    self.labelSource.text = [dicSoucreInfo objectForKey:XMLDictionaryTextKey];
    
    self.labelStatues.text = [statuesInfo objectForKey:kStatusText];
    CGRect newFrame = CGRectMake(5,
                                 CGRectGetMaxY(self.labelSource.frame)+5,
                                 310,
                                 [self.labelStatues.text frameHeightWithFontSize:14.0f forViewWidth:310.0]);
    
    self.labelStatues.frame = newFrame;

    for (UIView *retView in [self.stImageViewBg subviews]) {
        [retView removeFromSuperview];
    }

    for (UIView *stView in [self.retweetImageViewBg subviews]) {
        [stView removeFromSuperview];
    }
    
    NSUInteger statusImageWidth = 70;
    NSUInteger statusImageHeight = 70;
    //    尝试取出转发微博数据，如果取出的nil表示，这仅仅是一条原创的微博，如果不空，说明这是一条转发微博
    NSDictionary *retweetStatusInfo = [statuesInfo objectForKey:kStatusRetweetStatus];
    if (nil == retweetStatusInfo ) {
        // 因为是一条原创微博， 所以接下来直接显示附带的图片， 如果有的话。
        NSArray *statusPicUrls = [statuesInfo objectForKey:kStatusPicUrls];
        if (statusPicUrls.count == 1) {
            //如果原阶微博附带的只有一张图片 ， 则按原始大小显示就可以了。
            //将表示图片的字符串URL从数据集里取出
            NSString *strPicUrls = [statusPicUrls[0] objectForKey:kStatusThumbnailPic];
            NSURL *dataUrl = [NSURL URLWithString:strPicUrls];
            NSData *dataImage = [NSData dataWithContentsOfURL:dataUrl];
            UIImage *image = [UIImage imageWithData:dataImage];
            UIImageView *stImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, image.size.width, image.size.height)];
            
            stImgView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onStatuseImageViewTapped:)];
            [stImgView addGestureRecognizer:tapGesture];
            
            stImgView.image = image;
            [self.stImageViewBg addSubview:stImgView];
            self.stImageViewBg.frame = CGRectMake(widthSpace, CGRectGetMaxY(self.labelStatues.frame), image.size.width, image.size.height);
            QYSafeRelease(stImgView);
        }else  //statusPicUrls.count != 1
        {
            self.stImageViewBg.frame = CGRectMake(0, CGRectGetMaxY(self.labelStatues.frame), 310, 80 * ceilf(statusPicUrls.count /3.0f));
            for (int i = 0 ; i < statusPicUrls.count; i++) {
                UIImageView *stImgView = nil;
                if (statusPicUrls.count == 4) {
                    stImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5+statusImageWidth*(i%2), statusImageHeight*ceil(i/2), statusImageWidth, statusImageHeight)];
                }else
                {
                    stImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5+statusImageWidth*(i%3), statusImageHeight*ceil(i/3), statusImageWidth, statusImageHeight)];
                }
                stImgView.userInteractionEnabled = YES;
                UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onStatuseImageViewTapped:)];
                [stImgView addGestureRecognizer:tapGesture];
                NSString *strPicUrls = [statusPicUrls[i] objectForKey:kStatusThumbnailPic];
                [stImgView setImageWithURL:[NSURL URLWithString:strPicUrls]];
                [self.stImageViewBg addSubview:stImgView];
            }
        }
    }else //有转发微博内容 (retweetSTatusInfo != nil)
    {
        NSString *retStatusText = [retweetStatusInfo objectForKey:kStatusText];
        self.labelRetweetStatues.text = retStatusText;
        //根据转发微博的正文内容，计算转发微博label所点的高度
        CGFloat height4RetStatusText = [retStatusText frameHeightWithFontSize:14.0f forViewWidth:310.0f];
        CGRect newFrame = CGRectMake(5, CGRectGetMaxY(self.labelStatues.frame), 310.0f, height4RetStatusText);
        //        根据计算得到的新的fram更新转发微博内容的label的frame
        self.labelRetweetStatues.frame = newFrame;
        
        NSArray *retStatusPicUrls = [retweetStatusInfo objectForKey:kStatusPicUrls];
        if (retStatusPicUrls.count == 1) {
            NSString *strPicUrls = [retStatusPicUrls[0] objectForKey:kStatusThumbnailPic];
            UIImage *image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:strPicUrls]]];
            
            UIImageView *stImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, image.size.width, image.size.height)];
            [stImgView setImage:image];
            
            stImgView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onRetweetStatuseImageViewTapped:)];
            [stImgView addGestureRecognizer:tapGesture];
            [self.retweetImageViewBg addSubview:stImgView];
            self.retweetImageViewBg.frame = CGRectMake(5, CGRectGetMaxY(self.labelRetweetStatues.frame), image.size.width, image.size.height);
            QYSafeRelease(stImgView);
            
        }else if (retStatusPicUrls.count > 1)
        {
            self.retweetImageViewBg.frame = CGRectMake(0, CGRectGetMaxY(self.labelRetweetStatues.frame), 310, 80 * ceilf(retStatusPicUrls.count /3.0f));
            for (int i = 0 ; i < retStatusPicUrls.count; i++) {
                UIImageView *stImgView = nil;
                if (retStatusPicUrls.count == 4) {
                    stImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5+statusImageWidth*(i%2), statusImageHeight*ceil(i/2), statusImageWidth, statusImageHeight)];
                }else
                {
                    stImgView = [[UIImageView alloc] initWithFrame:CGRectMake(5+statusImageWidth*(i%3), statusImageHeight*ceil(i/3), statusImageWidth, statusImageHeight)];
                }
                
                NSString *strPicUrls = [retStatusPicUrls[i] objectForKey:kStatusThumbnailPic];
                [stImgView setImageWithURL:[NSURL URLWithString:strPicUrls]];
                [self.retweetImageViewBg addSubview:stImgView];
                QYSafeRelease(stImgView);
            }
            
        }
    }

}


#pragma mark -
#pragma mark Delegate 

- (void)onAvatarImageViewTapped:(UIGestureRecognizer*)gesture
{
    if ([self.delegate respondsToSelector:@selector(statuesTableViewCell:AvatarImageViewDidSelected:)]) {
        [self.delegate statuesTableViewCell:self AvatarImageViewDidSelected:gesture];
    }
}

- (void)onStatuseImageViewTapped:(UIGestureRecognizer*)gesture
{
//    测试一下， self.delegate是否能够响应代理方法， 如果不能响应， 则返回NO,否则返YES
    if ([self.delegate respondsToSelector:@selector(statuesTableViewCell:StatuesImageViewDidSelected:)]) {
        [self.delegate statuesTableViewCell:self StatuesImageViewDidSelected:gesture];
    }
    
}

- (void)onRetweetStatuseImageViewTapped:(UIGestureRecognizer*)gesture
{
    if ([self.delegate respondsToSelector:@selector(statuesTableViewCell:RetweetStatuesImageViewDidSelected:)]) {
        [self.delegate statuesTableViewCell:self RetweetStatuesImageViewDidSelected:gesture];
    }
}
- (void)dealloc
{
    QYSafeRelease(_avatarImageView);
    QYSafeRelease(_labelSource);
    QYSafeRelease(_labelName);
    QYSafeRelease(_labelCreateTime);
    [super dealloc];
}
@end
