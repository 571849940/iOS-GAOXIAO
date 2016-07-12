
//
//  HomeCommentCell.m
//  首页
//
//  Created by puyantao on 16/6/17.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "HomeCommentCell.h"

@interface HomeCommentCell ()
{
    UIImageView *userLogoImage;
    UILabel *userNameLabel;
    UILabel *commentTimerLabel;
    UILabel *commentInfolabel;
    
}


@end

@implementation HomeCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutUI];
        
    }
    return self;
    
}


- (void)layoutUI{
    userLogoImage = [[UIImageView alloc]initWithFrame:CGRectMake(10, 5, 100, 100)];
    userLogoImage.layer.cornerRadius = 50;
    userLogoImage.clipsToBounds = YES;
    userLogoImage.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:userLogoImage];
    
    userNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 110, 100, 20)];
    userNameLabel.textAlignment = NSTextAlignmentCenter;
    userNameLabel.font = [UIFont systemFontOfSize:18];
    userNameLabel.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:userNameLabel];
    
    commentInfolabel = [[UILabel alloc] initWithFrame:CGRectMake(115, 5, kScreenWidth-120, 100)];
    commentInfolabel.font = [UIFont systemFontOfSize:16];
    commentInfolabel.numberOfLines = 0;
    commentInfolabel.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:commentInfolabel];
    
    UIImageView *commentTimerImage = [[UIImageView alloc] initWithFrame:CGRectMake(115, 110, 20, 20)];
    commentTimerImage.image = [UIImage imageNamed:@"shijian"];
    [self.contentView addSubview:commentTimerImage];
    commentTimerLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 110, 100, 20)];
    commentTimerLabel.font = [UIFont systemFontOfSize:18];
    commentTimerLabel.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:commentTimerLabel];
    
}


- (void)setModel:(HomeCommentModel *)model{
    _model = model;
    userLogoImage.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:_model.userLogo]]];
    userNameLabel.text = _model.userName;
    commentInfolabel.text = _model.commentInfo;
    commentTimerLabel.text = _model.commentTimer;
    
}

@end
















