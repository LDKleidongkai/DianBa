//
//  MineViewController.m
//  DianBa
//
//  Created by Hunter on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "MineViewController.h"
#import "MyWalletViewController.h"
#import "DiscountCouponViewController.h"
#import "PersonalInformationViewController.h"
#import "IntegralViewController.h"
#import "FeedBackViewController.h"
#import "LeagueViewController.h"
#import "AboutViewController.h"
#import "SiteViewController.h"
#import "LDKMineView.h"
#import "LDKLogingViewController.h"

@interface MineViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *dataSource;
}
@property (nonatomic, strong) LDKMineView *mineView;
@end

@implementation MineViewController


- (void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = YES;
    
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"UserId"];
    NSString *str =[dic objectForKey:@"user_id"];
    NSLog(@"lllllll%@",str);
    
    if (str == nil) {
        [_mineView.HeaderImage setImage:[UIImage imageNamed:@"kkkkkkkk"] forState:UIControlStateNormal];
        _mineView.UserName.text =@"马薇薇";
    }else{
        
        NSString *str =[NSString stringWithFormat:@"%@",[dic objectForKey:@"photo"]];
        [_mineView.HeaderImage setImage:[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:str]]] forState:UIControlStateNormal];
        NSLog(@"-=========%@",[dic objectForKey:@"photo"]);
        _mineView.UserName.text =[dic objectForKey:@"username"];
        
    }
    
}
- (void)viewWillDisappear:(BOOL)animated{
    self.navigationController.navigationBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:252/255.0 green:174/255.0 blue:21/255.0 alpha:1.00];
    
    self.myTableView.contentInset =UIEdgeInsetsMake(-30, 0, 0, 0);
    dataSource = @[@[@"我的积分",@"我的收货地址"],@[@"加盟合作",@"关于我们",@"意见反馈"]];
    [self.view addSubview:self.myTableView];
    self.myTableView.tableHeaderView = self.mineView;
    self.mineView.sd_layout.topSpaceToView(self.view,0).leftSpaceToView(self.view,0).rightSpaceToView(self.view,0);
}


- (LDKMineView *)mineView{
    if (!_mineView) {
        _mineView =[[[NSBundle mainBundle] loadNibNamed:@"LDKMineView" owner:self options:nil] lastObject];
        
        [_mineView.HeaderImage addTarget:self action:@selector(PersonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_mineView.WalletButton addTarget:self action:@selector(walletButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        [_mineView.FavorableButton addTarget:self action:@selector(favorableButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _mineView;
}
//我的钱包
- (void)walletButtonClick:(UIButton *)but{
    MyWalletViewController *wall =[[MyWalletViewController alloc] init];
    [self.navigationController pushViewController:wall animated:YES];
}
//我的优惠券
- (void)favorableButtonClick:(UIButton *)but{
    DiscountCouponViewController * discount =[[DiscountCouponViewController alloc] init];
    [self.navigationController pushViewController:discount animated:YES];
}


- (void)PersonClick:(UIButton *)but{
    NSUserDefaults * _defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *_dic = [_defaults objectForKey:@"UserId"];
    NSString *_date =[_dic objectForKey:@"user_id"];
    if (_date == nil) {
        //没有的话进入登录页面
        LDKLogingViewController *login =[[LDKLogingViewController alloc] init];
        [self.navigationController pushViewController:login animated:YES];
    }else{
        PersonalInformationViewController * per = [[PersonalInformationViewController alloc] init];
        [self.navigationController pushViewController:per animated:YES];
    }
   
}

//
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        _myTableView.delegate =self;
        _myTableView.dataSource =self;
    }
    return _myTableView;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return dataSource.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [dataSource[section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifly =@"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifly];
    if (!cell) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifly];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.textLabel.text = dataSource[indexPath.section][indexPath.row];
    cell.textLabel.textColor =[GVColor hexStringToColor:@"#333333"];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 43;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    NSUserDefaults * _defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *_dic = [_defaults objectForKey:@"UserId"];
    NSString *_date =[_dic objectForKey:@"user_id"];
    
    //判断是否有user_id
    if (_date == nil) {
        //没有的话进入登录页面
        LDKLogingViewController *login =[[LDKLogingViewController alloc] init];
        [self.navigationController pushViewController:login animated:YES];
    }else{
        //有user_id正常跳转
        if (indexPath.section == 0) {
            if (indexPath.row == 0) {
                //我的积分
                IntegralViewController *inter =[[IntegralViewController alloc] init];
                [self.navigationController pushViewController:inter animated:YES];
            }else{
                //我的收货地址
                SiteViewController *site =[[SiteViewController alloc] init];
                [self.navigationController pushViewController:site animated:YES];
            }
        }else if (indexPath.section == 1){
            if (indexPath.row == 0) {
                //加盟合作
                LeagueViewController *legue =[[LeagueViewController alloc] init];
                [self.navigationController pushViewController:legue animated:YES];
            }else if (indexPath.row == 1){
                //关于我们
                AboutViewController *about =[[AboutViewController alloc] init];
                [self.navigationController pushViewController:about animated:YES];
            }else{
                //意见反馈
                FeedBackViewController *feedBack =[[FeedBackViewController alloc] init];
                [self.navigationController pushViewController:feedBack animated:YES];
            }
        }else{
            // nil
        }
    }
    
    
}
@end
