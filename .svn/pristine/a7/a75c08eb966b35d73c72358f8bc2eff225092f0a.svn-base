//
//  netCenter.m
//  首页
//
//  Created by pangrenmeng on 16/6/9.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "netCenter.h"

@implementation netCenter

+(void)sendRequestKeyWord:(NSDictionary *)keyWord WithCompletion:(Completion)completion{

NSMutableDictionary *tempDict = [NSMutableDictionary dictionaryWithDictionary:keyWord];

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObject:@"text/html"];

    [manager.requestSerializer setValue:@"1449ef643181b36f869e616c77db1a0a" forHTTPHeaderField:@"apikey"];
    
    [manager GET:kApi parameters:tempDict success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        NSLog(@"%@",responseObject);
        completion(responseObject[@"retData"][@"data"],[responseObject[@"status"] intValue],nil);

    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        completion(nil,-1,error);
        
    }];

}


@end
