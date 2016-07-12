//
//  HomeCommentUserInfo.m
//  首页
//
//  Created by puyantao on 16/6/18.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "HomeCommentUserInfoViewController.h"

@interface HomeCommentUserInfoViewController ()<UIWebViewDelegate>
{
    UIWebView *userWebView;
    
}
@property (nonatomic,strong) UIActivityIndicatorView *indicatorView;


@end

@implementation HomeCommentUserInfoViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self layoutUI];
    [self loadWebView];
    
}

- (void)layoutUI{
#warning  感觉次页面不好看，等待解决
    self.view.backgroundColor = [UIColor redColor];
    [self addCustomNavigationBarTitle:self.model.userName isNeedBackBtn:YES isNeedShareBtn:YES];
    userWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-64)];
    userWebView.scalesPageToFit = YES;
    userWebView.delegate = self;
    userWebView.dataDetectorTypes = UIDataDetectorTypeAll;
    [self.view addSubview:userWebView];
    

    //无敌风火轮
    
    self.indicatorView = [[UIActivityIndicatorView alloc]init];
    self.indicatorView.center = self.view.center;
    [self.view addSubview:self.indicatorView];
    self.indicatorView.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    
}
- (void)loadWebView{
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:self.model.commentURL]];
    [userWebView loadRequest:request];

}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.indicatorView stopAnimating];
    UIAlertController *alerc = [UIAlertController alertControllerWithTitle:@"请检查网络设置" message:nil preferredStyle:UIAlertControllerStyleAlert];
    [alerc addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
    
    }]];
    [self presentViewController:alerc animated:YES completion:nil];
    
}


-(void)webViewDidFinishLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    [self.indicatorView stopAnimating];

}


-(void)webViewDidStartLoad:(UIWebView *)webView{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.indicatorView startAnimating];
    
}


@end













