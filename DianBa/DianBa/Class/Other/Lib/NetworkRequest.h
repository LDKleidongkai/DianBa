//
//  NetworkRequest.h
//  networkrequest
//
//  Created by Hunter on 2016/12/20.
//  Copyright © 2016年 Hunter. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^SuccessBlock)(id success);
typedef void(^FailureBlock)(id failure);

@interface NetworkRequest : NSObject


+ (void)LogininfoRequestWithUrl:(NSString *)url parameters:(id)parameters Success:(SuccessBlock)success Failure:(FailureBlock)failure;


//验证码
+ (void)requestForPhoneCodeURL:(NSString *)url
                    parameters:(id)parameters
                       Success:(SuccessBlock)success
                       Failure:(FailureBlock)failure;
@end
