//
//  VegetablesJudgecellCell.m
//  DianBa
//
//  Created by Hunter on 2017/1/6.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "VegetablesJudgecellCell.h"

@implementation VegetablesJudgecellCell

- (void)awakeFromNib {
    [super awakeFromNib];

    [self.myButtonOne addTarget:self action:@selector(myButtonClickOne:) forControlEvents:UIControlEventTouchUpInside];
    [self.myButtonTwo addTarget:self action:@selector(myButtonClickTwo:) forControlEvents:UIControlEventTouchUpInside];
    self.myButtonTwo.transform=CGAffineTransformMakeRotation(M_PI);
}

- (void)myButtonClickOne:(UIButton *)but{
    self.myButtonOne.selected =!self.myButtonOne.selected;
}
- (void)myButtonClickTwo:(UIButton *)but{
    self.myButtonTwo.selected =!self.myButtonTwo.selected;
}

@end
