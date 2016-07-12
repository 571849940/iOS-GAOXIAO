//
//  TodayWeatherModel.h
//  首页
//
//  Created by cqy on 16/6/29.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TodayWeatherModel : NSObject

@property(nonatomic,copy)NSString *date;

@property(nonatomic,copy)NSString *week;

@property(nonatomic,copy)NSString *curTemp;

@property(nonatomic,copy)NSString *fengli;

@property(nonatomic,copy)NSString *type;


@property(nonatomic,copy)NSString *fengxiang;

@property(nonatomic,copy)NSArray *index;




@end
