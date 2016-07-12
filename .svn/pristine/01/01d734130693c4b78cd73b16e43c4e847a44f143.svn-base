//
//  netCenter.h
//  首页
//
//  Created by pangrenmeng on 16/6/9.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import <Foundation/Foundation.h>

#define kApi @"http://apis.baidu.com/songshuxiansheng/real_time/search_news"

typedef void(^Completion)(NSArray *resonseData,int errorCode,NSError *error);

@interface netCenter : NSObject

+ (void)sendRequestKeyWord:(NSDictionary *)keyWord WithCompletion:(Completion)completion;

@end
