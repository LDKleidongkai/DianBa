//
//  ShopDetailsController.m
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "ShopDetailsController.h"
#import "ShopDtailsHeader.h"
#import "ShopDetailsView.h"
#import "FirstDetailsCell.h"
#import "SecondDetailsCell.h"
#import "ThirdDetailsCell.h"
// 数据
#import "ShopDetailsData.h"
#import "ShopDetailsResult.h"
#import "CommentDetails.h"

@interface ShopDetailsController ()<UITableViewDelegate,UITableViewDataSource>{
    CGFloat _labelH;
    CGFloat _commentLableH;
}
@property (nonatomic, strong) ShopDtailsHeader *header;
@property (nonatomic, strong)ShopDetailsView *detailsView;
@property (nonatomic, strong) ShopDetailsResult *result;
/** 店铺信息数组 */
@property (nonatomic, strong) NSMutableArray *messageArr;
@property (nonatomic, strong) NSMutableArray *commentArr;
@end

@implementation ShopDetailsController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:self.detailsView];
    [self.detailsView.returnBtn addTarget:self action:@selector(returnBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self loadData];
}

#pragma mark - 加载数据
- (void)loadData{
    [ShopDetailsData shopDetailsWithDetailsStoreId:@"1" success:^(ShopDetailsResult *shopDetails) {
        self.result = shopDetails;
        NSArray *array = [[NSArray alloc] initWithObjects:shopDetails.distribut,[NSString stringWithFormat:@"简介：%@",shopDetails.Dstore_con],[NSString stringWithFormat:@"菜品：%@",shopDetails.menu_attr],[NSString stringWithFormat:@"地址：%@",shopDetails.store_address],[NSString stringWithFormat:@"营业时间：%@-%@",self.result.business_time_start,self.result.business_time_over],@"营业执照",@"餐饮服务许可证", nil];
        [self.messageArr addObjectsFromArray:array];
        [self.detailsView setDetailsResult:shopDetails];
        [self.commentArr addObjectsFromArray:shopDetails.comment];
        [self.detailsView.table reloadData];
    } failure:^(NSError *error) {
        NSLog(@"%@",error);
    }];
    
}

