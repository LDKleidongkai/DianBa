//
//  AllTableViewCell.m
//  DianBa
//
//  Created by Hunter on 2017/1/4.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "LDKAllTableViewCell.h"

@implementation LDKAllTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.TailAfter.layer.borderColor = [UIColor colorWithRed:0.36 green:0.36 blue:0.36 alpha:1.00].CGColor;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
