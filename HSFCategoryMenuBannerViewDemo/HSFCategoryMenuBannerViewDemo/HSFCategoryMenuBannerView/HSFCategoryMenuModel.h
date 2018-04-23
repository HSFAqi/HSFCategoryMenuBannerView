//
//  HSFCategoryMenuModel.h
//  HSFCategoryMenuDemo
//
//  Created by 黄山锋 on 2018/4/23.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import <Foundation/Foundation.h>

/* 4 X 2 */
#define HSFCategoryMenuView_line 4.0
#define HSFCategoryMenuView_row 2.0

@interface HSFCategoryMenuModel : NSObject

//需要使用网络图片的话自己添加吧--
@property (nonatomic,strong) NSString *imageName;
@property (nonatomic,strong) NSString *title;


+(instancetype)modelWithImageName:(NSString *)imageName title:(NSString *)title;

@end
