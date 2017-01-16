//
//  AddressAdd.h
//  DianBa
//
//  Created by Hunter on 2017/1/11.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AddressAdd : UIView

/**
 姓名
 */
@property (weak, nonatomic) IBOutlet UITextField *Name;

/**
 电话
 */
@property (weak, nonatomic) IBOutlet UITextField *phoneNumber;

/**
 地址
 */
@property (weak, nonatomic) IBOutlet UITextView *Address;

/**
 男
 */
@property (weak, nonatomic) IBOutlet UIButton *manButton;


/**
 女
 */
@property (weak, nonatomic) IBOutlet UIButton *womanButton;

/**
 提交按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *commitButton;

@end
