//
//  XRFilePath.m
//  学啊网练习
//
//  Created by shiguanghua on 16/6/4.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "XRFilePath.h"

#define kTmpPath NSTemporaryDirectory()

#define kTmpIconPath [kTmpPath stringByAppendingPathComponent:@"image"]



@implementation XRFilePath

+(void)creatDirectory
{
    NSFileManager *manager = [NSFileManager defaultManager];
    
   // NSString *tmpPath = NSTemporaryDirectory();
    
   // NSString *tmpIconPath = [tmpPath stringByAppendingPathComponent:@"image"];
    
    [manager createDirectoryAtPath:kTmpIconPath withIntermediateDirectories:YES attributes:nil error:nil];
    
}

+(NSString *)XRFilePath:(FilesType)fileType
{
    switch (fileType) {
            
        case FilesType_tmpIcon:
        {
            NSString *imagePath = [kTmpIconPath stringByAppendingPathComponent:@"image_101.jpg"];
            
            return imagePath;
            
        }break;
           
            
        default:
            break;
    }
   
   // return nil;
}

@end
