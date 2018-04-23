//
//  HSFCategoryMenuBannerCell.m
//  HSFCategoryMenuDemo
//
//  Created by 黄山锋 on 2018/4/23.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFCategoryMenuBannerCell.h"


//model
#import "HSFCategoryMenuModel.h"
//cell
#import "HSFCategoryMenuCell.h"

@interface HSFCategoryMenuBannerCell ()<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout>

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end


@implementation HSFCategoryMenuBannerCell

- (void)awakeFromNib {
    [super awakeFromNib];
    
    //配置collectionView
    [self setUpCollectionView];
}




//配置collectionView
-(void)setUpCollectionView{
    self.collectionView.backgroundColor = [UIColor clearColor];
    //    self.collectionView.pagingEnabled = YES;
    //代理设置
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
    //注册item header footer
    [self.collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([HSFCategoryMenuCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([HSFCategoryMenuCell class])];
}


#pragma mark -<UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout
//item的大小
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(self.frame.size.width/HSFCategoryMenuView_line, self.frame.size.height/HSFCategoryMenuView_row-10);
}
//配置item的边距
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    return UIEdgeInsetsMake(0, 0, 0, 0);
}
//最小行间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//最小列间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 0;
}
//组数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}
//行数
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.source_category.count;
}
//行内容
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    HSFCategoryMenuCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HSFCategoryMenuCell class]) forIndexPath:indexPath];
    HSFCategoryMenuModel *model = self.source_category[indexPath.row];
    cell.model = model;
    return cell;
}

#pragma mark -点击事件
//点击item
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    [collectionView deselectItemAtIndexPath:indexPath animated:YES];
    if (self.HSFCategoryMenuBannerCellClickBlock) {
        self.HSFCategoryMenuBannerCellClickBlock(indexPath.row);
    }
}
//刷新
-(void)reloadData{
    [self.collectionView reloadData];
}


#pragma mark 懒加载
-(NSMutableArray *)source_category{
    if (!_source_category) {
        _source_category = [NSMutableArray array];
    }
    return _source_category;
}



@end
