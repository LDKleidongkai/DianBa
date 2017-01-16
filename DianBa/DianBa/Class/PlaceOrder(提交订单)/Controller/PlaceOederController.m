//
//  PlaceOederController.m
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/12.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "PlaceOederController.h"

@interface PlaceOederController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *table;

@end

@implementation PlaceOederController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    // 导航条颜色
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:253/250.0 green:173/250.0 blue:19/250.0 alpha:1.0];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavigationBar];
    [self.view addSubview:self.table];
}

#pragma mark - tableView Delegate||DataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 2;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *ID = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = @"cell";
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.1;
}

#pragma mark - UI控件
// 设置导航条
- (void)setNavigationBar{
    UIBarButtonItem *returnBtn = [[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginaName:@"returnBtn"] style:UIBarButtonItemStylePlain target:self action:@selector(popToOrderController:)];
    self.navigationItem.leftBarButtonItem = returnBtn;
    self.navigationItem.title = @"提交订单";
}

#pragma mark - 跳转方法
- (void)popToOrderController:(UIBarButtonItem *)item{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - 懒加载
- (UITableView *)table{
    if (_table == nil) {
        _table = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
        _table.delegate = self;
        _table.dataSource = self;
    }
    return _table;
}

@end
