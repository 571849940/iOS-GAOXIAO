//
//  HomeViewController.m
//  首页
//
//  Created by shiguanghua on 16/6/6.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "HomeViewController.h"
#import "BannerView.h"
#import "CustomCollectionReusableView.h"
#import "CustomCollectionViewCell.h"
#import "WaterViewController.h"
#import "XRConfig.h"
#import "XRLoginViewController.h"

@interface HomeViewController ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
{
    UICollectionView *_collectionView;
    UICollectionViewFlowLayout *layout;
    BannerView *bannerView;
    NSArray *viewImageArray;
    NSArray *directoryArray;
    NSArray *viewTitleArray;
    
    NSArray *grilImageArray;
    NSArray *grilTitleArray;
    
    NSArray *hostelImageArray;
    NSArray *hostelTitleArray;
}

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addCustomNavigationBarTitle:@"首页" isNeedDrawerBtn:YES];
    
    
    //判断单例对象是否存在，如果不存在跳转到登录界面
    if ([XRConfig shareConfig].username==nil)
    {
        XRLoginViewController *xrLoginVC = [[XRLoginViewController alloc]init];
        
        [self presentViewController:xrLoginVC animated:YES completion:nil];
    }

    
   // UIImageView *backImageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"beijing.jpg"]];
    
  //  backImageView.frame = CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-44);
    [self layoutUI];
    
   // _collectionView.backgroundView = backImageView;
    
    
    viewImageArray = @[@"北京大学.jpg",@"广州中山大学.jpg",@"清华大学.jpg",@"苏州大学.jpg",@"武汉大学.jpg",@"厦门大学.jpg"];
    
    directoryArray = @[@"风景美的学校",@"住宿条件好的学校",@"美女多的学校"];
    
    viewTitleArray = @[@"北京大学",@"广州中山大学",@"清华大学",@"苏州大学",@"武汉大学",@"厦门大学"];
    
    grilImageArray = @[@"天津工业大学.jpg",@"中国传媒大学.jpg",@"北京电影学院.jpg",@"大连理工大学.jpg",@"郑州大学.jpg",@"山东师范大学.jpg"];
    
    
    grilTitleArray =  @[@"天津工业大学",@"中国传媒大学",@"北京电影学院",@"大连理工大学",@"郑州大学",@"山东师范大学"];
    
    
    hostelImageArray = @[@"北京邮电大学.jpg",@"北京语言大学.jpg",@"汕头大学.jpg",@"深圳大学.jpg",@"天津大学.jpg",@"中山大学.jpg"];
    
    hostelTitleArray = @[@"北京邮电大学",@"北京语言大学",@"汕头大学",@"深圳大学",@"天津大学",@"中山大学"];
    
    
    
}

-(void)layoutUI{
    
    layout = [[UICollectionViewFlowLayout alloc]init];
    //layout.headerReferenceSize = CGSizeMake(0, 150);

    
    
    switch ([FSCodeLayout iphoneType])
    {
        case FSiPhoneType_4s:
        {
            layout.itemSize = CGSizeMake(135, 90);
        }
            break;
        case FSiPhoneType_5s:
        {
            layout.itemSize = CGSizeMake(135, 90);
        }
            break;
        case FSiPhoneType_6:
        {
            layout.itemSize = CGSizeMake(160, 115);
        }
            break;
        case FSiPhoneType_6plus:
        {
            layout.itemSize = CGSizeMake(190, 130);
        }
            break;
            
        default:
            break;
    }

    
    
    
    
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(5, 10, 5, 10);
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64-44)collectionViewLayout:layout];
    
    _collectionView.delegate = self;
    _collectionView.dataSource  = self;
    
    [_collectionView registerClass:[CustomCollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    _collectionView.backgroundColor = RGBCOLOR(222, 222, 222);
    
    _collectionView.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"背景11.jpg"]];
    
    [_collectionView registerClass:[CustomCollectionReusableView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"header"];
    bannerView = [[BannerView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 150)];
    bannerView.sourceArray = @[@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg"];
    bannerView.isTimer = NO;
    [_collectionView addSubview:bannerView];

    [self.view addSubview:_collectionView];
}


#pragma mark  Delegate DataSoure Method


-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 4;
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    if (section==0)
    {
        return 0;
    }
    return 6;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    CustomCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    
   // cell.backgroundColor = [UIColor greenColor];
    
    if (indexPath.section==1)
    {
       // cell.backgroundView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageArray[indexPath.item]]];
        
        cell.imageView.image = [UIImage imageNamed:viewImageArray[indexPath.item]];
        
        cell.titleLabel.text = viewTitleArray[indexPath.item];
    }else if(indexPath.section==2)
    {
        cell.imageView.image = [UIImage imageNamed:hostelImageArray[indexPath.item]];
        
        cell.titleLabel.text = hostelTitleArray[indexPath.item];
    }else
    {
        cell.imageView.image = [UIImage imageNamed:grilImageArray[indexPath.item]];
        cell.titleLabel.text = grilTitleArray[indexPath.item];
    }
    
    
    return cell;

}



//设置断头，代理自动挂
-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section{

    if (section==0)
    {
        return CGSizeMake(0, 150);
    }else
    {
        return CGSizeMake(0, 44);
        
    }

    
}


-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionReusableView *header = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"header" forIndexPath:indexPath];
    
    if (indexPath.section == 0)
    {
        
    }else
    {
        
        header.titleLabel.text = directoryArray[indexPath.section-1];
        
       header.titleLabel.frame = CGRectMake(0, 0, kScreenWidth, 44);
    }

    return header;
    
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{

    WaterViewController *waterVC = [[WaterViewController alloc]init];
    
    if (indexPath.section==1) {
        waterVC.title = viewTitleArray[indexPath.item];
    }else if (indexPath.section==2){
        waterVC.title = hostelTitleArray[indexPath.item];
    }else{
        waterVC.title = grilTitleArray[indexPath.item];
    }
    
    
    [self.navigationController pushViewController:waterVC animated:YES];
    
}



//-(void)viewWillDisappear:(BOOL)animated
//{
//    [super viewWillDisappear:animated];
//    
//    self.navigationController.navigationBar.hidden = YES;
//}









@end
