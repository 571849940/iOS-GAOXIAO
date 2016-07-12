//
//  InformationViewController.m
//  首页
//
//  Created by shiguanghua on 16/6/6.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "InformationViewController.h"
#import "HeaderBannerView.h"
#import "netCenter.h"
#import "InformationNewsModel.h"
#import "InformationCell.h"
#import "LoadInformationViewController.h"

@interface InformationViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView *_tableView;
}

@property(nonatomic,retain)NSMutableArray *dataArray;

@property(nonatomic,retain)NSMutableArray *headerArray;

@property(nonatomic,assign)int page;

@end

@implementation InformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomNavigationBarTitle:@"资讯" isNeedDrawerBtn:YES];
    
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-44) style:UITableViewStyleGrouped];
    [self.view addSubview:_tableView];
    
    _tableView.delegate = self;
    
    _tableView.dataSource = self;
    
   // [self loadData:1];
    
    [self setRefresh];
    
}


-(void)loadData:(int)page{

    NSNumber *pageNum = [NSNumber numberWithInt:page];
    
    [netCenter sendRequestKeyWord:@{@"keyword":@"高校",@"page":pageNum} WithCompletion:^(NSArray *resonseData, int errorCode, NSError *error) {
        
        NSLog(@"%@ - %d --- %@",resonseData,errorCode,error);
        
        
        
        NSArray *tempArray = [InformationNewsModel mj_objectArrayWithKeyValuesArray:resonseData];
        
        [self.dataArray addObjectsFromArray:tempArray];
        
        for (InformationNewsModel *model in self.dataArray) {
            static int count = 0;
            if (model.img_url != nil) {
                
                [self.headerArray addObject:model];
                count++;
                if (count == 4) {
                    break;
                }
            }
            
        }
        
       // [_tableView reloadData];
        
        
        // NSLog(@"UI======%@",[NSThread currentThread]);
        
         [self performSelectorOnMainThread:@selector(updateUI) withObject:nil waitUntilDone:NO];
        
    }];
}



-(void)updateUI
{
    [_tableView reloadData];
    
    NSLog(@"UI=%@",[NSThread currentThread]);
    
    //服务器一响应，结束刷新
    [_tableView.mj_header endRefreshing];
    [_tableView.mj_footer endRefreshing];
    
}





-(NSMutableArray *)dataArray
{
    if (_dataArray==nil) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}




-(NSMutableArray *)headerArray{
    
    if (_headerArray == nil) {
        _headerArray = [NSMutableArray array];
    }
    
    return _headerArray;
}



-(void)setRefresh
{
    //下拉,当下拉的时候会调用block块
    _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        
        //  [self.dataArray removeAllObjects];
        
        self.page = 1;
        
        [self loadData:1];
        
    }];
    [_tableView.mj_header beginRefreshing];
    
    //上拉,当上拉的时候会调用block块
    _tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        
        self.page++;
        
        [self loadData:self.page];
        
    }];
    
    
    
}





#pragma mark UITableView Delegate Datasource Method

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}



-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    static NSString *cellId = @"CellID";
    
    InformationCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell==nil)
    {
        cell = [[InformationCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    InformationNewsModel *model = self.dataArray[indexPath.row];
    
    cell.dataModel = model;
    
//    cell.textLabel.text = model.title;
//    
//    [cell.imageView sd_setImageWithURL:[NSURL URLWithString:model.img_url]];
//    
//   // cell.accessoryView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"指向"]];
//    
//    cell.detailTextLabel.text = [NSString stringWithFormat:@"更新时间:%@",model.datetime];
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}



-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    HeaderBannerView *headerView = [[HeaderBannerView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, 190)];
    
    if (self.headerArray.count == 0) {
        
        InformationNewsModel *model = [[InformationNewsModel alloc]init];
        
        headerView.sourceArray = @[model,model,model,model];
        
    }else{
        
        headerView.sourceArray = self.headerArray;
        
    }
    
    headerView.isTimer =YES;
    
    [tableView addSubview:headerView];
    
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 190;
}


-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    LoadInformationViewController *loadInfoVC = [[LoadInformationViewController alloc]init];
    
    InformationNewsModel *model = self.dataArray[indexPath.row];
    
    loadInfoVC.strTitle = model.title;
    
    loadInfoVC.strUrl = model.url;
    
    [self.navigationController pushViewController:loadInfoVC animated:YES];
}







@end
