//
//  HSFCategoryMenuModel.m
//  HSFCategoryMenuDemo
//
//  Created by 黄山锋 on 2018/4/23.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFCategoryMenuModel.h"

@implementation HSFCategoryMenuModel

+(instancetype)modelWithImageName:(NSString *)imageName title:(NSString *)title{
    HSFCategoryMenuModel *model = [[HSFCategoryMenuModel alloc]init];
    model.imageName = imageName;
    model.title = title;
    return model;
}

@end
