//
//  QYCustomDataSource.m
//  QYCatalog
//
//  Created by QingYun on 14-7-1.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYCustomDataSource.h"

@implementation QYCustomDataSource

// returns the number of 'columns' to display.
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

// returns the # of rows in each component..
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 10;
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return @"QingYun";
}
@end
