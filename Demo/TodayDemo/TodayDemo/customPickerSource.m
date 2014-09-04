//
//  customPickerSource.m
//  TodayDemo
//
//  Created by qingyun on 14-7-1.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "customPickerSource.h"

@implementation customPickerSource
-(id)init
{
    [super init];
    if (self) {
        
    }
    return self;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
	return 4;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
	return 1;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
     UIView *retView =[[UIView alloc]initWithFrame:CGRectMake(0, 0, 320, 216)];
    switch (row) {
        case 0:{
            
            UIImageView *image1 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"12-6AM"]];
            image1.frame =CGRectMake(100, 60, 30, 30);
            UILabel *label1 =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image1.frame)+20,60 , 100, 30)];
            label1.text =@"Early Moring";
        
            [retView addSubview:image1];
            [retView addSubview:label1];
            [image1 release];
            [label1 release];
        }
            break;
            
        case 1:{
            
            UIImageView *image2 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"6-12AM"]];
            image2.frame =CGRectMake(100, 60, 30, 30);
            UILabel *label1 =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image2.frame)+20,60 , 100, 30)];
            label1.text =@"Late Moring";
            
            [retView addSubview:image2];
            [retView addSubview:label1];
            [image2 release];
            [label1 release];
        }
            break;
        case 2:{
            
            UIImageView *image2 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"12-6PM"]];
            image2.frame =CGRectMake(100, 60, 30, 30);
            UILabel *label1 =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image2.frame)+20,60 , 100, 30)];
            label1.text =@"Late Moring";
            
            [retView addSubview:image2];
            [retView addSubview:label1];
            [image2 release];
            [label1 release];
        }
            break;
        case 3:{
            
            UIImageView *image2 =[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"6-12PM"]];
            image2.frame =CGRectMake(100, 60, 30, 30);
            UILabel *label1 =[[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(image2.frame)+20,60 , 100, 30)];
            label1.text =@"Late Moring";
            
            [retView addSubview:image2];
            [retView addSubview:label1];
            [image2 release];
            [label1 release];
        }
            break;

            default:
            break;
    }
    return retView;
    
}
@end

