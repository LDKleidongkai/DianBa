//
//  ShoppingCarListCell.h
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/13.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderMenu.h"
@class ShoppingCarListCell;
@protocol ShoppingCarDelegate <NSObject>

-(void)shopCartListCell:(ShoppingCarListCell *)Cell WithBtn:(UIButton *)btn;

@end

@interface ShoppingCarListCell : UITableViewCell

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIButton *cutBtn;
@property (strong, nonatomic) IBOutlet UILabel *numLabel;
@property (strong, nonatomic) IBOutlet UIButton *addBtn;

@property(nonatomic, strong) OrderMenu *model;

@property(nonatomic, assign) id <ShoppingCarDelegate>delegate;

@end
