//
//  LDKMineView.m
//  DianBa
//
//  Created by Hunter on 2017/1/9.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "LDKMineView.h"

@implementation LDKMineView

- (void)awakeFromNib{
    [super awakeFromNib];

    [self.WalletButton setImage:[UIImage imageNamed:@"wallet"] forState:UIControlStateNormal];
    [self.WalletButton setTitle:@"我的钱包" forState:UIControlStateNormal];
    [self.WalletButton setTitleColor:[GVColor hexStringToColor:@"#888888"] forState:UIControlStateNormal];
    self.WalletButton.titleEdgeInsets = UIEdgeInsetsMake(35, -40, 0, 0);
    self.WalletButton.imageEdgeInsets = UIEdgeInsetsMake(-15, 57, 0, 0);
    
    [self.FavorableButton setImage:[UIImage imageNamed:@"discount"] forState:UIControlStateNormal];
    [self.FavorableButton setTitle:@"我的优惠券" forState:UIControlStateNormal];
    [self.FavorableButton setTitleColor:[GVColor hexStringToColor:@"#888888"] forState:UIControlStateNormal];
    self.FavorableButton.titleEdgeInsets = UIEdgeInsetsMake(35, -50, 0, 0);
    self.FavorableButton.imageEdgeInsets = UIEdgeInsetsMake(-15, 57, 0, 0);
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
