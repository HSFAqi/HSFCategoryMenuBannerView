//
//  HSFCategoryMenuCell.m
//  HSFCategoryMenuDemo
//
//  Created by 黄山锋 on 2018/4/23.
//  Copyright © 2018年 黄山锋. All rights reserved.
//

#import "HSFCategoryMenuCell.h"

//model
#import "HSFCategoryMenuModel.h"


@interface HSFCategoryMenuCell ()

@property (weak, nonatomic) IBOutlet UIImageView *icon;
@property (weak, nonatomic) IBOutlet UILabel *title;

@end

@implementation HSFCategoryMenuCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}


//赋值
-(void)setModel:(HSFCategoryMenuModel *)model{
    _model = model;
    
    self.icon.image = [UIImage imageNamed:model.imageName];
    self.title.text = model.title;
}



@end
