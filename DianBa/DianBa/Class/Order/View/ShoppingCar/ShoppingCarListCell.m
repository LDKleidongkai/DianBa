//
//  ShoppingCarListCell.m
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/13.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "ShoppingCarListCell.h"

@implementation ShoppingCarListCell

- (IBAction)shopCartClick:(UIButton *)btn{
    if ([self.delegate respondsToSelector:@selector(shopCartListCell:WithBtn:)]) {
        [self.delegate shopCartListCell:self WithBtn:btn];
    }
}

-(void)setModel:(OrderMenu *)model
{
    if (_model != model) {
        _model = model;
    }
    self.titleLabel.text = model.menu_name;
    NSMutableAttributedString * noteStr = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"￥%@",model.menu_price]];
    NSRange redRangeTwo = NSMakeRange([[noteStr string] rangeOfString:@"￥"].location, [[noteStr string] rangeOfString:@"￥"].length);
    [noteStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12] range:redRangeTwo];
    [self.priceLabel setAttributedText:noteStr];
    [self.priceLabel sizeToFit];
    _numLabel.text = model.number;
    
}

@end
