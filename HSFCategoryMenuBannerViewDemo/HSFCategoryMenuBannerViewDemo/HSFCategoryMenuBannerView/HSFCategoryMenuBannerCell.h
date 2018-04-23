//
//  HSFCategoryMenuBannerCell.h
//  HSFCategoryMenuDemo
//
//  Created by 黄山锋 on 2018/4/23.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface HSFCategoryMenuBannerCell : UICollectionViewCell
//数据源
@property (nonatomic,strong) NSMutableArray *source_category;
@property (nonatomic, copy) void (^HSFCategoryMenuBannerCellClickBlock)(NSInteger row);

//刷新
-(void)reloadData;

@end
