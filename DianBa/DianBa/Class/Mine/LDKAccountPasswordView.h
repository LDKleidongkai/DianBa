//
//  LDKAccountPasswordView.h
//  LoginView
//
//  Created by Hunter on 2016/12/20.
//  Copyright © 2016年 Hunter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDKAccountPasswordView : UIView
@property (strong, nonatomic) NSDictionary *parameters;
//账号输入框
@property (weak, nonatomic) IBOutlet UITextField *accountNumberText;
//密码输入框
@property (weak, nonatomic) IBOutlet UITextField *passwordText;
//选中按钮
@property (weak, nonatomic) IBOutlet UIButton *selectButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;

@end
