//
//  WeatherViewController.m
//  首页
//
//  Created by cqy on 16/6/29.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "WeatherViewController.h"
#import "SearchWeatherModel.h"
#import "TodayWeatherModel.h"
#import "instrudctionIndexModel.h"
#import "SearchChangeCityViewController.h"
@interface WeatherViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    UITableView *mytableView;
    
    NSMutableArray *dataArray;
    
    TodayWeatherModel *model;
    
    NSMutableArray *intrudctionArray;
    
    SearchChangeCityViewController *searchController;
    UITableView *_intrudctionTableview;
    
    
}
@property (strong, nonatomic) IBOutlet UILabel *ShowDate;


@property (strong, nonatomic) IBOutlet UILabel *ShowTemperature;


@property (strong, nonatomic) IBOutlet UILabel *ShowWeather;

@property (strong, nonatomic) IBOutlet UILabel *ShowFengli;
@property (strong, nonatomic) IBOutlet UILabel *ShowCityName;

@end

@implementation WeatherViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor clearColor];
    
    searchController = [[SearchChangeCityViewController alloc]init];
    
    
    [searchController sendCityName:^(NSString *NameOfcity) {
        
        self.ShowCityName.text = NameOfcity;
        
        [self loadData];
        
    }];
    [self changeWeather];
    
    [self loadData];
}
-(void)loadData{
    
    NSString *path = [NSString stringWithFormat:@"http://apis.baidu.com/apistore/weatherservice/recentweathers?cityname=%@",self.ShowCityName.text];
    
    NSString* string2 = [path stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    
    NSURL *url = [NSURL URLWithString:string2];
    
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"GET";
    
    [request addValue:@"1d1198202d3f97b659fbe96af9754469" forHTTPHeaderField:@"apikey"];
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *sessionDataTask = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        
        NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
        
        NSArray *array = dict[@"retData"][@"forecast"];
        
        array = [SearchWeatherModel mj_objectArrayWithKeyValuesArray:array];
        dataArray =[NSMutableArray array];
        
        [dataArray addObjectsFromArray:array];
        
        model =[TodayWeatherModel mj_objectWithKeyValues:dict[@"retData"][@"today"]];
        
        NSArray *array1 = [instrudctionIndexModel mj_objectArrayWithKeyValuesArray:dict[@"retData"][@"today"][@"index"]];
        
        intrudctionArray = [NSMutableArray array];
        
        [intrudctionArray addObjectsFromArray:array1];
        
        //手动回到主线程更新UI
        dispatch_async(dispatch_get_main_queue(), ^{
            [mytableView reloadData];
            
            [_intrudctionTableview reloadData];
            
            
        });
        
    }];
    [sessionDataTask resume];
    
    
}
-(void)sendCityNameWithCur:(NameBlock)block{
    
    _nameblock = block;
}



- (IBAction)SearchCityBtn:(id)sender {
    
    [self presentViewController:searchController animated:YES completion:nil];

}
- (IBAction)backBtn:(id)sender {
    
    NSString *stringCityWithCur = [NSString stringWithFormat:@"%@  %@",self.ShowCityName.text,model.curTemp];
    
    _nameblock(stringCityWithCur);
    
    [self dismissViewControllerAnimated:YES completion:nil];

}

#pragma mark TableView delegate
-(void)changeWeather{
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 480, 414, 192)];
    imageView.image = [UIImage imageNamed:@"天气2"];
    [self.view addSubview:imageView];
    
    mytableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 480, 414, 192) style:UITableViewStylePlain];
    
    mytableView.backgroundColor = [UIColor clearColor];
    
    mytableView.delegate =self;
    mytableView.dataSource = self;
    [self.view addSubview:mytableView];
    
    _intrudctionTableview = [[UITableView alloc]initWithFrame:CGRectMake(0, 241, 414, 239) style:UITableViewStylePlain] ;
    
    _intrudctionTableview.backgroundColor = [UIColor clearColor];
    _intrudctionTableview.delegate = self;
    _intrudctionTableview.dataSource = self;
    
    [self.view addSubview:_intrudctionTableview];
    
}
#pragma mark UITableView delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if ([tableView isEqual:_intrudctionTableview]) {
        
        return intrudctionArray.count;
    }else if ([tableView isEqual:mytableView]){
        
        return dataArray.count;
        
    }
    return 0;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if ([tableView isEqual:mytableView]) {
        
        static NSString *cellID = @"cellID";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        cell.backgroundColor = [UIColor clearColor];
        
        SearchWeatherModel *weatherModel = dataArray[indexPath.row];
        
        NSString *detail = [NSString stringWithFormat:@"%@ %@      %@    %@~%@ ",weatherModel.date,weatherModel.week,weatherModel.type,weatherModel.lowtemp,weatherModel.hightemp];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        cell.textLabel.text = detail;
        
        NSString *stringWeek = [NSString stringWithFormat:@"%@ %@",model.date,model.week];
        
        
        NSString *strFeng = [NSString stringWithFormat:@"%@ %@",model.fengxiang,model.fengli];
        
        self.ShowDate.text = stringWeek;
        
        self.ShowTemperature.text =model.curTemp;
        self.ShowFengli.text =strFeng;
        
        self.ShowWeather.text =model.type;
        
        return cell;
        
    }else if ([tableView isEqual:_intrudctionTableview]){
        
        static NSString *cellID = @"cellID";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
        if (cell == nil) {
            
            cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        }
        
        cell.backgroundColor = [UIColor clearColor];
        
        instrudctionIndexModel *intrudModel = intrudctionArray[indexPath.row];
        
        
        NSString *stringIntrud = [NSString stringWithFormat:@"%@  %@",intrudModel.name,intrudModel.details];
        
        cell.textLabel.text = stringIntrud;
        
        cell.textLabel.numberOfLines = 10;
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cell;
    }
    
    return nil;
    
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    if ([tableView isEqual:_intrudctionTableview]) {
        
        return 120;
    }else if ([tableView isEqual:mytableView]){
        
        return 100;
    }
    
    return 0;
    
}
@end
