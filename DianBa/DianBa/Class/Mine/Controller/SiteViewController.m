//
//  SiteViewController.m
//  DianBa
//
//  Created by Hunter on 2017/1/9.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//
//
// 我的收货地址
//

#import "SiteViewController.h"
#import "AddressTableViewCell.h"
#import "AddressHeaderView.h"
#import "AddAddressViewController.h"
#import "SelectResultData.h"

#define SELECTURL @"http://www.kdiana.com/index.php/Before/Orders/address_sel"
@interface SiteViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *arr;
    NSMutableArray *dataSource;
    
}

@property (nonatomic, strong) AddressHeaderView *addAddressHeader;
@property (nonatomic, strong) UITableView *myTable;
@end

@implementation SiteViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    NSDictionary *dic =@{@"user_id":@"10098"};
    [MHHttpTool Post:SELECTURL parameters:dic success:^(id responseObject) {
        //在这里加载数据
        arr =[responseObject objectForKey:@"data"];
//        NSLog(@"%@",[dataSource objectForKey:@"data"]);
        
        dataSource =[NSMutableArray array];
        for (NSDictionary *dic in arr) {
            SelectResultData *selectModel =[[SelectResultData alloc] init];
            [selectModel setValuesForKeysWithDictionary:dic];
            [dataSource addObject:selectModel];
        }
        
        
        [self.myTable reloadData];
    } failure:^(NSError *error) {
        
    }];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor =[UIColor whiteColor];
    [self.view addSubview:self.myTable];
    self.myTable.separatorStyle =NO;
    self.myTable.tableHeaderView =self.addAddressHeader;
    
    self.navigationItem.title =@"管理地址";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"the-arrow-"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];

}
- (void)backClick:(UIButton *)but{
    [self.navigationController popViewControllerAnimated:YES];
}

- (UITableView *)myTable{
    if (!_myTable) {
        _myTable =[[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
        _myTable.delegate =self;
        _myTable.dataSource =self;
    }
    return _myTable;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return dataSource.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *iedntify =@"UITableViewCell";
    AddressTableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:iedntify];
    if (!cell) {
        cell =[[[NSBundle mainBundle] loadNibNamed:@"AddressTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
    }
    cell.selectData =dataSource[indexPath.row];
    
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 120;
}

- (AddressHeaderView *)addAddressHeader{
    if (!_addAddressHeader) {
        _addAddressHeader =[[[NSBundle mainBundle] loadNibNamed:@"AddressHeaderView" owner:self options:nil] lastObject];
        [_addAddressHeader.addAddressButton addTarget:self action:@selector(addButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _addAddressHeader;
}
- (void)addButtonClick:(UIButton *)but{
    AddAddressViewController *add =[[AddAddressViewController alloc] init];
    [self.navigationController pushViewController:add animated:YES];
}
@end