#pragma mark - 按钮方法
- (void)returnBtnClick:(UIButton *)sender{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(StartX, StartY, ScreenWidth, 42)];
    view.backgroundColor = [UIColor whiteColor];
    if (section == 0) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(ScreenWidth - 20, 17, 8, 6);
        [button setImage:[UIImage imageWithOriginaName:@"arrows"] forState:UIControlStateNormal];
        [view addSubview:button];
    }
    UILabel *information = [[UILabel alloc] initWithFrame:CGRectMake(12, 17, 200, 15)];
    information.text = @[@"商家信息",@"优惠活动",@"用户评价"][section];
    information.font = [UIFont systemFontOfSize:16 weight:1];
    information.textColor = [GVColor hexStringToColor:@"#333333"];
    [view addSubview:information];
    return view;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    if (section == 2) {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(StartX, StartY, ScreenWidth, 30)];
        view.backgroundColor = [UIColor whiteColor];
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(StartX, StartY, ScreenWidth, 30);
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.userInteractionEnabled = YES;
        if (self.commentArr.count > 0) {
            [button setTitle:[NSString stringWithFormat:@"查看全部%ld条评价",self.commentArr.count] forState:UIControlStateNormal];
            button.userInteractionEnabled = YES;
        }else{
            [button setTitle:@"无更多评价" forState:UIControlStateNormal];
            button.userInteractionEnabled = NO;
        }
        [button setTitleColor:[GVColor hexStringToColor:@"#ffba14"] forState:UIControlStateNormal];
        [view addSubview:button];
        return view;
    }else{
        return nil;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 42;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    if (section == 2) {
        return 30;
    }
    else{
        return 10;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        self.detailsView.table.estimatedRowHeight = 30;
        self.detailsView.table.rowHeight = UITableViewAutomaticDimension;
        return self.detailsView.table.rowHeight;
    }
    else if (indexPath.section == 1){
        return 47;
    }
    else{
        self.detailsView.table.estimatedRowHeight = 30;
        self.detailsView.table.rowHeight = UITableViewAutomaticDimension;
        return self.detailsView.table.rowHeight;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return self.messageArr.count;
    }
    else if (section == 1){
        return 1;
    }
    else{
        return self.commentArr.count;
    }
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        static NSString *firstID = @"first";
        FirstDetailsCell *firstCell = [tableView dequeueReusableCellWithIdentifier:firstID];
        if (firstCell == nil) {
            firstCell = [[NSBundle mainBundle] loadNibNamed:@"FirstDetailsCell" owner:self options:nil].lastObject;
        }
        firstCell.firstLabel.text = self.messageArr[indexPath.row];
        if (indexPath.row == 4) {
            NSAttributedString *noteStr = [self labelColorWithString:self.messageArr[indexPath.row] rangeString:[NSString stringWithFormat:@"%@-%@",self.result.business_time_start,self.result.business_time_over] textColor:[GVColor hexStringToColor:@"#ffba14"]];
            //设置颜色
            [firstCell.firstLabel setAttributedText:noteStr];
        }
        if (indexPath.row == 5 || indexPath.row == 6) {
            firstCell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        }
        return firstCell;
    }
    else if (indexPath.section ==1){
        static NSString *secondID = @"second";
        SecondDetailsCell *secondCell = [tableView dequeueReusableCellWithIdentifier:secondID];
        if (secondCell == nil) {
            secondCell = [[NSBundle mainBundle] loadNibNamed:@"SecondDetailsCell" owner:self options:nil].lastObject;
        }
        return secondCell;
    }
    else{
        static NSString *thirdID = @"third";
        ThirdDetailsCell *thirdCell = [tableView dequeueReusableCellWithIdentifier:thirdID];
        if (thirdCell == nil) {
            thirdCell = [[NSBundle mainBundle] loadNibNamed:@"ThirdDetailsCell" owner:self options:nil].lastObject;
        }
//        [thirdCell setCommentD:self.result.comment[indexPath.row]];
        return thirdCell;
    }
}
// 文本颜色
- (NSMutableAttributedString *)labelColorWithString:(NSString *)string rangeString:(NSString *)rangeString textColor:(UIColor *)textColor{
    NSMutableAttributedString *noteStr = [[NSMutableAttributedString alloc] initWithString:string];
    NSRange range = NSMakeRange([[noteStr string] rangeOfString:rangeString].location, [[noteStr string] rangeOfString:rangeString].length);
    //需要设置的位置
    [noteStr addAttribute:NSForegroundColorAttributeName value:textColor range:range];
    return noteStr;
}

#pragma mark - 懒加载
- (ShopDtailsHeader *)header{
    if (_header == nil) {
        _header = [[ShopDtailsHeader alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 220)];
    }
    return _header;
}
- (ShopDetailsView *)detailsView{
    if (_detailsView == nil) {
        _detailsView = [[NSBundle mainBundle] loadNibNamed:@"ShopDetailsView" owner:self options:nil].lastObject;
        _detailsView.frame = self.view.frame;
        _detailsView.table.tableHeaderView = self.header;
        // 代理
        _detailsView.table.delegate = self;
        _detailsView.table.dataSource = self;
    }
    return _detailsView;
}
- (ShopDetailsResult *)result{
    if (_result == nil) {
        _result = [[ShopDetailsResult alloc] init];
    }
    return _result;
}
- (NSMutableArray *)messageArr{
    if (_messageArr == nil) {
        _messageArr = [[NSMutableArray alloc] init];
    }
    return _messageArr;
}
- (NSMutableArray *)commentArr{
    if (_commentArr == nil) {
        _commentArr = [[NSMutableArray alloc] init];
    }
    return _commentArr;
}
@end
