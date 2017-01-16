//
//  AddressTableViewCell.h
//  DianBa
//
//  Created by Hunter on 2017/1/11.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SelectResultData.h"

@interface AddressTableViewCell : UITableViewCell

/**
 名字
 */
@property (weak, nonatomic) IBOutlet UILabel *Name;

/**
 性别
 */
@property (weak, nonatomic) IBOutlet UILabel *Sex;

/**
 联系电话
 */
@property (weak, nonatomic) IBOutlet UILabel *phoneNumber;

/**
 收货地址
 */
@property (weak, nonatomic) IBOutlet UILabel *Adress;

/**
 选中小按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *selectButton;

/**
 默认地址label
 */
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *tacitlyAddress;

/**
 编辑地址按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *Edit;

/**
 删除地址按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *Delete;

@property (nonatomic, strong) SelectResultData *selectData;
@end
