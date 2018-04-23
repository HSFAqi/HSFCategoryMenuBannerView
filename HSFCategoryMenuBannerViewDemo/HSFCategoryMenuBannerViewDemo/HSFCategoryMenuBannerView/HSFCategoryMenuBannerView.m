//
//  HSFCategoryMenuBannerView.m
//  HSFCategoryMenuDemo
//
//  Created by 黄山锋 on 2018/4/23.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFCategoryMenuBannerView.h"

#import "TYCyclePagerView.h"
#import "TYPageControl.h"
//cell
#import "HSFCategoryMenuBannerCell.h"
//model
#import "HSFCategoryMenuModel.h"


@interface HSFCategoryMenuBannerView () <TYCyclePagerViewDataSource, TYCyclePagerViewDelegate>

@property (nonatomic, strong) TYCyclePagerView *pagerView;
@property (nonatomic, strong) TYPageControl *pageControl;


@end

@implementation HSFCategoryMenuBannerView

/* 初始化方法 */
-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        /* 配置pageView */
        [self addPagerView];
        /* 配置pageControl */
        [self addPageControl];
    }
    return self;
}

/* 配置pageView */
- (void)addPagerView {
    TYCyclePagerView *pagerView = [[TYCyclePagerView alloc]init];
//    pagerView.isInfiniteLoop = YES;
//    pagerView.autoScrollInterval = 3.0;
    pagerView.dataSource = self;
    pagerView.delegate = self;
    // registerClass or registerNib
    [pagerView registerNib:[UINib nibWithNibName:NSStringFromClass([HSFCategoryMenuBannerCell class]) bundle:nil] forCellWithReuseIdentifier:NSStringFromClass([HSFCategoryMenuBannerCell class])];
    [self addSubview:pagerView];
    self.pagerView = pagerView;
    self.pagerView.frame = CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame));
    
}
/* 配置pageControl */
- (void)addPageControl {
    TYPageControl *pageControl = [[TYPageControl alloc]init];
    //pageControl.numberOfPages = _datas.count;
    pageControl.currentPageIndicatorSize = CGSizeMake(8, 8);
    pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    pageControl.currentPageIndicatorTintColor = [UIColor redColor];
    pageControl.contentInset = UIEdgeInsetsMake(0, 20, 0, 20);
    pageControl.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    pageControl.contentVerticalAlignment = UIControlContentVerticalAlignmentBottom;
//    [pageControl addTarget:self action:@selector(pageControlValueChangeAction:) forControlEvents:UIControlEventValueChanged];
    [self.pagerView addSubview:pageControl];
    self.pageControl = pageControl;
    self.pageControl.frame = CGRectMake(0, CGRectGetHeight(self.pagerView.frame) - 26, CGRectGetWidth(self.pagerView.frame), 26);
}

/* 刷新 */
-(void)reloadData{
    [self.pagerView reloadData];
}


#pragma mark - TYCyclePagerViewDataSource
- (NSInteger)numberOfItemsInPagerView:(TYCyclePagerView *)pageView {
    int pageNum = HSFCategoryMenuView_line * HSFCategoryMenuView_row;
    NSInteger last = self.datas.count%pageNum;
    NSInteger items = 0;
    if (last == 0) {
        items = self.datas.count/pageNum;
    }else{
        items = self.datas.count/pageNum + 1;
    }
    self.pageControl.numberOfPages = items;
    return items;
}
- (UICollectionViewCell *)pagerView:(TYCyclePagerView *)pagerView cellForItemAtIndex:(NSInteger)index {
    HSFCategoryMenuBannerCell *cell = [pagerView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([HSFCategoryMenuBannerCell class]) forIndex:index];
    int pageNum = HSFCategoryMenuView_line * HSFCategoryMenuView_row;
    NSRange range;
    if (pageNum*(index+1) <= self.datas.count) {
        range = NSMakeRange(pageNum*index, pageNum);
    }else{
        NSInteger last = self.datas.count - pageNum*index;
        range = NSMakeRange(pageNum*index, last);
    }
    NSArray *subArr = [self.datas subarrayWithRange:range];
    cell.source_category = subArr.mutableCopy;
    [cell reloadData];
    
    //点击cell里的item
    __weak typeof(self) weakSelf = self;
    __block NSInteger weakIndex = index;
    __block int weakPageNum = pageNum;
    [cell setHSFCategoryMenuBannerCellClickBlock:^(NSInteger row) {
        NSInteger indexOfItem = row + weakIndex*weakPageNum;
        if ([weakSelf.delegate respondsToSelector:@selector(categoryMenuBannerView:didClickItemAtIndex:)]) {
            [weakSelf.delegate categoryMenuBannerView:self didClickItemAtIndex:indexOfItem];
        }
    }];
    
    
    return cell;
}
- (TYCyclePagerViewLayout *)layoutForPagerView:(TYCyclePagerView *)pageView {
    TYCyclePagerViewLayout *layout = [[TYCyclePagerViewLayout alloc]init];
    layout.itemSize = CGSizeMake(CGRectGetWidth(pageView.frame), CGRectGetHeight(pageView.frame));
    layout.itemSpacing = 0;
    layout.itemHorizontalCenter = YES;
    return layout;
}
- (void)pagerView:(TYCyclePagerView *)pageView didScrollFromIndex:(NSInteger)fromIndex toIndex:(NSInteger)toIndex {
    self.pageControl.currentPage = toIndex;
}



@end
