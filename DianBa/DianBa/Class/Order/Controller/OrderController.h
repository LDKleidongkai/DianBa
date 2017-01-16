//
//  OrderController.h
//  DianBa
//
//  Created by 王辰鹭 on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Order.h"

@interface OrderController : UIViewController

{
    RKNotificationHub *hub;
    ShoppingCarListCell *shopCell;
}
/** 门店菜品数组 */
@property (nonatomic, strong) NSMutableArray *storesArr;
@property (nonatomic, strong) OrderResult *result;
@property (nonatomic, strong) OrderTableView *orderView;
@property (nonatomic, strong) OrderHeaderView *headerView;
@property (nonatomic , assign) BOOL isHiddenHot;
@property (nonatomic, strong) MaskView *maskView;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
/** 菜品属性数组 */
@property (nonatomic, strong) NSArray *typeArr;
@property (nonatomic, strong) MenuHeaderView *hotHeaderV;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableDictionary *dataDic;
@property (nonatomic,strong)UITableView *shopCartTableView;
@property (nonatomic, strong) UIView *views;
@property (nonatomic, strong) NSMutableArray *orderArray;
@property (nonatomic, strong) NSMutableArray *shopArr;
@property (nonatomic, strong) ShoppingCarHeader *carHeader;
@property (nonatomic, strong) ShoppingCarFooterView *carFooter;

@end
