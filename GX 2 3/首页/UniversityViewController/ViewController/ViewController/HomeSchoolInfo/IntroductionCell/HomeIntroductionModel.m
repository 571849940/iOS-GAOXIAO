//
//  HomeIntroductionModel.m
//  首页
//
//  Created by puyantao on 16/6/18.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "HomeIntroductionModel.h"

@implementation HomeIntroductionModel

- (void)setInfo:(NSString *)info{
    _info = info;
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 0)];
    label.text = info;
    label.numberOfLines = 0;
    CGSize size = [label sizeThatFits:CGSizeMake(kScreenWidth, MAXFLOAT)];
    self.cellHeight = size.height + 200;
    NSLog(@"%f", self.cellHeight);
    label = nil;
    
}


@end
