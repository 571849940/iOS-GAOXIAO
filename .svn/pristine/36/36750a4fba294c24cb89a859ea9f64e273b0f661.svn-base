//
//  WaterViewController.m
//  首页
//
//  Created by shiguanghua on 16/7/8.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "WaterViewController.h"

#import "XHLWaterLayout.h"

@interface WaterViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,XHLWaterLayoutDelegate>

@property(nonatomic,strong)UICollectionView *collectionVC;

@property(nonatomic,strong)XHLWaterLayout *layout;

@property(nonatomic,strong)NSArray *resourceArray;

@property(nonatomic,strong)NSArray *textArray;

@end

@implementation WaterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    //  self.view.backgroundColor = [UIColor redColor];
    _layout = [[XHLWaterLayout alloc]init];
    _layout.delegate = self;
    
    _collectionVC = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight-49-64) collectionViewLayout:_layout];
    _collectionVC.delegate = self;
    _collectionVC.dataSource = self;
    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景11.jpg"]];
    _collectionVC.backgroundView = imageView;
   // _collectionVC.backgroundColor = [UIColor grayColor];
    [self.view addSubview:_collectionVC];
    
 
    
    _resourceArray = @[@"http://img1.likefar.com/upload/images/2008/04/16/6836FC6E-125C-1647-EBE91678E96410F3_600.jpg",@"http://img1.likefar.com/upload/images/2010/06/23/EF0363AE-AE47-143A-A041FBC10F3C0771.jpg",@"http://img1.likefar.com/upload/images/2010/06/23/E2B13222-CD65-E16F-6EEF11885146B4F0.jpg",@"http://img1.likefar.com/upload/images/2010/06/23/16FEDFA5-DB9B-1821-395E16281C8ACA85.jpg",@"http://img1.likefar.com/upload/images/2010/06/23/1166A578-B695-7B70-102F60701659386F.jpg",@"http://img1.likefar.com/upload/images/2010/06/23/756405FA-FD1F-B902-3045F47037C4E8E2.jpg",@"http://img1.likefar.com/upload/images/2010/06/23/126FA989-D52E-FDEA-809114953B515452.jpg",@"http://img1.likefar.com/upload/images/2010/06/23/163704B4-172D-7CD5-B6F21390B46E4270.jpg",@"http://img1.likefar.com/upload/images/2010/06/23/D9834A95-8467-114E-9460E9CDE6A994E0.jpg",@"http://img1.likefar.com/upload/images/2008/04/16/129E0A47-FE64-AE32-02A7799331596FEE.jpg"];
    
    _textArray = @[@"北大西门 违反传统的朝向",@"北大校园",@"北京大学哲学系",@"未名湖 北大的灵魂",@"博雅塔 “一塔湖图”与“一塌糊涂”",@"图书馆 核心教学区",@"静园草坪",@"北京大学外国语学院",@"北京大学校长馆",@"红湖、朗润园 校园里的江南水乡",];
    
    [_collectionVC registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    self.title = self.title;
    self.navigationController.navigationBar.barTintColor = RGBCOLOR(69, 158, 150);
    //消除导航栏对视图的影响
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //让导航栏的背景颜色设置为不透明
    self.navigationController.navigationBar.translucent = NO;
    
    
    UIBarButtonItem *barBtn = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(pop)];
    
    self.navigationItem.backBarButtonItem = barBtn;
    
}


-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _resourceArray.count;
}


-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
//    NSURL *url = [NSURL URLWithString:self.resourceArray[indexPath.item]];
//    
//    NSData *data = [NSData dataWithContentsOfURL:url];
    
//    UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageWithData:data]];
    
   // UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:self.resourceArray[indexPath.item]]];
    
    UIImageView *cellImageView = [self loadImageData:indexPath.item];
    
    cell.backgroundView = cellImageView;
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, cellImageView.getFrame_Bottom-20, cellImageView.size.width, 20)];
    label.textColor = [UIColor whiteColor];
    label.font = [UIFont systemFontOfSize:12];
   // label.backgroundColor = [UIColor redColor];
    label.text = _textArray[indexPath.item];
    [cellImageView addSubview:label];
    return cell;
}

-(UIImageView *)loadImageData:(NSInteger)item
{
    UIImageView *_imageView = [[UIImageView alloc]init];

    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        NSURL *url = [NSURL URLWithString:self.resourceArray[item]];
        NSData *data = [NSData dataWithContentsOfURL:url];
        
        dispatch_async(dispatch_get_main_queue(), ^{
    
             _imageView.image = [UIImage imageWithData:data];
        });
        
    });
    
    return _imageView;
}



//返回格子的高度
-(CGFloat)waterLayout:(UICollectionViewLayout *)waterLayout itemWidth:(CGFloat)itemWidth indexPath:(NSIndexPath *)indexPath
{
    return 100 + arc4random()%90+50;
}



-(NSInteger)columnCountInWaterflowLayout:(UICollectionViewLayout *)layout
{
    return 2;
}



-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}


-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
}


-(void)pop
{
    [self.navigationController popViewControllerAnimated:YES];
}



@end
