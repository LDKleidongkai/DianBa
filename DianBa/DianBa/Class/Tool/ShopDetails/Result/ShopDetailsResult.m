//
//  ShopDetailsResult.m
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "ShopDetailsResult.h"
#import "CommentDetails.h"

@implementation ShopDetailsResult

- (void)setValue:(id)value forKey:(NSString *)key{
    if ([@[@"Dstore_con",@"store_con"] containsObject:key]) {
        self.Dstore_con = value;
    }
}

+ (NSDictionary *)mj_objectClassInArray{
    return @{@"comment":[CommentDetails class]};
}

@end
