//
//  CustomCollectionViewCell.m
//  首页
//
//  Created by shiguanghua on 16/6/10.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "CustomCollectionViewCell.h"

@implementation CustomCollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self layoutSubview];
    }
    return self;
}

-(void)layoutSubview
{
    
    self.imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.size.width, self.size.height)];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, self.imageView.getFrame_Bottom-20, self.size.width, 20)];
    
    self.titleLabel.textColor = [UIColor whiteColor];
    
    [self addSubview:self.imageView];
    
    [self addSubview:self.titleLabel];
    
    
}

@end
