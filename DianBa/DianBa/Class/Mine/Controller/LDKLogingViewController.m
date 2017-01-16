//
//  LDKLogingViewController.m
//  LoginView
//
//  Created by Hunter on 2016/12/20.
//  Copyright © 2016年 Hunter. All rights reserved.
//

#import "LDKLogingViewController.h"
#import "LDKAccountPasswordView.h"
#import "LDKMobileNumberView.h"

#define LDKWIDTH [UIScreen mainScreen].bounds.size.width
#define LDKHEIGHT [UIScreen mainScreen].bounds.size.height

@interface LDKLogingViewController ()<UIScrollViewDelegate>{
    UILabel * label1;
    UILabel * label2;
}

@property (nonatomic, strong) UIScrollView *mainScrollView; /**<滚动scrollView*/
@property (nonatomic, strong) LDKAccountPasswordView * accountView; /**<账号密码登录页*/
@property (nonatomic, strong) LDKMobileNumberView *mobileView; /**<手机号登录页*/
@property (nonatomic, strong) UIButton * accountButton; /**<手机号按钮*/
@property (nonatomic, strong) UIButton * mobileButton; /**<账号按钮*/


@end

@implementation LDKLogingViewController



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    _mobileButton.selected = YES;
    label2.hidden = YES;
    _accountView.hidden = YES;
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO ;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"登录";
    //设置导航栏背景色和字体大小
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:22],NSForegroundColorAttributeName:[UIColor colorWithRed:0.20 green:0.20 blue:0.20 alpha:1.00]}];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:252/255.0 green:174/255.0 blue:21/255.0 alpha:1.00];
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    
    [self.view addSubview:self.accountButton];
    [self.view addSubview:self.mobileButton];
    
    [self.view addSubview:self.accountView];
    [self.view addSubview:self.mobileView];
    
    [self setLabel];
    
    self.navigationItem.title = @"添加地址";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"the-arrow-"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor colorWithRed:0.95 green:0.95 blue:0.95 alpha:1.00];
}
- (void)backClick:(UIButton *)but{
    [self.navigationController popViewControllerAnimated:YES];
}



/**
 按钮下部的标签
 */
-(void)setLabel{
    //计算按钮内容的长度
    NSDictionary *attrs = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:15]};
    CGSize size=[_accountButton.titleLabel.text sizeWithAttributes:attrs];
    //
    label2 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, size.width, 1)];
    label2.center = CGPointMake(self.accountButton.center.x, self.accountButton.center.y+20);
    label2.backgroundColor = [UIColor colorWithRed:0.98 green:0.76 blue:0.35 alpha:1.00];
    [self.view addSubview:label2];
    
    
    NSDictionary *attrss = @{NSFontAttributeName : [UIFont boldSystemFontOfSize:15]};
    CGSize sizee=[_mobileButton.titleLabel.text sizeWithAttributes:attrss];
    label1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, sizee.width, 1)];
    label1.center = CGPointMake(self.mobileButton.center.x, self.mobileButton.center.y+20);
    label1.backgroundColor = [UIColor colorWithRed:0.98 green:0.76 blue:0.35 alpha:1.00];
    [self.view addSubview:label1];
}



- (LDKAccountPasswordView *)accountView{
    if (!_accountView) {
        _accountView = [[[NSBundle mainBundle] loadNibNamed:@"LDKAccountPasswordView" owner:self options:nil] objectAtIndex:0];
        _accountView.frame = CGRectMake(0, 104, self.view.frame.size.width, 220);
        
    }
    return _accountView;
}
- (LDKMobileNumberView *)mobileView{
    if (!_mobileView) {
        _mobileView = [[[NSBundle mainBundle] loadNibNamed:@"LDKMobileNumberView" owner:self options:nil] objectAtIndex:0];
        _mobileView.frame = CGRectMake(0, 104, self.view.frame.size.width, 250);
    }
    return _mobileView;
}


/**
 账号密码登录
 */
-(UIButton *)accountButton{
    if (!_accountButton) {
        _accountButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _accountButton.frame = CGRectMake(LDKWIDTH/2, 64, LDKWIDTH/2, 40);
        [_accountButton setTitle:@"账户密码登录" forState:UIControlStateNormal];
        [_accountButton setTitleColor:[UIColor colorWithRed:0.44 green:0.44 blue:0.45 alpha:1.00] forState:UIControlStateNormal];
        _accountButton.backgroundColor = [UIColor whiteColor];
        [_accountButton setTitleColor:[UIColor colorWithRed:0.98 green:0.68 blue:0.00 alpha:1.00] forState:UIControlStateSelected];
        [_accountButton addTarget:self action:@selector(accountButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _accountButton;
}


/**
 账号密码登录的方法
 */
- (void)accountButtonClick:(UIButton *)btn{
    _accountButton.selected = YES;
    _mobileButton.selected = NO;
    
    _accountView.hidden = NO;
    label2.hidden = NO;
    label1.hidden = YES;
    _mobileView.hidden = YES;
}




/**
 手机验证码登录
 */
- (UIButton *)mobileButton{
    if (!_mobileButton){
        _mobileButton = [UIButton buttonWithType:UIButtonTypeCustom];
        _mobileButton.frame = CGRectMake(0, 64, LDKWIDTH/2, 40);
        [_mobileButton setTitle:@"手机号快捷登录" forState:UIControlStateNormal];
        [_mobileButton setTitleColor:[UIColor colorWithRed:0.44 green:0.44 blue:0.45 alpha:1.00] forState:UIControlStateNormal];
        _mobileButton.backgroundColor = [UIColor whiteColor];
        [_mobileButton setTitleColor:[UIColor colorWithRed:0.98 green:0.68 blue:0.00 alpha:1.00] forState:UIControlStateSelected];
        [_mobileButton addTarget:self action:@selector(mobileButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mobileButton;
}

/**
 验证码登录的方法
 */
- (void)mobileButtonClick:(UIButton *)btn{
    _accountButton.selected = NO;
    _mobileButton.selected = YES;
    _accountView.hidden = YES;
    label2.hidden = YES;
    label1.hidden = NO;
    _mobileView.hidden = NO;
}
@end
