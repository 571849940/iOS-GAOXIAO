//
//  XRShareCenter.m
//  XUER
//
//  Created by puyantao on 16/7/3.
//  Copyright © 2016年 GG. All rights reserved.
//

#import "XRShareCenter.h"


@implementation XRShareCenter

+(void)registerShareSDK{
    [ShareSDK registerApp:@"1487c0ee225fc"
     
          activePlatforms:@[
                            @(SSDKPlatformTypeSinaWeibo),
                            @(SSDKPlatformSubTypeWechatSession),
                            @(SSDKPlatformSubTypeQQFriend),
                            @(SSDKPlatformSubTypeWechatTimeline)]
     
                 onImport:^(SSDKPlatformType platformType){
         switch (platformType){
                 
             case SSDKPlatformSubTypeWechatSession:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             case SSDKPlatformSubTypeQQFriend | SSDKPlatformSubTypeQZone:
                 [ShareSDKConnector connectQQ:[QQApiInterface class] tencentOAuthClass:[TencentOAuth class]];
                 break;
             case SSDKPlatformTypeSinaWeibo:
                 [ShareSDKConnector connectWeibo:[WeiboSDK class]];
                 break;
             case SSDKPlatformSubTypeWechatTimeline:
                 [ShareSDKConnector connectWeChat:[WXApi class]];
                 break;
             default:
                 break;
                 
         }
     }
          onConfiguration:^(SSDKPlatformType platformType, NSMutableDictionary *appInfo){
         
         switch (platformType){
             case SSDKPlatformTypeSinaWeibo:
                 //设置新浪微博应用信息,其中authType设置为使用SSO＋Web形式授权
                 [appInfo SSDKSetupSinaWeiboByAppKey:@"1826486655"
                                           appSecret:@"6a454224fda55eda01b586d05e11ee11"
                                         redirectUri:@"http://www.xuer.com"
                                            authType:SSDKAuthTypeBoth];
                 break;
             
             //微信平台
             case SSDKPlatformTypeWechat:
                 [appInfo SSDKSetupWeChatByAppId:@"wx24fbe9e6721b6569" appSecret:@"6e0df38c7a269064168b9508d8efa97f"];
                 break;
                 
            //QQ好友
             case SSDKPlatformTypeQQ:
                 [appInfo SSDKSetupQQByAppId:@"1104788131"
                                      appKey:@"FI06WV49kC7QUsj6"
                                    authType:SSDKAuthTypeBoth];
                 break;
                
            // 微信朋友圈
//             case SSDKPlatformSubTypeWechatTimeline:
//                 [appInfo SSDKSetupWeChatByAppId:@"wx24fbe9e6721b6569" appSecret:@"6e0df38c7a269064168b9508d8efa97f"];
//                 break;

             default:
                 break;
         }
         
     }];

}



+(void)shareToSocialPlatformWithType:(SSDKPlatformType)type withURL:(NSURL *)url{
    //判断分享平台是否授权
    if([ShareSDK hasAuthorized:type]){
        NSLog(@"授权成功");
        
    }else{
        NSLog(@"授权失败");
        
    }
    //1、创建分享参数
    NSArray *imageArray = @[[UIImage imageNamed:@"1.jpg"]];
    
    if (imageArray) {
        
        NSMutableDictionary *shareParams = [NSMutableDictionary dictionary];
        switch (type) {
                
            case SSDKPlatformTypeSinaWeibo:{
                [shareParams SSDKSetupSinaWeiboShareParamsByText:@"分享内容" title:@"分享标题" image:imageArray url:url latitude:48.0 longitude:115.0 objectID:nil type:SSDKContentTypeImage];
                
            }break;
                
            case SSDKPlatformSubTypeWechatSession | SSDKPlatformSubTypeWechatTimeline:{
                [shareParams SSDKSetupWeChatParamsByText:@"分享内容" title:@"分享标题" url:url thumbImage:nil image:imageArray musicFileURL:nil extInfo:nil fileData:nil emoticonData:nil type:SSDKContentTypeImage forPlatformSubType:SSDKPlatformTypeCopy | SSDKPlatformSubTypeWechatTimeline];
                
            }break;
                
            case SSDKPlatformSubTypeQQFriend | SSDKPlatformSubTypeQZone:{
                [shareParams SSDKSetupQQParamsByText:@"分享内容" title:@"分享标题" url:[NSURL URLWithString:@"http://mob.com"] thumbImage:nil image:imageArray type:SSDKContentTypeImage forPlatformSubType:SSDKPlatformSubTypeQZone | SSDKPlatformSubTypeQQFriend];
                
                
            }break;
                
            default:{
                
            }break;
                
        }

        //2、分享
        [ShareSDK share:type parameters:nil onStateChanged:^(SSDKResponseState state, NSDictionary *userData, SSDKContentEntity *contentEntity, NSError *error) {
            
            switch (state) {
                case SSDKResponseStateSuccess:{
                    NSLog(@"发表成功");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"分享成功" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [alert show];
                    
                    break;
                }
                case SSDKResponseStateFail:{
                    NSLog(@"发布失败!");
                    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"提示" message:@"分享失败" delegate:nil cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
                    [alert show];
                    
                    break;
                }
                default:
                    break;
            }
            
        }];
        
        
    }
}





@end






















