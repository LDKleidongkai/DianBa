//
//  AllTableView.m
//  DianBa
//
//  Created by Hunter on 2017/1/4.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "LDKAllTableView.h"
#import "LDKAllTableViewCell.h"
#import "MyOrderViewController.h"

@implementation LDKAllTableView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor =[UIColor whiteColor];
        self.rowHeight = UITableViewAutomaticDimension;
        self.estimatedRowHeight = 1000;
        self.contentInset =UIEdgeInsetsMake(0, 0, 44, 0);
        self.delegate = self;
        self.dataSource = self;
        self.showsVerticalScrollIndicator = NO;
    }
    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentify = @"indentify";
    LDKAllTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentify];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LDKAllTableViewCell" owner:self options:nil] lastObject];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
//    [cell.TailAfter addTarget:self action:@selector(tailClick:) forControlEvents:UIControlEventTouchUpInside];
//    
    return cell;
}




- (UINavigationController *)NaViewController {
    //取出根视图控制器
    UITabBarController *tabBarVc = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
    //取出当前选中的导航控制器
    UINavigationController *Nav = [tabBarVc selectedViewController];
    return Nav;
    
}


//- (void)tailClick:(UIButton *)but{
//    MyOrderViewController *myOrderTable = [[MyOrderViewController alloc] init];
//    [[self NaViewController] pushViewController:myOrderTable animated:YES];
//}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    kkkkViewController * kk = [[kkkkViewController alloc] init];
//    kk.kkkk =@"ldkldkdk";
//    [[self NaViewController] pushViewController:kk animated:YES];
//}
@end
