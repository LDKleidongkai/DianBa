//
//  OnceView.h
//  DianBa
//
//  Created by Hunter on 2017/1/5.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OnceView : UIView


/**
 图片
 */
@property (weak, nonatomic) IBOutlet UIImageView *myImage;

/**
 商家接单状态
 */
@property (weak, nonatomic) IBOutlet UILabel *OrderState;

/**
 配送状态
 */
@property (weak, nonatomic) IBOutlet UILabel *DowryState;
@end
