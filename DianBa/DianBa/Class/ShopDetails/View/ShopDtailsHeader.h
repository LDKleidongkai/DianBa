//
//  ShopDtailsHeader.h
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SDCycleScrollView.h"
#import "ShopDetailsResult.h"

@interface ShopDtailsHeader : UIView

@property (nonatomic, strong) SDCycleScrollView *headerScroll;

@property (nonatomic, strong) ShopDetailsResult *result;;

@end
