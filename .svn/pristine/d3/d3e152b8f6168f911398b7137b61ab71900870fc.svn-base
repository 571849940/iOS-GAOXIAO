
//
//  HomeIntroductionCell.m
//  首页
//
//  Created by puyantao on 16/6/17.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "HomeIntroductionCell.h"

@interface HomeIntroductionCell ()
{
    UIImageView *logoView;
    UILabel *infoLabel;
    UILabel *historylabel;
    
}


@end

@implementation HomeIntroductionCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutUI];
        
    }
    return self;
    
}

- (void)layoutUI{
    
    
    switch ([FSCodeLayout iphoneType])
    {
        case FSiPhoneType_4s:
        {
            logoView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 130, 130)];
        }
            break;
        case FSiPhoneType_5s:
        {
            logoView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 150, 150)];
        }
            break;
        case FSiPhoneType_6:
        {
            logoView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 180, 180)];
        }
            break;
        case FSiPhoneType_6plus:
        {
            logoView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 200, 200)];
        }
            break;
            
        default:
            break;
    }

    
    
    
    [self.contentView addSubview:logoView];
    
    infoLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, logoView.getFrame_Bottom, kScreenWidth, 10)];
    infoLabel.numberOfLines = 0;
    [self.contentView addSubview:infoLabel];
    
    
}






- (void)setModel:(HomeIntroductionModel *)model{
    _model = model;
    logoView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_model.logo]]];
    infoLabel.text = _model.info;
    
    CGRect infoFrame = infoLabel.frame;
    infoFrame.size.height = _model.cellHeight-200;
    infoLabel.frame = infoFrame;
    
}


@end






















