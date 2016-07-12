//
//  UIViewController+AddNavigationBar.m
//  首页
//
//  Created by shiguanghua on 16/6/6.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "UIViewController+AddNavigationBar.h"
#import "HomeViewController.h"
#import "DrawerViewController.h"
#import "AppDelegate.h"

@implementation UIViewController (AddNavigationBar)


-(void)addCustomNavigationBarTitle:(NSString*)title isNeedDrawerBtn:(BOOL)isNeedDrawerBtn
{
    UIView *customNavigationBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    customNavigationBar.backgroundColor = RGBCOLOR(69, 158, 150);
    [self.view addSubview:customNavigationBar];
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(customNavigationBar.center.x-75, 20, 150, 44)];
    titleLabel.text = title;
    titleLabel.textColor = [UIColor whiteColor];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.font = [UIFont systemFontOfSize:22];
    [customNavigationBar addSubview:titleLabel];
    if (isNeedDrawerBtn)
    {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        backBtn.frame = CGRectMake(0, 20, 60, 44);
        [backBtn setImage:[UIImage imageNamed:@"drawer"] forState:UIControlStateNormal];
        [backBtn addTarget:self action:@selector(popBtn) forControlEvents:UIControlEventTouchUpInside];
        [customNavigationBar addSubview:backBtn];
        
        
    }
    
}



-(void)popBtn
{

//    DrawerViewController *drawerVC = [[DrawerViewController alloc]init];
//    [self.revealSideViewController pushViewController:drawerVC onDirection:PPRevealSideDirectionLeft animated:YES];
    [self openOrCloseLeftList];
    
}

- (void)openOrCloseLeftList{
    AppDelegate *tempAppDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    if (tempAppDelegate.leftSlideVC.closed) {
        [tempAppDelegate.leftSlideVC openLeftView];
        
    }else{
        [tempAppDelegate.leftSlideVC closeLeftView];
        
    }
    
}



-(void)addCustomNavigationBarTitle:(NSString*)title isNeedBackBtn:(BOOL)isNeedBackBtn isNeedShareBtn:(BOOL) isNeedShareBtn
{
    UIView *customNavigationBar = [[UIView alloc]initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
    
    customNavigationBar.backgroundColor = RGBCOLOR(69, 158, 150);
    
    [self.view addSubview:customNavigationBar];
    
    
    UILabel *titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(/*customNavigationBar.center.x-75*/0, 20, 200, 44)];
    
    titleLabel.text = title;
    
    titleLabel.textColor = [UIColor whiteColor];
    
    titleLabel.centerX = customNavigationBar.center.x;
    
    titleLabel.textAlignment = NSTextAlignmentCenter;
    
    titleLabel.font = [UIFont systemFontOfSize:21];
    
    [customNavigationBar addSubview:titleLabel];
    
    if (isNeedBackBtn)
    {
        UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        
        backBtn.frame = CGRectMake(0, 20, 60, 44);
        
        [backBtn setImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateNormal];
        
        //   [backBtn setImage:[UIImage imageNamed:@"backButton"] forState:UIControlStateHighlighted];
        
        [backBtn addTarget:self action:@selector(pop) forControlEvents:UIControlEventTouchUpInside];
        
        [customNavigationBar addSubview:backBtn];
    }
    
    
    
    
    if (isNeedShareBtn){
        UIButton *shareBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        shareBtn.frame = CGRectMake(kScreenWidth-60, 20, 60, 44);
        [shareBtn setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
        [shareBtn addTarget:self action:@selector(shareInfoEvent) forControlEvents:UIControlEventTouchUpInside];
        [customNavigationBar addSubview:shareBtn];

    }
    
    
    
    
    

}


- (void)shareInfoEvent{
    
    
}



-(void)pop
{
    //    if ([self.navigationController.visibleViewController isKindOfClass:[HomeViewController class]])
    //    {
    [self dismissViewControllerAnimated:YES completion:nil];
    //    }else
    //    {
    //    [self.navigationController popViewControllerAnimated:YES];
    //  }
    
    
}









@end
