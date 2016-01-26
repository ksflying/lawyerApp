//
//  UIButton+repeatClick.h
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (repeatClick)
/**
 *  避免按钮重复点击,time秒后可以继续点击
 *
 *  @param sender 要避免重复点击的对象
 *  @param time   延迟时间
 */
+ (void)deleRepeatClcik:(UIButton *)sender delayTime:(int)time;
@end
