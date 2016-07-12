//
//  HeaderBannerView.m
//  首页
//
//  Created by pangrenmeng on 16/6/10.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "HeaderBannerView.h"
#import "InformationNewsModel.h"

@interface HeaderBannerView ()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

{
    UICollectionView *_collectionView;
    
    UIPageControl *pageController;
    
    NSTimer *timer;
    
    UICollectionViewFlowLayout *layout;
}

@end


@implementation HeaderBannerView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setCollectionView:frame];
        
        pageController = [[UIPageControl alloc]initWithFrame:CGRectMake(0, frame.size.height-20, frame.size.width, 20)];
        
        pageController.backgroundColor = [UIColor clearColor];
        
        [self addSubview:pageController];
    }
    return self;
}


-(void)setCollectionView:(CGRect)frame
{
    
    layout = [[UICollectionViewFlowLayout alloc]init];
    
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height) collectionViewLayout:layout];
    
    [self addSubview:_collectionView];
    
    layout.itemSize = CGSizeMake(frame.size.width, frame.size.height);
    
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    layout.minimumLineSpacing = 0;
    
    _collectionView.pagingEnabled = YES;
    
    [_collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"cell"];
    
    _collectionView.delegate = self;
    
    _collectionView.dataSource = self;
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap)];
    [_collectionView addGestureRecognizer:tap];
    
    
}

-(void)tap
{
    if ([self.delegate respondsToSelector:@selector(bannerViewClickPage:)])
    {
        [self.delegate bannerViewClickPage:pageController.currentPage];
    }
    
}









#pragma mark UICollection Delegate DataScoure DelegateLayout Method




-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 100;
}





-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.sourceArray.count;
}





-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor grayColor];
    
    
    //    UIImage *image = [UIImage imageNamed:_sourceArray[indexPath.item]];
    
    InformationNewsModel *model = self.sourceArray[indexPath.item];
    
    
    UIImageView *imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,self.frame.size.width , self.frame.size.height)];
    
    imageView.image = [UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:model.img_url]]];
    
    imageView.backgroundColor = [UIColor orangeColor];
    
    cell.backgroundView = imageView;
    
    
    UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(10, imageView.getFrame_Bottom-50, kScreenWidth-20, 30)];
    
    label.text = model.title;
    
    label.font = [UIFont systemFontOfSize:15];
    label.textColor = [UIColor blackColor];
    
    label.backgroundColor = RGBACOLOR(255, 255, 255, 0.7);
    
    [cell.backgroundView addSubview: label];
    
    
    
    
    return cell;
}





//一赋值就调用
-(void)setSourceArray:(NSArray *)sourceArray
{
    
    _sourceArray = sourceArray;
    
    pageController.numberOfPages = sourceArray.count;
    
    [_collectionView reloadData];
    
    //在0段滑动的时候，跳转到第50段
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:0 inSection:100/2] atScrollPosition:UICollectionViewScrollPositionNone  animated:YES];
    
}





-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //  int page = (int)(scrollView.contentOffset.x/scrollView.frame.size.width+0.5)%self.sourceArray.count;
    
    // NSLog(@"%lu",(int)(scrollView.contentOffset.x/scrollView.frame.size.width+0.5)%self.sourceArray.count);
    //获取到点击的哪个图片
    pageController.currentPage = (int)(scrollView.contentOffset.x/scrollView.frame.size.width+0.5)%self.sourceArray.count;
    
    
    
}



-(void)setIsTimer:(BOOL)isTimer
{
    _isTimer = isTimer;
    
    if (isTimer==YES)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    }
    
    
    
    
}


- (void)nextPage{
    //获取到当前显示的是第几段
    NSIndexPath *currentIndexPath = [_collectionView.indexPathsForVisibleItems lastObject];
    
    //  NSLog(@"%@",currentIndexPath);
    
    NSIndexPath *currentIndexPathReset = [NSIndexPath indexPathForItem:currentIndexPath.item inSection:100/2];
    
    // NSLog(@"%@",currentIndexPathReset);
    
    [_collectionView scrollToItemAtIndexPath:currentIndexPathReset atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
    
    //准备下一个item
    NSInteger currentItem = currentIndexPath.item;
    
    currentItem++;
    
    NSInteger nextItem = currentItem;
    
    //准备下一个section
    NSInteger currentSection = currentIndexPathReset.section;
    
    if (nextItem == self.sourceArray.count) {
        
        currentSection++;
        nextItem = 0;
    }
    
    NSInteger nextSection = currentSection;
    
    [_collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:nextItem inSection:nextSection] atScrollPosition:UICollectionViewScrollPositionNone animated:YES];
    
}




//左右滑动的时候调用该方法，让定时器停止
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    timer.fireDate = [NSDate distantFuture];
}

//结束左右滑动的时候调用该方法，让定时器在两秒后重新开始
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    timer.fireDate = [NSDate dateWithTimeIntervalSinceNow:5.0];
}






-(void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
    
    _collectionView.frame = CGRectMake(0, 0, frame.size.width, frame.size.height);
    
    layout.itemSize = frame.size;
    
    pageController.frame = CGRectMake(0, frame.size.height-20, frame.size.width, 20);
    
    [_collectionView reloadData];
    
}





-(void)dealloc
{
    [timer invalidate];
    
    timer = nil;
}




@end
