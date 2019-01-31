//
//  ELAppManange.h
//  ELWeChatDylib
//
//  Created by Eli on 2018/10/10.
//  Copyright © 2018年 eli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "ELRedEnvelopInfo.h"
#import "ELWeChatConfig.h"


@interface ELAppManage : NSObject


+ (instancetype)sharedManage;
/**
 *  获得主控制器
 */
- (UIViewController *)gameViewController;
/**
 *  添加遮罩层，防止在操作游戏
 */
- (UIButton *)getMaskView:(UIViewController *)gameController;

/** 遮罩*/
@property (nonatomic, weak) UIButton *maskView;

@property (nonatomic,strong) ELWeChatConfig *appConfig;

@property (nonatomic,strong) ELRedEnvelopInfo *redInfo;





@end
