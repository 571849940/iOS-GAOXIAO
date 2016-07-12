//
//  InformationCell.m
//  首页
//
//  Created by pangrenmeng on 16/6/10.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "InformationCell.h"

@interface InformationCell ()

@property(nonatomic,retain)UIImageView *iconImageView;
@property(nonatomic,retain)UILabel *titleLabel;
@property(nonatomic,retain)UILabel *timerLabel;

@end

@implementation InformationCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutUI];
    }
    return self;
}

-(void)layoutUI{

    self.iconImageView = [[UIImageView alloc]initWithFrame:CGRectMake(10, 10, 130, 80)];
    [self addSubview:self.iconImageView];
    
    self.titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.iconImageView.getFrame_right+10, 10, kScreenWidth-155, self.iconImageView.height*2/3)];
    self.titleLabel.numberOfLines = 0;
    [self addSubview:self.titleLabel];
    
    self.timerLabel = [[UILabel alloc]initWithFrame:CGRectMake(self.iconImageView.getFrame_right+10, self.titleLabel.getFrame_Bottom, kScreenWidth-155, self.iconImageView.height/3)];
    self.timerLabel.textColor = [UIColor lightGrayColor];
    self.timerLabel.font = [UIFont systemFontOfSize:10];
    [self addSubview:self.timerLabel];

}

-(void)setDataModel:(InformationNewsModel *)dataModel{

    if (dataModel.img_url == nil) {
        self.iconImageView.image = [UIImage imageNamed:@"logo"];
    }else{
        [self.iconImageView sd_setImageWithURL:[NSURL URLWithString:dataModel.img_url]];
    }
    self.titleLabel.text = dataModel.title;
    self.timerLabel.text = [NSString stringWithFormat:@"更新时间:%@",dataModel.datetime];

}



@end















