//
//  MyOrderViewController.m
//  DianBa
//
//  Created by Hunter on 2017/1/5.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "MyOrderViewController.h"
#import "OnceView.h"
#import "MyOrderTableViewCell.h"
#import "OrderAmountView.h"
#import "OrderDetailsView.h"
#import "DistributionMessageView.h"
#import "BottomButtonView.h"
#import "VegetablesHeaderView.h"
#import "OrderJudgeViewController.h"

@interface MyOrderViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *dataSource;
    //第一个分区
    OnceView *onceView;
    //第二个分区页脚
    OrderAmountView *orderAmountView;
    //订单详情
    OrderDetailsView *orderDetailsView;
    //配送信息
    DistributionMessageView *distributionMessageView;
    //第二个分区的头视图
    VegetablesHeaderView *vegeTableHeaderView;
}

/**
 底部的两个按钮View
 */
@property (nonatomic ,strong) BottomButtonView *bottomButtonView;

/**
 表格
 */
@property (nonatomic, strong) UITableView * myTabelView;
@end

@implementation MyOrderViewController

- (void)viewWillAppear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated{
    self.tabBarController.tabBar.hidden = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"我的订单";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"the-arrow-"] style:UIBarButtonItemStylePlain target:self action:@selector(backButton:)];
    dataSource =[NSMutableArray arrayWithObjects:@"酸菜排骨",@"红烧猪蹄",@"酸辣土豆丝",@"鸳鸯火锅", nil];
    [self.view addSubview:self.myTabelView];
    self.myTabelView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self bottomButtonView];
}

- (void)backButton:(UIButton *)but{
    
}

#pragma mark --myTabelView
- (UITableView *)myTabelView{
    if (!_myTabelView) {
        _myTabelView= [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStyleGrouped];
        _myTabelView.delegate =self;
        _myTabelView.dataSource =self;
    }
    return _myTabelView;
}

#pragma mark --UITableViewDelegate,UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 1) {
        return dataSource.count;
    }else{
        return 1;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
         return 63;
    }else if (indexPath.section == 2){
        return 136;
    }else if (indexPath.section == 3){
        return 158;
    }else {
        return 50;
    }
   
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //第一个分区
    if (indexPath.section == 0) {
        static NSString *identify =@"UITableViewCell";
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        onceView = [[[NSBundle mainBundle] loadNibNamed:@"OnceView" owner:self options:nil] lastObject];
        [cell.contentView addSubview:onceView];
        onceView.sd_layout.leftSpaceToView(cell.contentView,0).topSpaceToView(cell.contentView,0).rightSpaceToView(cell.contentView,0).bottomSpaceToView(cell.contentView,0);
        return cell;
    }//第二个分区
    else if (indexPath.section == 1){
        static NSString *indentify = @"indentify";
        MyOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentify];
        if (!cell) {
            cell = [[[NSBundle mainBundle] loadNibNamed:@"MyOrderTableViewCell" owner:self options:nil] lastObject];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        cell.VegetableName.text = dataSource[indexPath.row];
        return cell;
    }//第三个分区
    else if (indexPath.section == 2){
        static NSString *identify =@"UITableViewCell";
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        orderDetailsView = [[[NSBundle mainBundle] loadNibNamed:@"OrderDetailsView" owner:self options:nil] lastObject];
        [cell.contentView addSubview:orderDetailsView];
        orderDetailsView.sd_layout.leftSpaceToView(cell.contentView,0).topSpaceToView(cell.contentView,0).rightSpaceToView(cell.contentView,0).bottomSpaceToView(cell.contentView,0);
                return cell;
    }//第四个分区
    else{
        static NSString *identify =@"UITableViewCell";
        UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identify];
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identify];
            cell.selectionStyle = UITableViewCellSelectionStyleNone;
        }
        distributionMessageView =[[[NSBundle mainBundle] loadNibNamed:@"DistributionMessageView" owner:self options:nil] lastObject];
         [cell.contentView addSubview:distributionMessageView];
        distributionMessageView.sd_layout.leftSpaceToView(cell.contentView,0).topSpaceToView(cell.contentView,0).rightSpaceToView(cell.contentView,0).bottomSpaceToView(cell.contentView,0);
        return cell;
    }
 
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return 50;
    }else{
        return 0.1;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView * myView = [[UIView alloc] init];
    myView.backgroundColor = [UIColor whiteColor];
    vegeTableHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"VegetablesHeaderView" owner:self options:nil] lastObject];
    [myView addSubview:vegeTableHeaderView];
    vegeTableHeaderView.sd_layout.leftSpaceToView(myView,0).topSpaceToView(myView,0).rightSpaceToView(myView,0).bottomSpaceToView(myView,0);
    
    if (section == 1) {
        return myView;
        
    }else{
        return nil;
    }
}



- (BottomButtonView *)bottomButtonView{
    if (!_bottomButtonView) {
        _bottomButtonView = [[[NSBundle mainBundle] loadNibNamed:@"BottomButtonView" owner:self options:nil] lastObject];
        [self.view addSubview:_bottomButtonView];
        _bottomButtonView.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).bottomSpaceToView(self.view,0).heightIs(50);
        [_bottomButtonView.ToEvaluate addTarget:self action:@selector(toEvaluateClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _bottomButtonView;
}
- (void)toEvaluateClick:(UIButton *)but{
    OrderJudgeViewController *orderJudgeView =[[OrderJudgeViewController alloc]init];
    [self.navigationController pushViewController:orderJudgeView animated:YES];
}
@end
