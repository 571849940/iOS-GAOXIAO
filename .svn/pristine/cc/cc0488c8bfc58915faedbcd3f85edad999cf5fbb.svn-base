//
//  HomeProdessionalCell.m
//  首页
//
//  Created by puyantao on 16/6/17.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "HomeProdessionalCell.h"

@interface HomeProdessionalCell ()
{
    UILabel *departmentNameLabel;
    
}

@end

@implementation HomeProdessionalCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self layoutUI];
        
    }
    return self;
    
}


- (void)layoutUI{
    departmentNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 200, 44)];
    departmentNameLabel.textAlignment = NSTextAlignmentLeft;
    departmentNameLabel.font = [UIFont systemFontOfSize:20];
    departmentNameLabel.backgroundColor = [UIColor whiteColor];
    [self.contentView addSubview:departmentNameLabel];
    
}

- (void)setModel:(HomeProdessionalModel *)model{
    _model = model;
    departmentNameLabel.text = _model.departmentName;
    
}


@end




















