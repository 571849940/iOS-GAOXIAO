//
//  HomeCollectionTableHeader.h
//  首页
//
//  Created by puyantao on 16/6/17.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HomeCollectionCellViewController.h"
#import "UniversityChildrenModel.h"

@class HomeCollectionCellViewController;
@interface HomeCollectionTableHeader : UIView

@property (nonatomic, strong)HomeCollectionCellViewController *superView;
@property (weak, nonatomic) IBOutlet UIImageView *tableHeaderImage;
@property (weak, nonatomic) IBOutlet UIView *ScrollView;
@property (nonatomic, strong)UniversityChildrenModel *infoModel;

- (void)cellScrollViewIndex:(int)index;

@end
