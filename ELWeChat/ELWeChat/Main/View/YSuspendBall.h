//
//  YSuspendBall.h
//  ELWeChatDylib
//
//  Created by ywj on 2019/1/31.
//  Copyright © 2019年 ywj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YSuspendBall : UIButton

/** 悬浮球的颜色 */
@property (nonatomic, strong) UIColor *bgColor;
/** 悬浮球是否被点击 YES已打开界面 NO未打开界面 优化重复点击悬浮球造成关闭不了页面 */
@property (nonatomic, assign) BOOL isOpen;

/** 工厂获取实例方法 */
+ (instancetype)sharedInstance;

/**
 添加到某个UIWindow中

 @param window UIWindow
 */
- (void)addToWindow:(UIWindow*) window;

@end

NS_ASSUME_NONNULL_END
