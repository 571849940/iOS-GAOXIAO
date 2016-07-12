//
//  SearchChangeCityViewController.h
//  首页
//
//  Created by cqy on 16/6/29.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^Myblock)(NSString *NameOfcity);

@interface SearchChangeCityViewController : UIViewController

@property(nonatomic,strong)Myblock myblock;

-(void)sendCityName:(Myblock)block;

@end
