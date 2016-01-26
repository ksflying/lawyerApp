//
//  UIButton+repeatClick.m
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "UIButton+repeatClick.h"

@implementation UIButton (repeatClick)

+ (void)deleRepeatClcik:(UIButton *)sender delayTime:(int)time
{
    sender.enabled = NO;
    
    
    dispatch_time_t delayTime = dispatch_time(DISPATCH_TIME_NOW, time * NSEC_PER_SEC);
    dispatch_after(delayTime, dispatch_get_main_queue(), ^{
        
        sender.enabled = YES;
        NSLog(@"延迟结束");
    });
}
@end
