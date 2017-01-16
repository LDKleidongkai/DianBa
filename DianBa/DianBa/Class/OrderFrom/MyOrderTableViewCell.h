//
//  MyOrderTableViewCell.h
//  DianBa
//
//  Created by Hunter on 2017/1/5.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyOrderTableViewCell : UITableViewCell


/**
 菜名
 */
@property (weak, nonatomic) IBOutlet UILabel *VegetableName;

/**
 点菜数量
 */
@property (weak, nonatomic) IBOutlet UILabel *VegetableNumber;

/**
 菜品价格
 */
@property (weak, nonatomic) IBOutlet UILabel *VegetablePrice;


@end
