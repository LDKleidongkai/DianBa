//
//  OrderJudgeViewController.m
//  DianBa
//
//  Created by Hunter on 2017/1/6.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "OrderJudgeViewController.h"
#import "MyOrderHeaderView.h"
#import "VegetablesJudgecellCell.h"
#import "MyOrderFooterView.h"
#import "SubmitView.h"

@interface OrderJudgeViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSMutableArray *dataSource;
    UIView *myView;
}

@property (nonatomic, strong) MyOrderHeaderView *myOrderHeaderView;
@property (nonatomic, strong) MyOrderFooterView *myOrderFooterView;
@property (nonatomic, strong) SubmitView * submitView;
@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation OrderJudgeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    dataSource =[NSMutableArray arrayWithObjects:@"1232",@"123123",@"435343", nil];
    self.myTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.myTableView.tableHeaderView = self.myOrderHeaderView;
    self.myTableView.tableFooterView = self.myOrderFooterView;
    [self.view addSubview:self.myTableView];
    
    [self submitView];
    
}


- (SubmitView *)submitView{
    if (!_submitView) {
        _submitView =[[[NSBundle mainBundle] loadNibNamed:@"SubmitView" owner:self options:nil] lastObject];
        [self.view addSubview:_submitView];
        _submitView.sd_layout.leftSpaceToView(self.view,0).rightSpaceToView(self.view,0).bottomSpaceToView(self.view,0).heightIs(70);
    }
    return _submitView;
}
- (MyOrderHeaderView *)myOrderHeaderView{
    if (!_myOrderHeaderView) {
        _myOrderHeaderView = [[[NSBundle mainBundle] loadNibNamed:@"MyOrderHeaderView" owner:self options:nil] lastObject];
    }
    return _myOrderHeaderView;
}
- (MyOrderFooterView *)myOrderFooterView{
    if (!_myOrderFooterView) {
         _myOrderFooterView = [[[NSBundle mainBundle] loadNibNamed:@"MyOrderFooterView" owner:self options:nil] lastObject];
    }
    return _myOrderFooterView;
}

- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _myTableView.delegate =self;
        _myTableView.dataSource =self;
    }
    return _myTableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 46;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentify = @"indentify";
    VegetablesJudgecellCell *cell = [tableView dequeueReusableCellWithIdentifier:indentify];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"VegetablesJudgecellCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.NameLabel.text = dataSource[indexPath.row];
    
    return cell;
}
@end
