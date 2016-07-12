//
//  XRRegisterVerifyCodeViewController.m
//  学啊网练习
//
//  Created by shiguanghua on 16/6/2.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "XRRegisterVerifyCodeViewController.h"
#import "XRRegisterSetPasswordViewController.h"
@interface XRRegisterVerifyCodeViewController ()
{
    int countNum;
    
    NSTimer *timer;
}
@property (weak, nonatomic) IBOutlet UILabel *hintLabel;

@property (weak, nonatomic) IBOutlet UITextField *verifyCodeTextField;

@property (weak, nonatomic) IBOutlet UILabel *resendLabel;

@property (weak, nonatomic) IBOutlet UIButton *resendBtn;

@end

@implementation XRRegisterVerifyCodeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self addCustomNavigationBarTitle:@"填写验证码" isNeedBackBtn:YES isNeedShareBtn:NO];
    
    NSString *hintStr = [NSString stringWithFormat:@"已经向手机号为%@发送验证码，请注意查收",self.phoneStr];
    
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc]initWithString:hintStr];
    
    [attributeStr addAttribute:NSForegroundColorAttributeName value:kUIColorFromRGB(0xf8740a) range:NSMakeRange([@"已经向手机号为"length], self.phoneStr.length)];
    
    self.hintLabel.attributedText = attributeStr;
    
    
    [self sendVerifyCode];
    
}


-(void)sendVerifyCode
{
    //请求验证码
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.phoneStr zone:@"86" customIdentifier:@"高校指南给你发送一条验证码" result:^(NSError *error) {
        
    }];
    
    countNum = 29;
    
    self.resendLabel.text = [NSString stringWithFormat:@"%d",countNum];
    
    self.resendBtn.enabled = YES;
    
    timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(updateTime) userInfo:nil repeats:YES];
    
    
    
}

-(void)updateTime
{
    countNum--;
    
    self.resendLabel.text = [NSString stringWithFormat:@"%d",countNum];
    
    if (countNum==0)
    {
        self.resendLabel.text = @"重新发送";
        
        self.resendBtn.enabled = YES;
        
        [timer invalidate];
    }
    
}



- (IBAction)gotoSetPasword
{
    
//    NSString *message = nil;
//    
//    NSString *verifyCodeStr = self.verifyCodeTextField.text;
//    
//    if (verifyCodeStr.length==0)
//    {
//        message = @"请输入验证码";
//        
//        [UIAlertController showMessageAlertView:message withTarget:self];
//    }else
//    {
//        [SMSSDK commitVerificationCode:self.verifyCodeTextField.text phoneNumber:self.phoneStr zone:@"86" result:^(NSError *error) {
//            if (error!=nil)
//            {
//                [UIAlertController showMessageAlertView:@"验证码有误" withTarget:self];
//            }else
//            {
               // [UIAlertController showMessageAlertView:@"验证码正确-》跳转" withTarget:self];
                
                XRRegisterSetPasswordViewController *setPasswordVC = [[XRRegisterSetPasswordViewController alloc]init];
    
                setPasswordVC.phoneNum = self.phoneStr;
    
                [self.navigationController pushViewController:setPasswordVC animated:YES];
                
//            }
//        }];
//        
//        
//        
//    }
    
    
    
    
}



- (IBAction)resendVerifyCode
{
    [self sendVerifyCode];
    
}


-(void)viewWillAppear:(BOOL)animated
{
    [self.verifyCodeTextField becomeFirstResponder];
}




@end
