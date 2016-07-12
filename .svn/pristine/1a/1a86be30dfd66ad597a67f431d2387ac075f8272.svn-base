//
//  SearchChangeCityViewController.m
//  首页
//
//  Created by cqy on 16/6/29.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "SearchChangeCityViewController.h"
#import "BigCityModel.h"
#import "ChangeCityModel.h"
#import "WeatherViewController.h"
@interface SearchChangeCityViewController ()<UISearchBarDelegate,UITableViewDelegate,UITableViewDataSource>{
    
    UISearchBar *mySearchBar;
    NSMutableArray *researchArray;
    UITableView *myTableView;
    NSArray *dataArray;
}

@end

@implementation SearchChangeCityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    [self loadData];
    UIView *imageNB = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    imageNB.backgroundColor = [UIColor colorWithRed:0.157 green:0.498 blue:0.463 alpha:1.000];
    [self.view addSubview:imageNB];
    
    mySearchBar = [[UISearchBar alloc]initWithFrame:CGRectMake(10, 20, kScreenWidth-80, 44)];
    
    mySearchBar.placeholder = @"请输入城市名字";
    
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
-(void)loadData{
    
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"zh_CN.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    
    dataArray = [BigCityModel mj_objectArrayWithKeyValuesArray:dict[@"data"]];
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [myTableView reloadData];
        
    });
}
-(void)backSuperViewEvenv:(UIButton *)sender{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (void)layoutUI{
    self.view.backgroundColor = [UIColor whiteColor];
    myTableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64) style:UITableViewStylePlain];
    myTableView.delegate = self;
    myTableView.dataSource = self;
    [self.view addSubview:myTableView];
    
}
-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
    
    [searchBar resignFirstResponder];
    
    [researchArray removeAllObjects];
    
    researchArray = [NSMutableArray array];
    
    for (BigCityModel *bigModel in dataArray) {
        
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"name CONTAINS %@",searchBar.text];
        
        
        NSMutableArray *array = [[bigModel.cityArray filteredArrayUsingPredicate:pred]mutableCopy];
        
        
        for (ChangeCityModel *cityModel in array) {
            
            
            [researchArray addObject:cityModel];
            
        }
        [array removeAllObjects];
        
        [myTableView reloadData];
        
    }
}



-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return researchArray.count;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
        
    }
    ChangeCityModel *cityModel = researchArray[indexPath.row];
    
    cell.backgroundColor = [UIColor lightGrayColor];
    
    cell.textLabel.text = cityModel.name;
    
    
    return cell;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 100;
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ChangeCityModel *cityModel = researchArray[indexPath.row];
    
    _myblock(cityModel.name);
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)sendCityName:(Myblock)block{
    _myblock = block;
}
@end
