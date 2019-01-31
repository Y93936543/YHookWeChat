//
//  YGameNB.h
//  ELWeChat
//
//  Created by 黄宏盛 on 2019/1/31.
//  Copyright © 2019年 ywj. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface YGameNBView : UIView

/** 猜拳选择器 */
@property (weak, nonatomic) IBOutlet UISegmentedControl *m_quanSegment;
/** 骰子选择器 */
@property (weak, nonatomic) IBOutlet UISegmentedControl *m_shaiSegment;

@end

NS_ASSUME_NONNULL_END
