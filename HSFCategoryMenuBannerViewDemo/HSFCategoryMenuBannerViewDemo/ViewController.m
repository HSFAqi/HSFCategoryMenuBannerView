//
//  ViewController.m
//  HSFCategoryMenuBannerViewDemo
//
//  Created by 黄山锋 on 2018/4/23.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "ViewController.h"


//model
#import "HSFCategoryMenuModel.h"

//view
#import "HSFCategoryMenuBannerView.h"

@interface ViewController ()<HSFCategoryMenuBannerViewDelegate>

@property (nonatomic,strong) HSFCategoryMenuBannerView *categoryMenuBannerView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"分类轮播";
    
    NSArray *imageArr = @[@"打卡补签", @"待办事项", @"电脑故障", @"电脑申请", @"付款申请", @"工牌", @"会议记录", @"绩效评估", @"交通报销", @"离职交接", @"人事申请", @"物品申请", @"新闻动态", @"休假申请"];
    NSArray *titleArr = @[@"打卡补签", @"待办事项", @"电脑故障", @"电脑申请", @"付款申请", @"工牌", @"会议记录", @"绩效评估", @"交通报销", @"离职交接", @"人事申请", @"物品申请", @"新闻动态", @"休假申请"];
    NSMutableArray *modelArr = [NSMutableArray array];
    for (int i = 0; i < imageArr.count; i++) {
        HSFCategoryMenuModel *model = [HSFCategoryMenuModel modelWithImageName:imageArr[i] title:titleArr[i]];
        [modelArr addObject:model];
    }
    
    self.categoryMenuBannerView = [[HSFCategoryMenuBannerView alloc]initWithFrame:CGRectMake(0, 100, self.view.frame.size.width, self.view.frame.size.width*(3.00/5.00))];
    self.categoryMenuBannerView.backgroundColor = [UIColor cyanColor];
    self.categoryMenuBannerView.datas = modelArr;
    self.categoryMenuBannerView.delegate = self;
    [self.categoryMenuBannerView reloadData];
    [self.view addSubview:self.categoryMenuBannerView];
    
    
}

#pragma mark HSFCategoryMenuBannerViewDelegate
-(void)categoryMenuBannerView:(HSFCategoryMenuBannerView *)categoryMenuBannerView didClickItemAtIndex:(NSInteger)index{
    NSLog(@"didClickItemAtIndex======%ld",index);
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
