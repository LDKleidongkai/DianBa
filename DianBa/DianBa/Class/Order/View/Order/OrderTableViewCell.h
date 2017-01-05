//
//  OrderTableViewCell.h
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/30.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderMenu.h"

typedef void(^number)(NSInteger number);
typedef void(^clickCar)(UIImageView *dropImage);

// 加减
typedef void(^subBlock)();
typedef void(^addBlock)();

@interface OrderTableViewCell : UITableViewCell

/** 菜品图片 */
@property (strong, nonatomic) IBOutlet UIImageView *shopImg;
/** 菜名 */
@property (strong, nonatomic) IBOutlet UILabel *dishesName;
/** 月销售额 */
@property (strong, nonatomic) IBOutlet UILabel *salesLabel;
/** 好评率 */
@property (strong, nonatomic) IBOutlet UILabel *praiseLabel;
/** 价格 */
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
@property (strong, nonatomic) IBOutlet UIButton *addBtn;
@property (strong, nonatomic) IBOutlet UIButton *subtractBtn;
@property (strong, nonatomic) IBOutlet UILabel *numLabel;
@property (nonatomic, strong) OrderMenu *menu;
/*------------------- 购物车 ----------------*/
@property (strong, nonatomic) IBOutlet UIImageView *dropImageView;
@property  (nonatomic, strong) clickCar clickCars;
@property (nonatomic, strong) number number; // 传值
@property (nonatomic, copy) subBlock subBlock; // 减
@property (nonatomic, copy) addBlock addBlock; // 加

@end
