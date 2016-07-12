//
//  UniversitySearchViewController.m
//  首页
//
//  Created by puyantao on 16/6/18.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "UniversitySearchViewController.h"
#import "UniversityModel.h"
#import "UniversityChildrenModel.h"
#import "HomeCollectionCellViewController.h"

@interface UniversitySearchViewController ()<UISearchBarDelegate, UITableViewDelegate, UITableViewDataSource>
{
    UISearchBar *mySearchBar;
    NSMutableArray *researchArray;
    UITableView *myTableView;
    
}

@end

@implementation UniversitySearchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutNavigationBar];
    [self layoutUI];
    
}

#pragma mark *********************** private methods *******************************
- (void)layoutNavigationBar{
    UIView *imageNB = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    imageNB.backgroundColor = [UIColor colorWithRed:0.157 green:0.498 blue:0.463 alpha:1.000];
    [self.view addSubview:imageNB];
    
    mySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 20, kScreenWidth-80, 44)];
    if (self.tagBtn == 110) {
        mySearchBar.placeholder = @"请输入学校名";
        
    }else if (self.tagBtn == 111){
        mySearchBar.placeholder = @"请输入省份";
        
    }else if (self.tagBtn == 112){
        mySearchBar.placeholder = @"请输入分数";
        
    }
    mySearchBar.searchBarStyle = UISearchBarStyleDefault;
    mySearchBar.delegate = self;
    [imageNB addSubview:mySearchBar];
    
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeSystem];
    backBtn.frame = CGRectMake(kScreenWidth-60, 27, 40, 30);
    [backBtn setTitle:@"返回" forState:UIControlStateNormal];
    [backBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backSuperViewEvenv:) forControlEvents:UIControlEventTouchUpInside];
    backBtn.titleLabel.font = [UIFont systemFontOfSize:20];
    [imageNB addSubview:backBtn];
    
}


- (void)layoutUI{
    self.view.backgroundColor = [UIColor whiteColor];
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
}


- (void)backSuperViewEvenv:(UIButton *)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
    
}

#pragma mark ******************************* searchBar delegate ******************************
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    [searchBar resignFirstResponder];
    [researchArray removeAllObjects];
    
    if (self.tagBtn == 110) {
        researchArray = [NSMutableArray array];
        for (UniversityModel *sectionModel in self.dataArray) {
            NSPredicate *predicate = [NSPredicate predicateWithFormat:@"schoolName CONTAINS %@",searchBar.text];
            NSMutableArray *array = [[sectionModel.children filteredArrayUsingPredicate:predicate] mutableCopy];
            for (UniversityChildrenModel *rowModel in array) {
                [researchArray addObject:rowModel];
                
            }
            [array removeAllObjects];
            [myTableView reloadData];
            
        }
        
    }else if (self.tagBtn == 111){
        NSPredicate *predicate = [NSPredicate predicateWithFormat:@"city CONTAINS %@", searchBar.text];
        researchArray = [[self.dataArray filteredArrayUsingPredicate:predicate] mutableCopy];
        [myTableView reloadData];
        
    }else if (self.tagBtn == 112){
#warning 请输入分数查找无数据源，没有实现
        
    }
    
}

#pragma mark ******************************* tableView delegate ******************************
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.tagBtn == 111) {
        return researchArray.count;
        
    }
    return 1;
    
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (self.tagBtn == 110) {
        return researchArray.count;
        
    }else if(self.tagBtn == 111){
        UniversityModel *sectionModel = researchArray[section];
        return sectionModel.children.count;
        
    }else if(self.tagBtn == 112){
        return 10;
        
    }
    return 0;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    
    if (self.tagBtn == 110) {
        UniversityChildrenModel *rowModel = researchArray[indexPath.row];
        cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:rowModel.Slogo]]];
        cell.textLabel.text = rowModel.schoolName;

    }else if(self.tagBtn == 111){
        UniversityModel *sectionModel = researchArray[indexPath.section];
        UniversityChildrenModel *rowModel = sectionModel.children[indexPath.row];
        cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:rowModel.Slogo]]];
        cell.textLabel.text = rowModel.schoolName;
        
    }else if(self.tagBtn == 112){
#warning 请输入分数查找无数据源，没有实现
        
        
    }
    
    
    return cell;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 80;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.tagBtn == 111) {
        return 50;
        
    }
    return 0;
    
}


- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UILabel *headerLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 30)];
    UniversityModel *sectionModel = researchArray[section];
    headerLabel.text = sectionModel.city;
    headerLabel.textAlignment = NSTextAlignmentCenter;
    headerLabel.font = [UIFont systemFontOfSize:20];
    headerLabel.textColor = [UIColor blackColor];
    headerLabel.backgroundColor = [UIColor colorWithWhite:0.900 alpha:1.000];
    return headerLabel;
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tagBtn == 110) {
        UniversityChildrenModel *rowModel = researchArray[indexPath.row];
        HomeCollectionCellViewController *collectionCellVC = [[HomeCollectionCellViewController alloc]init];
        collectionCellVC.infoModel = rowModel;
        [self presentViewController:collectionCellVC animated:YES completion:nil];
        
    }else if(self.tagBtn == 111){
        UniversityModel *sectionModel = researchArray[indexPath.section];
        UniversityChildrenModel *rowModel = sectionModel.children[indexPath.row];
        HomeCollectionCellViewController *collectionCellVC = [[HomeCollectionCellViewController alloc]init];
        collectionCellVC.infoModel = rowModel;
        [self presentViewController:collectionCellVC animated:YES completion:nil];
        
    }else if(self.tagBtn == 112){
#warning 请输入分数查找无数据源，没有实现
        
    }
    
    
}



@end























