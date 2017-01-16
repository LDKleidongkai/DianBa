//
//  MyOrderFooterView.m
//  DianBa
//
//  Created by Hunter on 2017/1/6.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "MyOrderFooterView.h"

@implementation MyOrderFooterView

- (void)awakeFromNib{
    [super awakeFromNib];
    self.myTextView.layer.borderWidth = 1.0;
    self.myTextView.layer.borderColor =[[GVColor hexStringToColor:@"#eeeeee"] CGColor];
}
@end
