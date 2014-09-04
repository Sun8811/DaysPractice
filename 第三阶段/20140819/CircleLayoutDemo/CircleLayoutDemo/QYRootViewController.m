//
//  QYRootViewController.m
//  CircleLayoutDemo
//
//  Created by qingyun on 14-8-19.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYRootViewController.h"

@interface QYRootViewController ()

@property (nonatomic, assign) NSUInteger cellCount;
@end

@implementation QYRootViewController

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
    self.cellCount = 0;
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGestureRecognizer:)];
    [self.collectionView addGestureRecognizer:tapRecognizer];
    self.collectionView.backgroundColor = [UIColor orangeColor];
//    1、先注册UICollectionViewCell
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"CellID"];
//    2､ 实现UICollectionViewDataSource 的两个必须实现的委托方法
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -
#pragma mark UICollectionViewDataSource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.cellCount;
}

- (UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CellID" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor purpleColor];
    return cell;
}

#pragma mark -
#pragma mark UITapGestureRecongnizer callback function 
- (void)handleTapGestureRecognizer:(UITapGestureRecognizer*)tapRecognizer
{
    if (tapRecognizer.state == UIGestureRecognizerStateEnded) {
        //需要确认一下， 当前的点击是发生在UICollectionView上，还是发生在UICollectionViewCell上？
//        1､确认一下当前手势发生的位置
        CGPoint currentPoint = [tapRecognizer locationInView:self.collectionView];
//        2､根据手势发生位置，我们可以利用UICollectioinView的对象方法生成一个NSIndexPath
        NSIndexPath *tappedIndexPath = [self.collectionView indexPathForItemAtPoint:currentPoint];
//        3､判断点击的是CollectionView还是Cell？由于NSIdexPath是与cell相关联， 所以如是NSIdexPath有值， 那么肯定是点击的cell，否则点击不是cell
//        点击到了item上
        if (tappedIndexPath != nil) {
            //实现单元格的删除动作
            self.cellCount -= 1;
            [self.collectionView performBatchUpdates:^{
                [self.collectionView deleteItemsAtIndexPaths:@[tappedIndexPath]];
            } completion:NULL];
                
        }else //点击到的不是cell,而是UICollectionView
        {
//            实现单元格的插入动作
            self.cellCount += 1;
            [self.collectionView performBatchUpdates:^{
                NSIndexPath *insertIndexPath = [NSIndexPath indexPathForItem:0 inSection:0];
                [self.collectionView insertItemsAtIndexPaths:@[insertIndexPath]];
            } completion:NULL];
        }
    }
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

@end
