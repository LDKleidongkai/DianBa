//
//  ShopDetailsData.m
//  DianBa
//
//  Created by 王辰鹭 on 2017/1/3.
//  Copyright © 2017年 wangchenlu. All rights reserved.
//

#import "ShopDetailsData.h"
#import "ShopDetailsParam.h"
#import "ShopDetailsResult.h"
#import "CommentDetails.h"

@implementation ShopDetailsData

+ (void)shopDetailsWithDetailsStoreId:(NSString *)detailsStoreId success:(void (^)(ShopDetailsResult *))success failure:(void (^)(NSError *))failure{
    
    ShopDetailsParam *param = [[ShopDetailsParam alloc] init];
    param.store_id = detailsStoreId;
    
    [MHHttpTool Post:@"http://www.kdiana.com/index.php/Before/HomePage/store_info" parameters:param.mj_keyValues success:^(id responseObject) {
        
        ShopDetailsResult *result = [[ShopDetailsResult alloc] init];
        result.store_id = [responseObject objectForKey:@"store_id"];
        result.store_name = [responseObject objectForKey:@"store_name"];
        result.is_outsite = [responseObject objectForKey:@"is_outsite"];
        result.Dstore_con = [responseObject objectForKey:@"store_con"];
        result.store_license = [responseObject objectForKey:@"store_license"];
        result.business_time_start = [responseObject objectForKey:@"business_time_start"];
        result.business_time_over = [responseObject objectForKey:@"business_time_over"];
        result.food_business_licenses = [responseObject objectForKey:@"food_business_licenses"];
        result.store_address = [responseObject objectForKey:@"store_address"];
        result.menu_attr = [responseObject objectForKey:@"menu_attr"];
        result.star = [responseObject objectForKey:@"star"];
        result.store_img = [responseObject objectForKey:@"store_img"];
        result.distribut = [responseObject objectForKey:@"distribut"];
        result.count_rated = [responseObject objectForKey:@"count_rated"];
        result.turnover = [responseObject objectForKey:@"turnover"];
        result.comment = [responseObject objectForKey:@"comment"];
        
        if (success) {
            success(result);
        }
        
    } failure:^(NSError *error) {
        if (failure) {
            failure(error);
        }
    }];
    
}

@end
