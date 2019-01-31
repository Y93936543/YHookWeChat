//
//  YSuspendBall.m
//  ELWeChatDylib
//
//  Created by 黄宏盛 on 2019/1/31.
//  Copyright © 2019年 ywj. All rights reserved.
//

#import "YSuspendBall.h"
#import "UIView+Frame.h"
#import "YGameNBView.h"

@implementation YSuspendBall

/**
 工厂获取实例方法

 @return 悬浮球实例
 */
+ (instancetype)sharedInstance{
    static YSuspendBall *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[YSuspendBall alloc] initWithFrame:CGRectMake(0, 64, 40, 40)];
    });
    return instance;
}


/**
 根据大小初始化悬浮球视图

 @param frame 悬浮球大小
 @return 悬浮球视图
 */
- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        //设置圆角 为圆形
        self.layer.cornerRadius = self.width / 2;
        self.bgColor = [UIColor grayColor];
        //背景颜色
        self.backgroundColor = [self.bgColor colorWithAlphaComponent:0.6];
        
        //点击事件
        [self addTarget:self action:@selector(showSetting) forControlEvents:UIControlEventTouchUpInside];
        
        //移动事件
        UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(gestureMove:)];
        [self addGestureRecognizer:pan];
    }
    return self;
}


/**
 设置背景颜色

 @param bgColor 背景颜色
 */
-(void)setBgColor:(UIColor *)bgColor{
    _bgColor = bgColor;
    self.backgroundColor = [bgColor colorWithAlphaComponent:0.6];
}


/**
 将悬浮球添加到窗口

 @param window 窗口
 */
-(void)addToWindow:(UIWindow*) window{
    if(!window){
        window = [[UIApplication sharedApplication].windows firstObject];
    }
    YSuspendBall *suspendBall = [YSuspendBall sharedInstance];
    [suspendBall removeFromSuperview];
    [window addSubview:suspendBall];
    [window bringSubviewToFront:suspendBall];
}

//点击悬浮球事件
- (void)showSetting{
    if (!_isOpen) {
        ELAppManage *constants = [ELAppManage sharedManage];
        // 2.添加遮罩
        UIButton *maskView = [[ELAppManage sharedManage] getMaskView:[constants gameViewController]];
        constants.maskView = maskView;
        [constants.maskView setBackgroundColor:[_bgColor colorWithAlphaComponent:0.6]];
        [maskView addTarget:self action:@selector(maskViewClick) forControlEvents:UIControlEventTouchUpInside];
        [[constants gameViewController].view addSubview:maskView];
        
        NSArray *views = [[NSBundle mainBundle] loadNibNamed:@"YGameNBView" owner:nil options:nil];
        YGameNBView *gameNBView = [views firstObject];
        gameNBView.frame = CGRectMake(10, 218.5, 355, 230);
        [gameNBView setClipsToBounds:YES];
        [gameNBView.layer setCornerRadius:5];
        
        NSInteger finalMorra = [ELAppManage sharedManage].appConfig.finalMorra;
        NSInteger finalDice = [ELAppManage sharedManage].appConfig.finalDice;
        
        gameNBView.m_quanSegment.selectedSegmentIndex = finalMorra - 1;
        
        gameNBView.m_shaiSegment.selectedSegmentIndex = finalDice - 4;
        
        [constants.maskView addSubview:gameNBView];
        _isOpen = YES;
    }
    
}

/**
 移除游戏作弊遮罩层
 */
- (void)maskViewClick
{
    if ([ELAppManage sharedManage].maskView != nil) {
        _isOpen = NO;
        [[ELAppManage sharedManage].maskView removeFromSuperview];
    }
}

//限制悬浮球的位置并自动贴左右两边
- (void)gestureMove:(UIPanGestureRecognizer *)pan{
    
    self.backgroundColor = [self.bgColor colorWithAlphaComponent:1];
    
    CGPoint point = [pan locationInView:self.superview];
    self.middleX = point.x;
    self.middleY = point.y;
    
    if(pan.state == UIGestureRecognizerStateEnded){
        if (point.x < 0) {
            [UIView animateWithDuration:0.5 animations:^{
                self.x = 0;
            }];
        }
        
        if ( point.x > UIScreen.mainScreen.bounds.size.width) {
            [UIView animateWithDuration:0.5 animations:^{
                self.x = UIScreen.mainScreen.bounds.size.width - self.width;
            }];
        }
        
        if (point.y > UIScreen.mainScreen.bounds.size.height) {
            [UIView animateWithDuration:0.5 animations:^{
                self.y = UIScreen.mainScreen.bounds.size.height - self.width;
            }];
        }
        
        if (point.y < 64) {
            [UIView animateWithDuration:0.5 animations:^{
                self.y = 64;
            }];
        }
        
        CGPoint endPoint = [pan locationInView:self.superview];
        
        if (endPoint.x <= UIScreen.mainScreen.bounds.size.width / 2) {
            [UIView animateWithDuration:0.5 animations:^{
                self.x = 0;
            }];
        }
        
        if (endPoint.x > UIScreen.mainScreen.bounds.size.width / 2) {
            [UIView animateWithDuration:0.3 animations:^{
                self.x = UIScreen.mainScreen.bounds.size.width - self.width;
            }];
        }
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:1 animations:^{
                self.backgroundColor = [self.bgColor colorWithAlphaComponent:0.6];
            }];
        });
    }
}

@end
