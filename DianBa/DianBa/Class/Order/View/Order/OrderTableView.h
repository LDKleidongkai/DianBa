//
//  OrderTableView.h
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderTableView : UIView

@property (nonatomic, strong) UITableView *ordertable;
@property (nonatomic, strong) UITableView *hotPotTable;
@property (nonatomic, strong) UIButton *rowingBtn;
@property (nonatomic, strong) UIButton *returnBtn;
@property (nonatomic, strong) UIButton *collectionBtn;
@property (nonatomic, strong) UIView *navigationView;
@property (nonatomic, strong) UIButton *nReturnBtn;
@property (nonatomic, strong) UIButton *nCollectionBtn;
@property (nonatomic, strong) UILabel *titleLabel;
/*-------------------  购物车  -----------------------*/
@property (nonatomic, strong) UIView *carView;
@property (nonatomic, strong) UIButton *carBtn;
@property (nonatomic, strong) UILabel *badgeLabel;
@property (nonatomic, strong) UILabel *rMBLabel;
@property (nonatomic, strong) UILabel *priceLabel;
@property (nonatomic, strong) UIButton *balanceBtn;

@end
