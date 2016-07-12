//
//  XRFilePath.h
//  学啊网练习
//
//  Created by shiguanghua on 16/6/4.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    FilesType_tmpIcon,
    
} FilesType;
@interface XRFilePath : NSObject

+(void)creatDirectory;

+(NSString*)XRFilePath:(FilesType)fileType;

@end
