//
//  OrderFormViewController.m
//  DianBa
//
//  Created by Hunter on 2016/12/27.
//  Copyright © 2016年 wangchenlu. All rights reserved.
//

#import "OrderFormViewController.h"
#import "LXSegmentScrollView.h"
#import "LDKAllTableView.h"
#import "LDKHallFoodTableview.h"
#import "LDKTakeOutTableview.h"

@interface OrderFormViewController (){
    LDKAllTableView *allTableView;
    LDKHallFoodTableview *hallFoodTableView;
    LDKTakeOutTableview *takeOutTableView;
}

@end

@implementation OrderFormViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:252/255.0 green:174/255.0 blue:21/255.0 alpha:1.00];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.automaticallyAdjustsScrollViewInsets=NO;
    
    NSMutableArray *array=[NSMutableArray array];
    
    allTableView = [[LDKAllTableView alloc] initWithFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight+104)];
    hallFoodTableView = [[LDKHallFoodTableview alloc] initWithFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight)];
    takeOutTableView = [[LDKTakeOutTableview alloc] initWithFrame:CGRectMake(0, 104, ScreenWidth, ScreenHeight)];
    
    
    [array addObject:allTableView];
    [array addObject:hallFoodTableView];
    [array addObject:takeOutTableView];
    
    LXSegmentScrollView *scView=[[LXSegmentScrollView alloc] initWithFrame:CGRectMake(0, 64, self.view.bounds.size.width, self.view.bounds.size.height-64) titleArray:@[@"全部",@"堂食",@"外卖"] contentViewArray:array];
    [self.view addSubview:scView];
}



@end
