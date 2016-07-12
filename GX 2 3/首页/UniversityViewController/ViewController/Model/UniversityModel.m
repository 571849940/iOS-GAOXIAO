//
//  UniversityModel.m
//  首页
//
//  Created by pangrenmeng on 16/6/11.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "UniversityModel.h"
#import "UniversityChildrenModel.h"

@implementation UniversityModel

+(NSDictionary *)mj_objectClassInArray{
    return @{@"children":[UniversityChildrenModel class]};
}

@end
