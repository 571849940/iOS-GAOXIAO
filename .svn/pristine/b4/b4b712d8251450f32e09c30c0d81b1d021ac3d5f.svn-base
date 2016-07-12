//
//  XRLoginViewController.m
//  学啊网练习
//
//  Created by shiguanghua on 16/6/1.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "XRLoginViewController.h"
#import "XRRegisterViewController.h"
#import "XRConfig.h"
#import "HomeViewController.h"
#import "UIAlertController+ShowAlertViewControllerMessage.h"
@interface XRLoginViewController ()<UITextFieldDelegate>

@end

@implementation XRLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //设置带格式的字符串
    self.phoneTextField.attributedPlaceholder = [[NSMutableAttributedString alloc]initWithString:@"请输入手机号" attributes:@{NSForegroundColorAttributeName:kUIColorAFromRGB(0xFFFFFF, 0.5),NSFontAttributeName:[UIFont boldSystemFontOfSize:18]}];
    
    self.passwordTextField.attributedPlaceholder = [[NSMutableAttributedString alloc]initWithString:@"请输入密码" attributes:@{NSFontAttributeName:[UIFont boldSystemFontOfSize:18],NSForegroundColorAttributeName:kUIColorAFromRGB(0xFFFFFF, 0.5)}];
    
    
    
}


- (IBAction)loginBtnEvent
{
    NSString *message = nil;
    
    NSString *phoneStr = self.phoneTextField.text;
    
    NSString *passwordStr = self.passwordTextField.text;
    
    if (phoneStr.length==0)
    {
        message = @"请输入手机号";
    }else if ([XRConfig validatePhoneStr:phoneStr]==NO)
    {
       //验证手机号的格式是否正确
        
        message = @"请输入正确的手机号";
        
    }else if (passwordStr.length==0)
    {
        message = @"请输入密码";
    }else if (passwordStr.length<6)
    {
        message = @"密码不能小于六位";
    }else
    {
        
        NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"userList.plist"];;
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
        
        
        
        if (dict == nil) {
            
            message = @"该账号未注册";
            
        }

        NSEnumerator *resultKeys = dict.keyEnumerator;
        NSString *temp;
        while (temp = [resultKeys nextObject]) {
            
            if ([temp isEqualToString:phoneStr]) {
                
                if ([dict[temp] isEqualToString:passwordStr]) {
                    
                 [self dismissViewControllerAnimated:YES completion:nil];
                    
                [MBProgressHUD showHUDAddedTo:self.view animated:YES];
                
                }
            }
        }

        
        
        
       // NSLog(@"登录成功");
        //通过MBProgressHUD框架加载风火轮视图
       
        
//        PPRevealSideViewController *revealSideVC = [[PPRevealSideViewController alloc]init];
//        
//        [self presentViewController:revealSideVC animated:YES completion:nil];
        
        
//        [XRInterNetControllerCenter sendRequestInternetType:XR_InternetType_userLogin withParams:@{kUserName:phoneStr,kPassword:passwordStr} withFilePath:nil withComplcationBlock:^(NSDictionary *resultData, int errorCode, NSError *error) {
//            
//            [MBProgressHUD hideHUDForView:self.view animated:YES];
//            
//            NSString *message = nil;
//            
//            if (errorCode==200 && error==nil)
//            {
//                message = @"登录成功";
//                
//            }else if (errorCode==1)
//            {
//                message = @"用户名为空";
//            }else if (errorCode==2)
//            {
//                message = @"用户名或密码错误";
//            }else
//            {
//                message = @"未知错误";
//            }
//            
//            if (message!=nil)
//            {
//                [UIAlertController showMessageAlertView:message withTarget:self];
//            }
//
//            
//        }];
    }
    
    if (message!=nil)
    {
        [UIAlertController showMessageAlertView:message withTarget:self];
    }
    
    
    
}



- (IBAction)registerBtnEvent
{
    
    XRRegisterViewController *registerVC = [[XRRegisterViewController alloc]init];
    UINavigationController *navigation = [[UINavigationController alloc]initWithRootViewController:registerVC];
    navigation.navigationBar.hidden = YES;
    [self presentViewController:navigation animated:YES completion:nil];
    
    
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.phoneTextField becomeFirstResponder];
}



-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if (textField == self.passwordTextField)
    {
        [self loginBtnEvent];
    }
    
    return YES;
}






@end
