//
//  AppDelegate.m
//  首页
//
//  Created by shiguanghua on 16/6/6.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "AppDelegate.h"
#import "HomeViewController.h"
#import "UniversityViewController.h"
#import "InformationViewController.h"
#import "DrawerViewController.h"
#import "XRShareCenter.h"
#import "XRFilePath.h"
#import "XRConfig.h"
@interface AppDelegate ()

@end

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [XRFilePath creatDirectory];
    [XRShareCenter registerShareSDK];
    
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    [self.window makeKeyAndVisible];
    
    //使用第三方框架要注册
    [SMSSDK registerApp:@"13673c9cbdaf2" withSecret:@"4eca1cf42efb534d7b6e9c6d6d370664"];
    
   // [XRFilePath createDirectory];
    
    [XRFilePath creatDirectory];
    
    //判断文件是否存在单例的用户信息
    [[XRConfig shareConfig] loadAllUserInfo];
    
    
    
    [self setWindowRootController];
    return YES;
    
}

-(void)setWindowRootController
{
    //设置window的根控制器
    HomeViewController *homeVC = [[HomeViewController alloc]init];;
    UniversityViewController *universityVC = [[UniversityViewController alloc]init];
    InformationViewController *informationVC = [[InformationViewController alloc]init];
    
    UINavigationController *homeNavigation = [[UINavigationController alloc]initWithRootViewController:homeVC];
    homeNavigation.navigationBar.hidden = YES;
    homeNavigation.edgesForExtendedLayout = UIRectEdgeNone;
    
    UINavigationController *universityNavigation = [[UINavigationController alloc]initWithRootViewController:universityVC];
    universityNavigation.navigationBar.hidden = YES;
    universityNavigation.edgesForExtendedLayout = UIRectEdgeNone;
    
    UINavigationController *informationNavigation = [[UINavigationController alloc]initWithRootViewController:informationVC];
    informationNavigation.navigationBar.hidden = YES;
    informationNavigation.edgesForExtendedLayout = UIRectEdgeNone;
    
    UITabBarController *tabBarController = [[UITabBarController alloc]init];
    tabBarController.viewControllers = @[homeNavigation,universityNavigation,informationNavigation];
    
    //抽屉式图控制器
    PPRevealSideViewController *revealSideVC = [[PPRevealSideViewController alloc]initWithRootViewController:tabBarController];
    DrawerViewController *drawerViewController = [[DrawerViewController alloc]init];
    self.leftSlideVC = [[LeftSlideViewController alloc]initWithLeftView:drawerViewController andMainView:revealSideVC];
    self.window.rootViewController = self.leftSlideVC;
    
    //设置tabBar
    tabBarController.tabBar.barTintColor = [UIColor whiteColor];
    NSArray *titleArray = @[@"首页",@"高校",@"资讯"];
    NSArray *imageArray = @[@"shouye",@"kecheng",@"wode"];
    
    NSArray *selectImageArray = @[@"shouye_selected",@"kecheng_selected",@"wode_selected"];
    for (int index=0; index<tabBarController.tabBar.items.count; index++)
    {
        
        UITabBarItem *item = tabBarController.tabBar.items[index];
        item.title = titleArray[index];
       item.image = [UIImage imageNamed:imageArray[index]];
       item.selectedImage = [[UIImage imageNamed:selectImageArray[index]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];//忽视渲染的颜色，保留原始的图片颜色
        
        //设置字体选中时的颜色
        [[UITabBarItem appearance]setTitleTextAttributes:@{NSForegroundColorAttributeName:RGBCOLOR(66, 157, 150),NSFontAttributeName:[UIFont boldSystemFontOfSize:18]} forState:UIControlStateSelected];
        //设置字体的大小
        [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:13]} forState:UIControlStateNormal];
        
    }

    
    
    
}









- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
