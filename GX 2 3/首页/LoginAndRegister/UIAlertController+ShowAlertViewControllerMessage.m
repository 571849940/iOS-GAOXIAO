//
//  UIAlertController+ShowAlertViewControllerMessage.m
//  学啊网练习
//
//  Created by shiguanghua on 16/6/1.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "UIAlertController+ShowAlertViewControllerMessage.h"

@implementation UIAlertController (ShowAlertViewControllerMessage)

+(void)showMessageAlertView:(NSString *)message withTarget:(UIViewController *)target
{
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [target presentViewController:alertVC animated:YES completion:nil];
    
}
@end
