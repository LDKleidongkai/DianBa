//
//  AllTableViewCell.h
//  DianBa
//
//  Created by Hunter on 2017/1/4.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDKAllTableViewCell : UITableViewCell

/**
 订单号
 */
@property (weak, nonatomic) IBOutlet UILabel *OrderNumber;

/**
 订单状态
 */
@property (weak, nonatomic) IBOutlet UIButton *OrderTips;

/**
 订单图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *OrderImage;


/**
 饭店名称
 */
@property (weak, nonatomic) IBOutlet UILabel *RestaurantName;

/**
 外卖或堂食
 */
@property (weak, nonatomic) IBOutlet UILabel *TakeOrHall;

/**
 订单渠道
 */
@property (weak, nonatomic) IBOutlet UILabel *OrderDitch;

/**
 订单日期
 */
@property (weak, nonatomic) IBOutlet UILabel *DateLabel;

/**
 订单时间
 */
@property (weak, nonatomic) IBOutlet UILabel *TimeLabel;

/**
 订单追踪
 */
@property (weak, nonatomic) IBOutlet UIButton *TailAfter;

/**
 订单价格
 */
@property (weak, nonatomic) IBOutlet UILabel *Money;

@end
