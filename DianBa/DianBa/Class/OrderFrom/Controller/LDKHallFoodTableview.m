//
//  HallFoodTableview.m
//  DianBa
//
//  Created by Hunter on 2017/1/4.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "LDKHallFoodTableview.h"
#import "LDKAllTableViewCell.h"

@implementation LDKHallFoodTableview

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
    return 4;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *indentify = @"indentify";
    LDKAllTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:indentify];
    if (!cell) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"LDKAllTableViewCell" owner:self options:nil] lastObject];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    return cell;
}


@end
