//
//  SunkvoDemo.m
//  kvoDemo
//
//  Created by sunbiao on 14-8-18.
//  Copyright (c) 2014年 qingyun. All rights reserved.
//

#import "SunkvoDemo.h"
#import "SunstackData.h"
@interface SunkvoDemo ()
@property(nonatomic,strong)   SunstackData *stockData;
@end

@implementation SunkvoDemo

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
    
   self.stockData =[[SunstackData alloc]init];
 //   [_stockData setValue:@"zhangsan" forKey:@"name"];
   // [_stockData setValue:@"10.0" forKey:@"price"];
    [_stockData addObserver:self forKeyPath:@"price" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(10, 10, 50, 50)];
    btn.backgroundColor =[UIColor redColor];
    [btn setTitle:@"change" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
-(void)btnAction
{
     NSLog(@"old number is %@",[_stockData valueForKey:@"price"]);
    [_stockData setValue:@"20.0" forKey:@"price"];
}
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
   
    if ([keyPath isEqualToString:@"price"]) {
        NSLog(@"%@",[_stockData valueForKey:@"price"]);
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
-(void)dealloc
{
    [_stockData removeObserver:self forKeyPath:@"price"];
}

@end
