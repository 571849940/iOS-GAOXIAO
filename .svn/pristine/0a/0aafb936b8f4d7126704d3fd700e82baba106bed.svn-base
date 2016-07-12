//
//  WeatherViewController.h
//  首页
//
//  Created by cqy on 16/6/29.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ChangeCityModel.h"


typedef void(^NameBlock)(NSString *cityWithCur);

@interface WeatherViewController : UIViewController

@property(nonatomic,strong)NameBlock nameblock;

-(void)sendCityNameWithCur:(NameBlock)block;

@end
