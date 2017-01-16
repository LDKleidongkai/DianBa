//
//  ShoppingCarHeader.m
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/13.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "ShoppingCarHeader.h"

@implementation ShoppingCarHeader

- (void)awakeFromNib{
    [super awakeFromNib];
    _bagdeValueLabel.layer.masksToBounds = YES;
    _bagdeValueLabel.layer.cornerRadius = 6.5;
}

@end
