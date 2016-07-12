//
//  LoadInformationViewController.m
//  首页
//
//  Created by shiguanghua on 16/7/8.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "LoadInformationViewController.h"

@interface LoadInformationViewController ()

@property(nonatomic,strong)UIWebView *webView;

@end

@implementation LoadInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
   // [self addCustomNavigationBarTitle:self.strTitle isNeedBackBtn:YES isNeedShareBtn:NO];
    
    self.navigationController.navigationBar.barTintColor = RGBCOLOR(69, 158, 150);
    //消除导航栏对视图的影响
    self.edgesForExtendedLayout = UIRectEdgeNone;
    //让导航栏的背景颜色设置为不透明
    self.navigationController.navigationBar.translucent = NO;

    self.title = self.strTitle;
  //  self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStyleDone target:self action:@selector(pop)];
    
    self.webView = [[UIWebView alloc]initWithFrame:self.view.frame];
    
    [self.view addSubview:self.webView];
    
    [self loadData];
    
    
}


-(void)loadData
{
   // NSLog(@"%@********",[NSThread currentThread]);
    
    NSURL *url = [NSURL URLWithString:self.strUrl];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    
    [self.webView loadRequest:request];
    
    //使加载的页面适应屏幕的尺寸
    self.webView.scalesPageToFit = YES;
}



//-(void)pop
//{
//    [self.navigationController popViewControllerAnimated:YES];
//}






-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.hidden = NO;
}

-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = YES;
}

@end
