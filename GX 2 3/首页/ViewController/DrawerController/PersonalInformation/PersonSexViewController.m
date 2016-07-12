//
//  PersonSexViewController.m
//  多线程
//
//  Created by cqy on 16/7/9.
//  Copyright © 2016年 刘征. All rights reserved.
//

#import "PersonSexViewController.h"

@interface PersonSexViewController (){
    NSString *string;
    
    NSString *string1;
}

@end

@implementation PersonSexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    string = @"男";

    string1 = @"女";
    
    
}
- (IBAction)backBtn:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
- (IBAction)changeGirl:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    _sexblock(string1);

}
- (IBAction)changeBoy:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
    
    
    _sexblock(string);

    
}
-(void)sendPerson:(SexBlock)block{
    _sexblock = block;
}

@end
