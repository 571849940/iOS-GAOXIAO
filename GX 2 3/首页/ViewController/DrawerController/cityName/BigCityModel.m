//
//  BigCityModel.m
//  首页
//
//  Created by cqy on 16/6/29.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "BigCityModel.h"
#import "ChangeCityModel.h"
@implementation BigCityModel

+(NSDictionary *)mj_objectClassInArray{
    return @{@"cityArray":[ChangeCityModel class]};
}

@end
