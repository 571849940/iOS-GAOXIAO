//
//  HomeCollectionCellViewController.m
//  首页
//
//  Created by shiguanghua on 16/6/10.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "HomeCollectionCellViewController.h"
#import "HomeViewController.h"
#import "HomeCollectionTableHeader.h"
#import "HomeCollectionTableCell.h"
#import "UniversityChildrenModel.h"
#import "XRShareInfoView.h"

@interface HomeCollectionCellViewController ()<UITableViewDelegate, UITableViewDataSource>
{
    UITableView *homeTableView;
    HomeCollectionTableHeader *headerView;
    NSArray *dataArray;
    
}



@end

@implementation HomeCollectionCellViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    self.view.backgroundColor = [UIColor whiteColor];
    [self layoutSubView];
    [self layoutNavigationBar];
    
}

#pragma mark *********************** private methods *******************************
- (void)layoutSubView{
    homeTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    homeTableView.backgroundColor = [UIColor whiteColor];
    homeTableView.delegate = self;
    homeTableView.dataSource = self;
    [self.view addSubview:homeTableView];
    
    headerView = [[[NSBundle mainBundle]loadNibNamed:@"HomeCollectionTableHeader" owner:nil options:nil] lastObject]; //加载 xib
    headerView.superView = self;    //通过控制器实现表头和控制器一起联动
    headerView.infoModel = self.infoModel;
    homeTableView.tableHeaderView = headerView;
    homeTableView.rowHeight = homeTableView.height - headerView.height;
    self.navigationController.edgesForExtendedLayout = UIRectEdgeNone;
    homeTableView.showsVerticalScrollIndicator = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
}


- (void)layoutNavigationBar{
    [self addCustomNavigationBarTitle:self.infoModel.schoolName isNeedBackBtn:YES isNeedShareBtn:YES];
    
}

- (void)shareInfoEvent{
    XRShareInfoView *shareInfoView = [[[NSBundle mainBundle] loadNibNamed:@"XRShareInfoView" owner:nil options:nil] lastObject];
    shareInfoView.frame = CGRectMake(0, 0, kScreenWidth, kScreenHeight);
    shareInfoView.homeVC = self;
    shareInfoView.childrenModel = self.infoModel;
    [shareInfoView showInView:self.view];
    
}



#pragma mark *********************** tableDelegate methods *******************************
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeCollectionTableCell *cell = [[HomeCollectionTableCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    self.onluCell = cell;
    cell.headerView = headerView;
    cell.infoModel = self.infoModel;
    cell.originalVC = self;
    return cell;
    
}


//- (void)viewDidAppear:(BOOL)animated{
//    [super viewDidAppear:animated];
//    [homeTableView reloadData];
//    
//}

    
@end

















