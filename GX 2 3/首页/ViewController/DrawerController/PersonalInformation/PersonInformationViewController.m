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

    NSArray *paths=NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES);
    NSString *path=[paths    objectAtIndex:0];
    NSLog(@"path = %@",path);
    NSString *filename=[path stringByAppendingPathComponent:@"test.plist"];
    NSFileManager* fm = [NSFileManager defaultManager];
    [fm createFileAtPath:filename contents:nil attributes:nil];
    //NSDictionary* dic = [NSDictionary dictionaryWithContentsOfFile:plistPath];
    
    //创建一个dic，写到plist文件里
    NSDictionary* dic = [NSDictionary dictionaryWithObjectsAndKeys:_writePersonName.text,@"昵称",_writePersonInformation.text,@"性别",_writeIntrudction.text,@"简介",nil];
    [dic writeToFile:filename atomically:YES];
    
    //读文件
    NSDictionary* dic2 = [NSDictionary dictionaryWithContentsOfFile:filename];
    NSLog(@"dic is:%@",dic2);
    
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
