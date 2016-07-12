//
//  XRConfig.m
//  学啊网练习
//
//  Created by shiguanghua on 16/6/1.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "XRConfig.h"

static XRConfig *config = nil;

@implementation XRConfig

+(instancetype)shareConfig
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        config = [[XRConfig alloc]init];
    });
    return config;
}



+(BOOL)validatePhoneStr:(NSString *)phoneStr
{
    
    //正则表达式
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[0235-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";

    
    NSPredicate *mobilePredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",MOBILE];
    NSPredicate *cmPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CM];
    NSPredicate *cuPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",CU];
    
    if ([mobilePredicate evaluateWithObject:phoneStr] || [cmPredicate evaluateWithObject:phoneStr] || [cuPredicate evaluateWithObject:phoneStr])
    {
        return YES;
    }
    
    return NO;
}



-(void)setUserDict:(NSDictionary *)userDict
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    [defaults setObject:userDict forKey:kUserDict];
    
    [defaults synchronize];
    
    [self saveUserInfo:userDict];
}


-(void)saveUserInfo:(NSDictionary *)userDict
{
    
    self.password = userDict[@"password"];
    
    self.username = userDict[@"userName"];
    
//    self.realname = userDict[@"realname"];
//    
//    self.sex = userDict[@"sex"];
//    
//    self.email = userDict[@"email"];
//    
//    self.logo = userDict[@"logo"];
    
}



-(void)loadAllUserInfo
{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    NSDictionary *userDict = [defaults objectForKey:kUserDict];
    
    [self saveUserInfo:userDict];
    
    
}








@end
