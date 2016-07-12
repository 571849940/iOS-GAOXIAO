//
//  DrawerViewController.m
//  首页
//
//  Created by pangrenmeng on 16/6/6.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "DrawerViewController.h"
#import "WeatherViewController.h"

#define kTmpPath NSTemporaryDirectory()

#define kTmpIconPath [kTmpPath stringByAppendingPathComponent:@"image"]

@interface DrawerViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>{
    
    WeatherViewController *weather;
    

}

@property (weak, nonatomic) IBOutlet UIButton *iconImageBtn;

@property(nonatomic,retain)UIImagePickerController *pickerController;
@property(nonatomic,assign)BOOL isSelectIconImage;

@property (strong, nonatomic) IBOutlet UILabel *showCurWithCity;



@end

@implementation DrawerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    weather = [[WeatherViewController alloc]init];
    
    [weather sendCityNameWithCur:^(NSString *cityWithCur) {
        
        self.showCurWithCity.text = cityWithCur;
        
    }];

    self.iconImageBtn.layer.cornerRadius = 50;
    self.iconImageBtn.clipsToBounds = YES;
    
   NSString *filePath = [kTmpIconPath stringByAppendingPathComponent:@"image_101.jpg"];
    
    
    UIImage *image = [UIImage imageWithContentsOfFile:filePath];
    
    [self.iconImageBtn setBackgroundImage:image forState:UIControlStateNormal];
    
    //[self.iconImageBtn setBackgroundImage:[UIImage imageWithContentsOfFile:[kTempPath stringByAppendingPathComponent:@"icon_200_200.jpg"]] forState:UIControlStateNormal];
    
}

- (IBAction)iconImageBtn:(id)sender {
    //头像
    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:@"提示" message:@"修改头像" preferredStyle:UIAlertControllerStyleActionSheet];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"相册获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        self.pickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        //self.pickerController.mediaTypes = @[(NSString *)kUTTypeImage];
        
        [self presentViewController:self.pickerController animated:YES completion:nil];
        
    }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"拍照获取" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
        if ([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera]) {
            
            self.pickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
            //self.pickerController.mediaTypes = @[(NSString *)kUTTypeImage];
            
            [self presentViewController:self.pickerController animated:YES completion:nil];
            
        }else{
            
          //  [UIAlertController showAlertControllerMessage:@"不支持摄像头" WithTaraget:self];
            
            
        }
        
    }]];
    
    [alertVC addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        
    }]];
    
    [self presentViewController:alertVC animated:YES completion:nil];
  
}

- (IBAction)informationBtn:(id)sender {
    //个人资料
    
    
}

- (IBAction)collectionBtn:(id)sender {
    //收藏
    
    
}

- (IBAction)loginOrExitBtn:(id)sender {
   //登录或退出
    
    
}
- (IBAction)weatherTianqi:(id)sender {
    
    [self presentViewController:weather animated:YES completion:nil];

}

#pragma mark lazy load

-(UIImagePickerController *)pickerController{
    
    if (_pickerController == nil) {
        _pickerController = [[UIImagePickerController alloc]init];
        _pickerController.delegate = self;
        _pickerController.allowsEditing = YES;
    }
    return _pickerController;
    
}

#pragma mark UIImagePickerC delegate

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    
    [picker dismissViewControllerAnimated:YES completion:nil];
    
    UIImage *image = info[UIImagePickerControllerEditedImage];
    
    NSLog(@"%@",image);
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [image imageScaleToSize:CGSizeMake(200, 200)];
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            self.isSelectIconImage = YES;
            
            [self.iconImageBtn setBackgroundImage:image forState:UIControlStateNormal];
            NSString *filePath = [XRFilePath XRFilePath:FilesType_tmpIcon];
            
            NSLog(@"%@",filePath);
            
            NSData *data =  UIImageJPEGRepresentation(image, 0.75);
            
            [data writeToFile:filePath atomically:YES];
            
        });
        
    });
    
 
}


@end
