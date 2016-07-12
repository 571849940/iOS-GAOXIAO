//
//  BannerView.h
//  无限轮播
//
//  Created by shiguanghua on 16/6/3.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol BannerViewDelegate <NSObject>

-(void)bannerViewClickPage:(NSInteger)clickPage;

@end


@interface BannerView : UIView
//数据源数组，就是调用时要传进来的数据
@property(nonatomic,strong)NSArray *sourceArray;

//是否需要定时轮播
@property(nonatomic,assign)BOOL isTimer;

@property(nonatomic,weak)id <BannerViewDelegate>delegate;

@end
