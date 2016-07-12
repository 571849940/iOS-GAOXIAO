//
//  XRRegisterViewController.m
//  学啊网练习
//
//  Created by shiguanghua on 16/6/2.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "XRRegisterViewController.h"
#import "XRRegisterVerifyCodeViewController.h"
#import "UIViewController+AddNavigationBar.h"
#import "XRConfig.h"
#import "UIAlertController+ShowAlertViewControllerMessage.h"
@interface XRRegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *phoneTextField;

@end

@implementation XRRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self addCustomNavigationBarTitle:@"请输入手机号" isNeedBackBtn:YES isNeedShareBtn:NO];


}

- (IBAction)gotoVerifyCodeViewController
{
    
    NSString *phoneStr = self.phoneTextField.text;
    
    NSString *message = nil;
    
    if (phoneStr.length==0)
    {
        message = @"请输入手机号";
    }else if([XRConfig validatePhoneStr:phoneStr])
    {
        XRRegisterVerifyCodeViewController *verifyCodeViewController = [[XRRegisterVerifyCodeViewController alloc]init];
        
        verifyCodeViewController.phoneStr = phoneStr;
        
        [self.navigationController pushViewController:verifyCodeViewController animated:YES];
    }else
    {
        message = @"请输入正确的手机号";
    }
    
    if (message != nil)
    {
        [UIAlertController showMessageAlertView:message withTarget:self];
    }
    
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.phoneTextField becomeFirstResponder];

}







@end
