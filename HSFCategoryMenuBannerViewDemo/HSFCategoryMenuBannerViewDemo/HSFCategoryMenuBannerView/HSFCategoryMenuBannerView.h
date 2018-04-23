//
//  HSFCategoryMenuBannerView.h
//  HSFCategoryMenuDemo
//
//  Created by 黄山锋 on 2018/4/23.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HSFCategoryMenuBannerView;
@protocol HSFCategoryMenuBannerViewDelegate <NSObject>
@optional
-(void)categoryMenuBannerView:(HSFCategoryMenuBannerView *)categoryMenuBannerView didClickItemAtIndex:(NSInteger)index;
@end

@interface HSFCategoryMenuBannerView : UIView
/* 代理 */
@property (nonatomic,weak) id<HSFCategoryMenuBannerViewDelegate> delegate;
/* 数据源 */
@property (nonatomic, strong) NSArray *datas;

/* 刷新 */
-(void)reloadData;

@end
