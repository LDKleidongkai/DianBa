//
//  GoodsListCell.h
//  美食外卖菜单
//
//  Created by 王辰鹭 on 2017/1/7.
//  Copyright © 2017年 LittleX. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderMenu.h"

typedef void(^clickCar)(UIImageView *dropImage);

@class GoodsListCell;

@protocol GoodsListCellDelegate <NSObject>

-(void)goodlistNumDelegate:(GoodsListCell *)cell WithBtn:(UIButton *)btn;

@end

@interface GoodsListCell : UITableViewCell

/** 菜品图片 */
@property (strong, nonatomic) IBOutlet UIImageView *goodImgV;
/** 菜名 */
@property (strong, nonatomic) IBOutlet UILabel *nameLabel;
/** 月销售额 */
@property (strong, nonatomic) IBOutlet UILabel *salesLabel;
/** 好评率 */
@property (strong, nonatomic) IBOutlet UILabel *praiseLabel;
/** 价格 */
@property (strong, nonatomic) IBOutlet UILabel *priceLabel;
/** 数量 */
@property (strong, nonatomic) IBOutlet UILabel *numLabel;
@property (strong, nonatomic) IBOutlet UIButton *addGoodBtn;
@property (strong, nonatomic) IBOutlet UIButton *cutGoodBtn;
@property (strong, nonatomic) IBOutlet UIImageView *addImage;
@property  (nonatomic, strong) clickCar clickCars;
@property(nonatomic,assign)id<GoodsListCellDelegate>delegate;
@property(nonatomic,strong) OrderMenu *model;

@end
