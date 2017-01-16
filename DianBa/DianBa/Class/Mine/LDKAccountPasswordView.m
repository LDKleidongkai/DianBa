//
//  LDKAccountPasswordView.m
//  LoginView
//
//  Created by Hunter on 2016/12/20.
//  Copyright © 2016年 Hunter. All rights reserved.
//

#import "LDKAccountPasswordView.h"
#import "NetworkRequest.h"

@implementation LDKAccountPasswordView

- (void)awakeFromNib{
    [super awakeFromNib];
    _selectButton.selected = NO;
    _accountNumberText.clearButtonMode = UITextFieldViewModeWhileEditing;
    _passwordText.clearButtonMode = UITextFieldViewModeWhileEditing;
    
}





//找回密码
- (IBAction)searchSecretButton:(id)sender {
    //跳转找回密码界面
}


//参数
- (NSDictionary *)parameters{
    if (!_parameters) {
        NSString *password = [NSString md5:_passwordText.text];
        _parameters = @{@"username":_accountNumberText.text,@"password":password};
    }
    return _parameters;
}
//登录
- (IBAction)loginButton:(id)sender {
    [NetworkRequest LogininfoRequestWithUrl:URL parameters:self.parameters Success:^(NSDictionary *success) {
        NSLog(@"responseObject = %@",success);
        if ([success[@"code"] isEqualToString:@"200"]) {
            NSLog(@"账户密码登录成功");
            
        }
    } Failure:^(id failure) {

    }];
}

//选中按钮的方法
- (IBAction)selectButton:(id)sender {
    _selectButton.selected = !_selectButton.selected;
}

@end
