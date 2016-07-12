//
//  PersonInformationViewController.m
//  多线程
//
//  Created by cqy on 16/7/9.
//  Copyright © 2016年 刘征. All rights reserved.
//

#import "PersonInformationViewController.h"
#import "PersonSexViewController.h"
@interface PersonInformationViewController (){
    PersonSexViewController *personCon;
}


@property (strong, nonatomic) IBOutlet UITextField *writePersonName;

@property (strong, nonatomic) IBOutlet UILabel *writePersonInformation;

@property (strong, nonatomic) IBOutlet UITextField *writeIntrudction;

@end

@implementation PersonInformationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    personCon = [[PersonSexViewController alloc]init];
    
    
    [personCon sendPerson:^(NSString *sexBlock) {
        
        _writePersonInformation.text = sexBlock;
    }];

}
- (IBAction)keepInformation:(id)sender {
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
    NSString *string = [NSString stringWithFormat:@"%@",_writePersonName.text];
    
    
    _perblock(string);

    
    
}
- (IBAction)changeBoyGirl:(id)sender {
    
    [self presentViewController:personCon animated:YES completion:nil];

    
}

- (IBAction)backBtn:(id)sender {
    
[self dismissViewControllerAnimated:YES completion:nil];
    
}
-(void)sendPerson:(PersonBlock)block{
    
    
    _perblock = block;
    
}

@end
