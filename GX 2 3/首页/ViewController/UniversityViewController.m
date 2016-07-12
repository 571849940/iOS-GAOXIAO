//
//  UniversityViewController.m
//  首页
//
//  Created by shiguanghua on 16/6/6.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "UniversityViewController.h"
#import "UniversityModel.h"
#import "UniversityChildrenModel.h"
#import "UniversitySearchViewController.h"
#import "HomeCollectionCellViewController.h"
#import "CustomUniversityTableViewCell.h"

@interface UniversityViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    UITableView *_tableView;
    
}

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *schoolNameLiftWitch;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *scraceRightWitch;

@property(nonatomic,retain)NSMutableArray *dataArray;

@end

@implementation UniversityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self addCustomNavigationBarTitle:@"高校" isNeedDrawerBtn:YES];
    _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 64+60, kScreenWidth, kScreenHeight-64-60-44) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self loadData];
    _tableView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景11.jpg"]];
    [self.view addSubview:_tableView];
    
}


- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    
    UIButton *btn = [self.view viewWithTag:111];
    float space = (self.view.width - btn.width * 3)/4;
    
    self.schoolNameLiftWitch.constant = space;
    self.scraceRightWitch.constant = space;
    [self.view.layer layoutIfNeeded];
    
    
}


-(void)loadData{
    NSString *path = [[NSBundle mainBundle]pathForResource:@"GX_school_info.json" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
    self.dataArray = [UniversityModel mj_objectArrayWithKeyValuesArray:dict[@"data"]];
    [_tableView reloadData];
    
}


- (IBAction)searchUniversityEvent:(UIButton *)sender {
    UniversitySearchViewController *searchVC = [[UniversitySearchViewController alloc]init];
    searchVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
    searchVC.tagBtn = sender.tag;
    searchVC.dataArray = self.dataArray;
    [self presentViewController:searchVC animated:YES completion:nil];
    
}


#pragma mark UITableView Delegate Datasource Method

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.dataArray.count+1;

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == 0) {
        return 0;
    }
    UniversityModel *model = self.dataArray[section-1];
    return model.children.count;
}


-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellId = @"CellID";
    CustomUniversityTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell==nil)
    {
        cell = [[CustomUniversityTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    UniversityModel *model = self.dataArray[indexPath.section-1];
    UniversityChildrenModel *childrenModel = model.children[indexPath.row];
    [cell.logoImageView sd_setImageWithURL:[NSURL URLWithString:childrenModel.Slogo] placeholderImage:nil];
    cell.backgroundColor = [UIColor clearColor];
//    cell.imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:childrenModel.logo]]];
   // cell.textLabel.text = childrenModel.schoolName;
    cell.titleLabel.text = childrenModel.schoolName;
    return cell;
    
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;

}



-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 124, kScreenWidth, 140)];
        NSArray *array = @[@"重点",@"艺术",@"一本",@"二本",@"三本",@"全部"];
        CGFloat btnWidth = 50;
        CGFloat btnDistance = (kScreenWidth-3*btnWidth)/4;
        int arrayNum = 0;
        
        for (int line=0; line<2; line++){
            for (int index=0; index<3; index++){
                UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake((btnDistance+btnWidth)*index+btnDistance, 10+70*line, 50, 50);
                btn.backgroundColor = [UIColor grayColor];
                [btn setTitle:array[arrayNum] forState:UIControlStateNormal];
                arrayNum++;
                btn.tag = arrayNum + 1000;
                [btn addTarget:self action:@selector(clickBtn:) forControlEvents:UIControlEventTouchUpInside];
                [view addSubview:btn];
                
            }
        }
        
        return view;

    }
    
    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0,kScreenWidth , 30)];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, kScreenWidth-20, 30)];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    UniversityModel *model = self.dataArray[section-1];
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.font = [UIFont boldSystemFontOfSize:25];
    titleLabel.text = model.city;
    [view addSubview:titleLabel];
    return view;
    
}


-(void)clickBtn:(UIButton *)sender{

    switch (sender.tag - 1000) {
        case 1:{
            [self chooseSchoolBatch:@"重点"];
        }
            break;
        case 2:{
            [self chooseSchoolBatch:@"艺术"];
        }
            break;
        case 3:{
            [self chooseSchoolBatch:@"一本"];
        }
            break;
        case 4:{
            [self chooseSchoolBatch:@"二本"];
        }
            break;
        case 5:{
            [self chooseSchoolBatch:@"三本"];
        }
            break;
        case 6:{
            [self loadData];
        }
            break;
        default:
            break;
    }

}

//重点
-(void)chooseSchoolBatch:(NSString *)batchStr{

    [self loadData];
    UniversityModel *universityModel = [[UniversityModel alloc]init];
    universityModel.city = batchStr;
    NSMutableArray *mArray = [NSMutableArray array];
    for (UniversityModel *unModel in self.dataArray) {
        
        for (UniversityChildrenModel *childModel in unModel.children) {
            
            if ([childModel.batch isEqualToString: batchStr]) {
                [mArray addObject:childModel];
            }
        }
    }
    universityModel.children = mArray;
    [self.dataArray removeAllObjects];
    [self.dataArray addObject:universityModel];
    [_tableView reloadData];

}




-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return 140;
    }
    return 30;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    HomeCollectionCellViewController *collectionVC = [[HomeCollectionCellViewController alloc]init];
    UniversityModel *sectionModel = self.dataArray[indexPath.section-1];
    collectionVC.infoModel = sectionModel.children[indexPath.row];
    [self presentViewController:collectionVC animated:YES completion:nil];
    
    
}



@end










