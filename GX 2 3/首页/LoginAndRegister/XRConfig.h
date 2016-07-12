//
//  XRConfig.h
//  学啊网练习
//
//  Created by shiguanghua on 16/6/1.
//  Copyright © 2016年 shiguanghua. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XRConfig : NSObject

@property(nonatomic,copy)NSString *password;
@property(nonatomic,copy)NSString *username;
//@property(nonatomic,copy)NSString *realname;
//@property(nonatomic,copy)NSString *sex;
//@property(nonatomic,copy)NSString *email;
//@property(nonatomic,copy)NSString *logo;

+(instancetype)shareConfig;

-(void)setUserDict:(NSDictionary *)userDict;

//判断手机号的格式是否正确
+(BOOL)validatePhoneStr:(NSString *)phoneStr;

-(void)loadAllUserInfo;

@end
