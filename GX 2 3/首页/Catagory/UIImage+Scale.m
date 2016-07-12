//
//  UIImage+Scale.m
//  首页
//
//  Created by pangrenmeng on 16/6/6.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import "UIImage+Scale.h"

@implementation UIImage (Scale)

//将图片压缩到指定尺寸
-(UIImage *)imageScaleToSize:(CGSize)NewSize{
    
    UIGraphicsBeginImageContext(NewSize);
    
    [self drawInRect:CGRectMake(0, 0, NewSize.width, NewSize.height)];
    
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return newImage;
    
}

@end
