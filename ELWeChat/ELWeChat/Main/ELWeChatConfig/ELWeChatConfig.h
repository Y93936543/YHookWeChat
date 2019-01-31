//
//  ELWeChatConfig.h
//  ELWeChatDylib
//
//  Created by Eli on 2018/10/9.
//  Copyright © 2018年 eli. All rights reserved.
//

//  插件配置文件

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
//#import "ELWeChatHeaderinfo.h"

@interface ELWeChatConfig : NSObject

//是否自动抢红包
@property (nonatomic,assign) BOOL autoRedEnvelop;
//黑名单列表
@property (strong, nonatomic) NSArray *blackList;
//是否开起群管理
@property (nonatomic,assign) BOOL groupManage;
//是否开起消息防撤回
@property (nonatomic,assign) BOOL Message;
//是否开起修改步数
@property (nonatomic,assign) BOOL StepManage;
//设置步数
@property (nonatomic,assign) NSInteger ResetStepNum;
//延时抢红包 单位秒
@property (nonatomic,assign) float Sec;
//是否开起修改定位
@property (nonatomic,assign) BOOL Location;
//修改定位信息
@property (nonatomic, assign) CLLocationCoordinate2D mLocation;
//是否开起了游戏作弊悬浮球
@property (nonatomic,assign) BOOL SuspendBall;
//猜拳 1 2 3
@property (nonatomic,assign) NSInteger finalMorra;
//骰子 4 5 6 7 8 9
@property (nonatomic,assign) NSInteger finalDice;


@property (nonatomic) id Infor;

//保存配置
- (BOOL)saveAppInfo:(ELWeChatConfig *)Config;


@end
