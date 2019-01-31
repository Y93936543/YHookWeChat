//
//  YGameNB.m
//  ELWeChat
//
//  Created by 黄宏盛 on 2019/1/31.
//  Copyright © 2019年 ywj. All rights reserved.
//

#import "YGameNBView.h"

@implementation YGameNBView

- (void)awakeFromNib{
    [super awakeFromNib];
    
}


/**
 猜拳选择器改变方法
 
 @param sender 猜拳选择器对象
 */
- (IBAction)indexDidChangeForQuanSegemntedControl:(id)sender {
    [ELAppManage sharedManage].appConfig.finalMorra = ((UISegmentedControl*)sender).selectedSegmentIndex + 1;
    NSLog(@"猜拳数值：%ld",[ELAppManage sharedManage].appConfig.finalMorra);
}

/**
 骰子选择器改变方法
 
 @param sender 骰子选择器对象
 */
- (IBAction)indexDidChangeForShaiSegmentedControl:(id)sender {
    [ELAppManage sharedManage].appConfig.finalDice = ((UISegmentedControl*)sender).selectedSegmentIndex + 4;
    NSLog(@"猜拳数值：%ld",[ELAppManage sharedManage].appConfig.finalDice);
}


@end
