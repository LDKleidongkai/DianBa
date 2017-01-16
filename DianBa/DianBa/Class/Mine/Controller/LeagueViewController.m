//
//  LeagueViewController.m
//  DianBa
//
//  Created by Hunter on 2017/1/9.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//
//
//加盟合作
//

#import "LeagueViewController.h"

@interface LeagueViewController ()

@property (nonatomic, strong) UITableView *myTable;
@end

@implementation LeagueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor =[UIColor whiteColor];
}


- (UITableView *)myTable{
    if (_myTable) {
        _myTable =[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        _myTable.delegate =self;
        _myTable.dataSource =self;
    }
    return _myTable;
}
@end
