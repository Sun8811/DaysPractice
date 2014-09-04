//
//  QYSearchBarViewController.m
//  UICatalogDemo
//
//  Created by qingyun on 14-6-26.
//  Copyright (c) 2014年 hnqingyun. All rights reserved.
//

#import "QYSearchBarViewController.h"

@interface QYSearchBarViewController ()
@property (nonatomic, retain) UISearchBar *searchBar;
@end

@implementation QYSearchBarViewController

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
    
    // title
    self.title = @"SearchBar";
    
    // 创建searchBar
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, 320, 44)];
    
    // searchBar属性设置
    _searchBar.showsBookmarkButton = YES;
    _searchBar.showsCancelButton = YES;
    _searchBar.delegate = self;
    
    // 添加到self.view的子视图
    [self.view addSubview:_searchBar];
    
    // 创建segmented
    NSArray *items = @[@"Normal", @"Tinted", @"Background"];
    UISegmentedControl *controlView = [[UISegmentedControl alloc] initWithItems:items];
    controlView.frame = CGRectMake(30, 130, 260, 30);
    controlView.tintColor = [UIColor grayColor];
    
    [controlView addTarget:self action:@selector(changeStyle:) forControlEvents:UIControlEventValueChanged];
    
    // 添加到self.view的子视图
    [self.view addSubview:controlView];
    [controlView release];
}

#pragma mark - UISearchBar delegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    CGRect searchBarFrame = searchBar.frame;
    searchBarFrame.origin.y -= 44;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    searchBar.frame = searchBarFrame;
    [UIView commitAnimations];
    
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    CGRect searchBarFrame = searchBar.frame;
    searchBarFrame.origin.y += 44;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    searchBar.frame = searchBarFrame;
    [UIView commitAnimations];

    [searchBar resignFirstResponder];
}

- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"%s", __func__);
}

- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    CGRect searchBarFrame = searchBar.frame;
    searchBarFrame.origin.y += 44;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    searchBar.frame = searchBarFrame;
    [UIView commitAnimations];
    
    [searchBar resignFirstResponder];
}

-(void)changeStyle:(UISegmentedControl *)sender
{
//    NSLog(@"%s:%d", __func__, sender.selectedSegmentIndex);
    _searchBar.barTintColor  = nil;
    _searchBar.backgroundImage = nil;
    [_searchBar setImage:nil forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
    
    switch (sender.selectedSegmentIndex) {
        case 1:
            _searchBar.barTintColor = [UIColor redColor];
            break;
        case 2:
            [_searchBar setBackgroundImage:[UIImage imageNamed:@"searchBarBackground"]];
            [_searchBar setImage:[UIImage imageNamed:@"bookmarkImage"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
            [_searchBar setImage:[UIImage imageNamed:@"bookmarkImageHighlighted"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
            break;
            
        default:
            break;
    }
}

- (void)dealloc
{
    [_searchBar release];
    [super dealloc];
}

@end
