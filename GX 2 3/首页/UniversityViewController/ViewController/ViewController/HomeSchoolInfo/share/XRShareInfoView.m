//
//  XRShareInfoView.m
//  XUER
//
//  Created by puyantao on 16/7/1.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "XRShareInfoView.h"
#import "XRShareCenter.h"

#define kShareItemBaseTag 100

@implementation XRShareInfoView


- (void)awakeFromNib{
    [self layoutUI];
    
    
}

#pragma mark *********************************** private methods **************************************
- (void)layoutUI{
    //点击分享
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSender:)];
    [self.weiboView addGestureRecognizer:tap];
    self.weiboView .tag = kShareItemBaseTag + SSDKPlatformTypeSinaWeibo;
    
    tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSender:)];
    [self.weixinView addGestureRecognizer:tap];
    self.weixinView.tag = kShareItemBaseTag + SSDKPlatformSubTypeWechatSession;
    
    tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSender:)];
    [self.friendView addGestureRecognizer:tap];
    self.friendView.tag = kShareItemBaseTag + SSDKPlatformSubTypeWechatTimeline;
    
    tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tapSender:)];
    [self.qqView addGestureRecognizer:tap];
    self.qqView.tag = kShareItemBaseTag + SSDKPlatformSubTypeQQFriend;
    
    //点击背景隐藏shareView
    tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(hideView:)];
    [self.bgView addGestureRecognizer:tap];
    
    
}


- (void)tapSender:(UITapGestureRecognizer *)tap{
    UIView *view = tap.view;
    SSDKPlatformType type = (int)(view.tag - kShareItemBaseTag);
    [XRShareCenter shareToSocialPlatformWithType:type withURL:[NSURL URLWithString:self.childrenModel.url]];
    
}


- (void)hideView:(UITapGestureRecognizer *)tap{
    _bgView.alpha = 0.333;
    UIView *view = self.superview;
    _contentView.y = view.height - _contentView.height;
    [UIView animateWithDuration:0.3 animations:^{
        _contentView.y = view.height;
        _contentView.alpha = 0;
        
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
        
    }];
    
    
}


- (void)showInView:(UIView *)view{
    
    if (self.superview != nil) {
        [self removeFromSuperview];
        
    }
    
    self.frame = view.bounds;
    [view addSubview:self];
    
    _contentView.y = view.height;
    _bgView.alpha = 0;
    [UIView animateWithDuration:0.3 animations:^{
        _contentView.y = view.height - _contentView.height;
        _bgView.alpha = 0.333;
        
    }];

}


-(void)refreshShareView{
    _weixinView.centerX = self.centerX;
    _weiboView.centerX = _weixinView.x/2;
    _friendView.centerX = [_weixinView getFrame_right]+_weiboView.centerX;
    
    if(kScreenWidth == 414){
        float qqX = [_friendView getFrame_right]+_weiboView.centerX;
        _qqView.frame = CGRectMake(qqX, 0, _weiboView.width, _weiboView.height);
        
    }else{
        _qqView.centerX = _weiboView.centerX;
        
    }
    
}



#pragma mark *********************************** system set methods **************************************
-(void)setFrame:(CGRect)frame{
    [super setFrame:frame];
    _bgView.frame = self.bounds;
    _contentView.width = self.width;
//    [self refreshShareView];
    
}


- (void)drawRect:(CGRect)rect{
    [self refreshShareView];
    
}





@end























