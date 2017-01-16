//
//  LDKMobileNumberView.h
//  LoginView
//
//  Created by Hunter on 2016/12/20.
//  Copyright © 2016年 Hunter. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LDKMobileNumberView : UIView

//账号输入框
@property (weak, nonatomic) IBOutlet UITextField *phoneNumberText;
//验证码输入框
@property (weak, nonatomic) IBOutlet UITextField *yanZhengText;
//获取验证码按钮
@property (weak, nonatomic) IBOutlet UIButton *ObtainMessageButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (strong, nonatomic) NSDictionary *phoneCode;
@property (nonatomic, strong) NSDictionary *phoneParams;


@end
