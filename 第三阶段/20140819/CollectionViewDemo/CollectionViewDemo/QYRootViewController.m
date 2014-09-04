//
//  QYRootViewController.m
//  CollectionViewDemo
//
//  Created by qingyun on 14-8-19.
//  Copyright (c) 2014年 河南青云信息技术有限公司. All rights reserved.
//

#import "QYRootViewController.h"
#import "QYCollectionViewCell.h"

@interface QYRootViewController ()<UICollectionViewDataSource,UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
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

- (void)loadView
{
//    注意：UICollectionView必须有一个布局对象
//    _collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //    设置UICollectionView内容滚动方向UICollectionViewScrollDirectionVertical, UICollectionViewScrollDirectionHorizontal
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
//    成员属性的值，确定的是collectionView内容所有内容的属性值， 但是采用委托可以单独指定，你想高度定制的那些元素
//    layout.itemSize = CGSizeMake(50, 50);
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
//    layout.minimumLineSpacing = 40.0f;
    
    _collectionView = [[UICollectionView alloc] initWithFrame:[UIScreen mainScreen].bounds collectionViewLayout:layout];
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    self.view = _collectionView;
}


#pragma mark -
#pragma mark UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 2;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 30;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
//    声明一个UICollectionViewCell对象， 并且通出复用队列得到对象的值
    QYCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"QYCellID" forIndexPath:indexPath];
//    设置单元格的属性
    cell.backgroundColor = [UIColor orangeColor];
//    设置单元格的选中视图
    cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.bounds];
    cell.selectedBackgroundView.backgroundColor = [UIColor greenColor];
    cell.imageView.image = [UIImage imageNamed:@"0.JPG"];
//    返回单元格
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    UICollectionReusableView *view = nil;
    if (kind == UICollectionElementKindSectionHeader) {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Header" forIndexPath:indexPath];
        view.backgroundColor = [UIColor purpleColor];
    }else if (kind == UICollectionElementKindSectionFooter)
    {
        view = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"Footer" forIndexPath:indexPath];
        view.backgroundColor = [UIColor greenColor];
    }
    return view;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.collectionView registerClass:[QYCollectionViewCell class] forCellWithReuseIdentifier:@"QYCellID"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"Header"];
    
    [self.collectionView registerClass:[UICollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionFooter withReuseIdentifier:@"Footer"];
}


#pragma mark -
#pragma mark UICollectionViewDelegatFlowLayout

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1 && indexPath.item == 2) {
        return CGSizeMake(100, 200);
    }
    return CGSizeMake(50, 50);
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    return  CGSizeMake(320, 40);
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section
{
    return CGSizeMake(320, 30);
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

@end
