//
//  HomeCollectionTableCell.h
//  首页
//
//  Created by puyantao on 16/6/17.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UniversityChildrenModel.h"
#import "HomeCollectionTableHeader.h"
#import "HomeCollectionCellViewController.h"

@class HomeCollectionTableHeader;

@interface HomeCollectionTableCell : UITableViewCell

@property (nonatomic, strong)UIScrollView *blockScrollView;
@property (nonatomic, strong)HomeCollectionTableHeader *headerView;
@property (nonatomic, strong)UniversityChildrenModel *infoModel;
@property (nonatomic, strong)id originalVC;

@end
