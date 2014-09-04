//
//  QYSearchBarViewController.m
//  TodayDemo
//
//  Created by qingyun on 14-6-26.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "QYSearchBarViewController.h"


@interface QYSearchBarViewController ()
@property(nonatomic,retain) UISearchBar *searchBar;
@property(nonatomic,retain) UISegmentedControl *segmentedControl;
@end

@implementation QYSearchBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title =@"SearchBar";
        
        // Custom initialization
        _searchBar=[[UISearchBar alloc]initWithFrame:CGRectMake(0, 64, 320, 44)];
        _searchBar.showsBookmarkButton =YES;
        _searchBar.showsCancelButton =YES;
      
        NSArray *items =@[@"Normal",@"Tinted",@"BackGround"];
        
         _segmentedControl=[[UISegmentedControl alloc]initWithItems:items];
        _segmentedControl.frame =CGRectMake(30, 130, 260, 44) ;
        _segmentedControl.tintColor =[UIColor grayColor];
        [_segmentedControl addTarget:self action:@selector(segmentedAction:) forControlEvents:UIControlEventValueChanged];
        
        [self.view addSubview:_segmentedControl];
       
        [self.view addSubview:_searchBar];
       
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //设置代理
    self.searchBar.delegate=self;
}
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
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    CGRect newFrame =searchBar.frame;
    newFrame.origin.y +=44;
    
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationDuration:0.3];
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    searchBar.frame =newFrame;
    [UIView commitAnimations];
}
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    NSLog(@"display information");
}


-(void)segmentedAction:(UISegmentedControl *)sender
{
    _searchBar.barTintColor =nil;
    _searchBar.backgroundImage =nil;
    
    switch (sender.selectedSegmentIndex) {
        case 1:
            _searchBar.barTintColor=[UIColor redColor];
            break;
        case 2:
            _searchBar.backgroundImage=[UIImage imageNamed:@"searchBarBackground"];
            [_searchBar setImage:[UIImage imageNamed:@"bookmarkImage"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
            [_searchBar setImage:[UIImage imageNamed:@"bookmarkImageHighlighted"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
            

            
            break;
            
        default:
            break;
    }
    
}
-(void)dealloc
{
    [_searchBar release];
    [_segmentedControl release];
    [super dealloc];
    
}


@end
