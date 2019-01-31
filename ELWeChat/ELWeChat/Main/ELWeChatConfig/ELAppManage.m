//
//  ELAppManange.m
//  ELWeChatDylib
//
//  Created by Eli on 2018/10/10.
//  Copyright © 2018年 eli. All rights reserved.
//

#import "ELAppManage.h"

#import <objc/runtime.h>
@implementation ELAppManage

+(id)sharedManage
{
    static ELAppManage *manage = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manage = [ELAppManage new];
    });
    return manage;
}

- (id)init
{
    if (self = [super init])
    {
        //读取保存在本地的App配置信息
        self.appConfig = [NSKeyedUnarchiver unarchiveObjectWithFile:kAppDataPath];
        //判断本地是否有配置信息
        if (!self.appConfig)
        {
            //没有配置信息，初始化
            self.appConfig = [[ELWeChatConfig alloc] init];
        }
        //获取本地红包信息
        self.redInfo = [NSKeyedUnarchiver unarchiveObjectWithFile:kRedInfoPath];
    }
    
    return self;
    
}


/**
 *  获得微信主控制器
 *
 *  @retrun 微信控制器
 */
- (UIViewController *)gameViewController
{
    UIViewController *appRootVC = [UIApplication sharedApplication].keyWindow.rootViewController;
    UIViewController *topVC = appRootVC;
    while (topVC.presentedViewController) {
        topVC = topVC.presentedViewController;
    }
    
    return topVC;
}

//添加遮罩层，防止在操作游戏
- (UIButton *)getMaskView:(UIViewController *)gameController
{
    //获取屏幕大小
    CGRect mainFrame = [UIScreen mainScreen].bounds;
    //判断是否横屏
    if(UIInterfaceOrientationIsLandscape(gameController.interfaceOrientation)){
        //横屏
        if (mainFrame.size.width < mainFrame.size.height) {
            mainFrame = CGRectMake(0, 0, mainFrame.size.height, mainFrame.size.width);
        }
    }
    return [[UIButton alloc] initWithFrame:mainFrame];
}




@end
