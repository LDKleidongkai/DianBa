//
//  LDKMobileNumberView.m
//  LoginView
//
//  Created by Hunter on 2016/12/20.1
//  Copyright © 2016年 Hunter. All rights reserved.
//

#import "LDKMobileNumberView.h"
#import "NetworkRequest.h"

@implementation LDKMobileNumberView


- (void)awakeFromNib{
    [super awakeFromNib];
    _ObtainMessageButton.layer.borderColor = [[UIColor colorWithRed:0.89 green:0.63 blue:0.00 alpha:1.00] CGColor];
    _phoneNumberText.clearButtonMode = UITextFieldViewModeWhileEditing;
    _yanZhengText.clearButtonMode = UITextFieldViewModeWhileEditing;
}



- (NSDictionary *)phoneCode{
    if (!_phoneCode) {
        _phoneCode = @{@"tel":self.phoneNumberText.text};
    }
    return _phoneCode;
}

- (NSDictionary *)phoneParams{
    if (!_phoneParams) {
        _phoneParams =@{@"tel":self.phoneNumberText.text};
    }
    return _phoneParams;
}
//获取验证码
- (IBAction)obtainMessageButton:(UIButton *)sender {
    sender.enabled = NO;
    __block NSInteger i = 60;
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1 repeats:YES block:^(NSTimer * _Nonnull timer) {
        i--;
        [sender setTitle:[NSString stringWithFormat:@"%lds重新发送",i] forState:UIControlStateNormal];
        if (i == 0) {
            [timer setFireDate:[NSDate distantFuture]];
            [sender setTitle:@"发送验证码" forState:UIControlStateNormal];
            sender.enabled = YES;
        }
    }];
    [timer fire];
    
    
    [NetworkRequest requestForPhoneCodeURL:PhoneCode parameters:@{@"tel":self.phoneNumberText.text} Success:^(NSDictionary *success) {
        NSLog(@"$%@",success[@"message"]);
    } Failure:^(id failure) {
        NSLog(@"$%@",failure);
    }];
}

//协议按钮
- (IBAction)agreementButton:(id)sender {
    
}

- (UINavigationController *)NaViewController {
    //取出根视图控制器
    UITabBarController *tabBarVc = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    //取出当前选中的导航控制器
    UINavigationController *Nav = [tabBarVc selectedViewController];
    return Nav;
    
}

- (IBAction)loginButton:(id)sender {
    NSDictionary *parameters = @{@"contact_tel":self.phoneNumberText.text,@"sendCode":self.yanZhengText.text};
    
    [NetworkRequest requestForPhoneCodeURL:JUDGECODE parameters:parameters Success:^(id success) {
        NSLog(@"%@",success);
        
        if ([success[@"code"] isEqualToString:@"200"]) {
            [NetworkRequest requestForPhoneCodeURL:PHONEURL parameters:self.phoneParams Success:^(id success) {
                
                
                //存储
                NSDictionary *data =success;
                NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
                NSLog(@"adate:%@",data);
                [defaults setObject:data forKey:@"UserId"];
                [defaults synchronize];  //缺少了，存不进去的
                
            } Failure:^(id failure) {
                
            }];
        }
        
    } Failure:^(id failure) {
        NSLog(@"%@",failure);
    }];

    [[self NaViewController] popViewControllerAnimated:YES];
    
}



@end
