//
//  OrderTableViewCell.m
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/30.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "OrderTableViewCell.h"
#import "OrderTableView.h"

@implementation OrderTableViewCell

- (IBAction)addBtnClick:(id)sender {
    
    NSInteger number = [_numLabel.text intValue];
    number ++;
    _numLabel.text = [NSString stringWithFormat:@"%ld",number];
    
    if ([_numLabel.text intValue] > 0) {
        _subtractBtn.hidden = NO;
        _numLabel.hidden = NO;
    }else{
        _subtractBtn.hidden = YES;
        _numLabel.hidden = YES;
    }
    
    if (_clickCars) {
        _clickCars(_dropImageView);
    }
    
    if (_number) {
        _number(number);
    }
    
}

- (IBAction)subtractBtnClick:(id)sender {
    NSInteger number = [_numLabel.text intValue];
    number --;
    _numLabel.text = [NSString stringWithFormat:@"%ld",number];
    
    if ([_numLabel.text intValue] > 0) {
        _subtractBtn.hidden = NO;
        _numLabel.hidden = NO;
    }else{
        _subtractBtn.hidden = YES;
        _numLabel.hidden = YES;
    }
    
    if (_number) {
        _number(number);
    }
}

- (void)setMenu:(OrderMenu *)menu{
    _menu = menu;
    // 数据
    [self.shopImg sd_setImageWithURL:[NSURL URLWithString:menu.photo]];
    self.dishesName.text = menu.menu_name;
    self.salesLabel.text = [NSString stringWithFormat:@"月售%@份",menu.count_num];
    self.praiseLabel.text = [NSString stringWithFormat:@"好评率%@%%",menu.rated];
    self.priceLabel.text = menu.menu_price;
}

@end
