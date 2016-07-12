//
//  HomeCollectionTableHeader.m
//  首页
//
//  Created by puyantao on 16/6/17.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "HomeCollectionTableHeader.h"

@interface HomeCollectionTableHeader ()




@end


@implementation HomeCollectionTableHeader

- (void)setInfoModel:(UniversityChildrenModel *)infoModel{
    _infoModel = infoModel;
    self.tableHeaderImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:self.infoModel.headerImage]]];
    
    
}


- (void)cellScrollViewIndex:(int)index{
    NSLog(@"%d", index);
    UIButton *btn = [self viewWithTag:100+index];
    [self clickBntEvent:btn];
    
}


- (IBAction)clickBntEvent:(UIButton *)sender {
    for (int index = 100; index<103; index++) {
        UIButton *selectBtn = [self viewWithTag:index];
        selectBtn.selected = NO;
        
    }
    
    [self.superView.onluCell.blockScrollView setContentOffset:CGPointMake((sender.tag-100)*kScreenWidth, 0) animated:YES];
    self.ScrollView.translatesAutoresizingMaskIntoConstraints = YES;
   
    if (sender.tag == 101) {
        sender.selected = YES;
        
    }else if(sender.tag == 102){
        sender.selected = YES;
        
    }else{
        sender.selected = YES;
        
    }
    
    [UIView animateWithDuration:0.3 animations:^{
        self.ScrollView.centerX = sender.centerX;
        
    }];
    
}




- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    self.frame = CGRectMake(0, 0, kScreenWidth, 229);
    
}


@end



















