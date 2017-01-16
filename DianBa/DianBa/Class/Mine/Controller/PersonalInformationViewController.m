//
//  PersonalInformationViewController.m
//  DianBa
//
//  Created by Hunter on 2017/1/9.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//
//
//个人信息
//

#import "PersonalInformationViewController.h"

#define PersonMessage @"http://www.kdiana.com/index.php/Before/UserCenter/my_info"

@interface PersonalInformationViewController ()<UITableViewDelegate,UITableViewDataSource>{
    NSArray *dataSource,*detailDataSource;
    NSDictionary *dictonary;
}

@property (nonatomic, strong) UITableView *myTableView;
@end

@implementation PersonalInformationViewController

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
 
    NSUserDefaults * defaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [defaults objectForKey:@"UserId"];
    NSString *date =[dic objectForKey:@"user_id"];
    
    [MHHttpTool Post:PersonMessage parameters:@{@"user_id":date} success:^(id responseObject) {
        dictonary =responseObject;
        
        NSLog(@"%@",[dictonary objectForKey:@"username"]);
        detailDataSource =@[@[@"",[dictonary objectForKey:@"username"],@""],@[[dictonary objectForKey:@"tel"],@""],@[@""]];
        NSLog(@"%@",dataSource);
        [self.myTableView reloadData];
    } failure:^(NSError *error) {
        
    }];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
     self.view.backgroundColor =[UIColor whiteColor];
    dataSource =@[@[@"头像",@"昵称",@"生日"],@[@"电话",@"密码"],@[@""]];
    
    
    
    
    [self.view addSubview:self.myTableView];
    self.navigationItem.title = @"添加地址";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"the-arrow-"] style:UIBarButtonItemStylePlain target:self action:@selector(backClick:)];
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor blackColor];
}
- (void)backClick:(UIButton *)but{
    [self.navigationController popViewControllerAnimated:YES];
}
- (UITableView *)myTableView{
    if (!_myTableView) {
        _myTableView =[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
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
    static NSString *identify =@"UITableViewCell";
    UITableViewCell *cell =[tableView dequeueReusableCellWithIdentifier:identify];
    if (!cell) {
        cell =[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identify];
        cell.selectionStyle =UITableViewCellSelectionStyleNone;
        cell.accessoryType =UITableViewCellAccessoryDisclosureIndicator;
    }
    if (indexPath.section == 2) {
        cell.accessoryType =UITableViewCellAccessoryNone;
        if (indexPath.row == 0) {
            UIButton *but =[UIButton buttonWithType:UIButtonTypeCustom];
            [but setTitle:@"退出登录" forState:UIControlStateNormal];
            [but setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [but addTarget:self action:@selector(butClick:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:but];
            but.sd_layout.topSpaceToView(cell.contentView,0).leftSpaceToView(cell.contentView,0).rightSpaceToView(cell.contentView,0).bottomSpaceToView(cell.contentView,0);
        }
    }
    cell.textLabel.text =dataSource[indexPath.section][indexPath.row];
    cell.detailTextLabel.text =detailDataSource[indexPath.section][indexPath.row];
    cell.textLabel.textColor =[UIColor blackColor];
    cell.detailTextLabel.textColor =[UIColor colorWithRed:0.62 green:0.62 blue:0.62 alpha:1.00];
    
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 0.1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 10;
}

- (void)butClick:(UIButton *)but{
    [self.navigationController popViewControllerAnimated:YES];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:@"UserId"];
}


@end
