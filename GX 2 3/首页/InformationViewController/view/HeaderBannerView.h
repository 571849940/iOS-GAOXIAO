//
//  HeaderBannerView.h
//  首页
//
//  Created by pangrenmeng on 16/6/10.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import <UIKit/UIKit.h>


@protocol HeaderBannerViewDeletage <NSObject>

-(void)bannerViewClickPage:(NSInteger)clickPage;

@end

@interface HeaderBannerView : UIView

@property(nonatomic,weak)id <HeaderBannerViewDeletage>delegate;


@property(nonatomic,strong)NSArray *sourceArray;

//是否需要定时器
@property(nonatomic,assign)BOOL isTimer;

@end
