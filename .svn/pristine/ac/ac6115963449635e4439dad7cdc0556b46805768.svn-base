//
//  PersonInformationViewController.h
//  多线程
//
//  Created by cqy on 16/7/9.
//  Copyright © 2016年 刘征. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^PersonBlock)(NSString *nameBlock);


@interface PersonInformationViewController : UIViewController

@property(nonatomic,strong)PersonBlock perblock;

-(void)sendPerson:(PersonBlock)block;


@end
