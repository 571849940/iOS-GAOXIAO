//
//  CustomUniversityTableViewCell.m
//  首页
//
//  Created by shiguanghua on 16/6/29.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "CustomUniversityTableViewCell.h"
#define kUpDownSpace 5
#define kLeftRightSpace 20


@implementation CustomUniversityTableViewCell

//- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
//    [super setSelected:selected animated:animated];
//
//    
//}


-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        _logoImageView = [[UIImageView alloc]initWithFrame:CGRectMake(kLeftRightSpace, kUpDownSpace, 50, 50)];
        
        _logoImageView.layer.cornerRadius = 25;
        
        _logoImageView.clipsToBounds = YES;
        
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(50+kLeftRightSpace*2, kUpDownSpace, 200, 50)];
        
        _titleLabel.textColor = [UIColor whiteColor];
        
        _titleLabel.font = [UIFont boldSystemFontOfSize:20];
        
        
        [self addSubview:_logoImageView];
        
        [self addSubview:_titleLabel];

    }
    return self;
    
}







@end
