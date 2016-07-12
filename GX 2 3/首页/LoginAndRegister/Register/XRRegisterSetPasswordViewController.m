//
//  XRRegisterSetPasswordViewController.m
//  学啊网练习
//
//  Created by shiguanghua on 16/6/3.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "XRRegisterSetPasswordViewController.h"
#import "UIAlertController+ShowAlertViewControllerMessage.h"
#import "UIImage+Scale.h"
#import "XRFilePath.h"
#import "XRConfig.h"
@interface XRRegisterSetPasswordViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (weak, nonatomic) IBOutlet UIButton *uploadIconImage;

@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

@property(nonatomic,strong)UIImagePickerController *imagePickerController;

@property(nonatomic,assign)BOOL isSelectIconImage;

@end

@implementation XRRegisterSetPasswordViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self addCustomNavigationBarTitle:@"设置密码" isNeedBackBtn:YES isNeedShareBtn:NO];
    
    self.uploadIconImage.layer.cornerRadius = 50;
    
    self.uploadIconImage.clipsToBounds = YES;
    
}


#pragma mark private method

- (IBAction)uploadIconEvent:(UIButton *)sender
{
    
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"上传头像" preferredStyle:UIAlertControllerStyleActionSheet];
    
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"相册获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        self.imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        self.imagePickerController.mediaTypes = @[(NSString*)(kUTTypeImage) ];
        
        [self presentViewController:self.imagePickerController animated:YES completion:nil];
    }]];
    
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"拍照获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera])
        {
            self.imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            
            self.imagePickerController.mediaTypes = @[(NSString*)(kUTTypeImage)];
            
            [self presentViewController:self.imagePickerController animated:YES completion:nil];
        }else
        {
            [UIAlertController showMessageAlertView:@"该设备不支持摄像头" withTarget:self];
        }
        
        
    }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [self presentViewController:alertVC animated:YES completion:nil];
    
}



- (IBAction)didFinishedEvent:(UIButton *)sender
{
    if (self.isSelectIconImage==NO)
    {
        [UIAlertController showMessageAlertView:@"请设置头像" withTarget:self];
    }else if (self.passwordTextField.text.length==0)
    {
        [UIAlertController showMessageAlertView:@"请设置密码" withTarget:self];
    }else if (self.passwordTextField.text.length<6)
    {
        [UIAlertController showMessageAlertView:@"密码不能小于六位" withTarget:self];
    }else
    {
                //设置一个路径，来保存用户的信息
          //  NSString *filePath = [XRFilePath XRFilePath:FilesType_tmpIcon];
        
       // NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"user.plist"];
        
      NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"userList.plist"];
        
        NSMutableDictionary *dict = [NSMutableDictionary dictionaryWithContentsOfFile:filePath];
        
        NSLog(@"%@",filePath);
        
        if (dict == nil) {
            
            dict = [NSMutableDictionary dictionary];
        }
    
        dict[self.phoneNum] = self.passwordTextField.text;
        
        [[XRConfig shareConfig]setUserDict:@{@"userName":self.phoneNum,@"password":self.passwordTextField.text}];
        
        BOOL isSuccess = [dict writeToFile:filePath atomically:YES];
        
        if (isSuccess == YES) {
            
            //如果注册成功返回登录页面
            [self dismissViewControllerAnimated:YES completion:nil];
        }

        
    }
}



#pragma mark lazy load

-(UIImagePickerController *)imagePickerController
{
    if (_imagePickerController==nil)
    {
        _imagePickerController = [[UIImagePickerController alloc]init];
        
        _imagePickerController.delegate = self;
        
        _imagePickerController.allowsEditing = YES;
    }
    
    return _imagePickerController;
}


#pragma mark UIImagePickerController Delegate Method


-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info
{
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    //保留编辑后的图片
    UIImage *newImage = info[UIImagePickerControllerEditedImage];
    
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
       
        UIImage *scaleImage = [newImage imageScaleToSize:CGSizeMake(100, 100)];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            [self.uploadIconImage setBackgroundImage:scaleImage forState:UIControlStateNormal];
            
            self.isSelectIconImage = YES;
            
           NSString *imagePath = [XRFilePath XRFilePath:FilesType_tmpIcon];
            
           NSData *data = UIImageJPEGRepresentation(scaleImage, 0.75);
            
            [data writeToFile:imagePath atomically:YES];
            
            NSLog(@"%@",imagePath);
            
            
        });
        
        
    });
    
    
}



@end
