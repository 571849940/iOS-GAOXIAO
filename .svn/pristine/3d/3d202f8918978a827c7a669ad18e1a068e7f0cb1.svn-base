//
//  CustomCollectionReusableView.m
//  首页
//
//  Created by shiguanghua on 16/6/10.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "CustomCollectionReusableView.h"

@implementation CustomCollectionReusableView

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, self.width, self.height)];
        
        self.titleLabel.font = [UIFont boldSystemFontOfSize:18];
        
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        
        self.titleLabel.textColor = [UIColor blackColor];
        
        UIImage *image = [UIImage imageNamed:@"tabBar.jpg"];
        
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[image imageScaleToSize:CGSizeMake(kScreenWidth, 44)]];
        
        [self addSubview:imageView];
        
        [self addSubview:self.titleLabel];
    }
    return self;

}




@end













