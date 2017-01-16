//
//  GoodsListCell.m
//  美食外卖菜单
//
//  Created by 王辰鹭 on 2017/1/7.
//  Copyright © 2017年 LittleX. All rights reserved.
//

#import "GoodsListCell.h"

@implementation GoodsListCell

- (void)awakeFromNib{
    [super awakeFromNib];
    [_addGoodBtn addTarget:self action:@selector(goodNumWithClick:) forControlEvents:UIControlEventTouchUpInside];
    [_cutGoodBtn addTarget:self action:@selector(goodNumWithClick:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)goodNumWithClick:(UIButton *)btn{
    
    if (btn.tag == 1002) {
        if (_clickCars) {
            _clickCars(_addImage);
        }
    }
    
    if ([self.delegate respondsToSelector:@selector(goodlistNumDelegate:WithBtn:)]) {
        [self.delegate goodlistNumDelegate:self WithBtn:btn];
    }
    
}

-(void)setModel:(OrderMenu *)model
{
    if (_model != model) {
        _model = model;
    }
    [self.goodImgV sd_setImageWithURL:[NSURL URLWithString:model.photo] placeholderImage:[UIImage imageNamed:@"图片预加载"]];
    self.nameLabel.text = model.menu_name;
    self.priceLabel.text = [NSString stringWithFormat:@"%@/份",model.menu_price];
    self.numLabel.text = model.number;
    if (model.number.intValue <= 0) {
        self.cutGoodBtn.hidden = YES;
        self.numLabel.hidden = YES;
    }else{
        self.cutGoodBtn.hidden = NO;
        self.numLabel.hidden = NO;
    }
}

@end
