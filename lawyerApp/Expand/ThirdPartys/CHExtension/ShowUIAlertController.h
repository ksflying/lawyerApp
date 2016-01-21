//
//  ShowUIAlertController.h
//  demo
//
//  Created by mdhj－2 on 15/11/3.
//  Copyright © 2015年 HQcoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ShowUIAlertController : NSObject
///弃用
+ (UIAlertController *)showUIAlertControllerMessage:(NSString *)message type:(NSInteger)type actionText:(NSString *)actionText
                              handle:(void(^)())handle;

///弃用
+ (UIAlertController *)showUIAlertControllerMessage:(NSString *)code  handle:(void(^)())handle;

///根据错误代码 进行提示
+ (void)showUIAlertControllerMessage:(NSString *)code UIViewController:(UIViewController *)myVC handle:(void(^)())handle;
///普通弹出
+ (void)showUIAlertControllerMessagePT:(NSString *)message UIViewController:(UIViewController *)myVC handle:(void(^)())handle;
/// 累死安州 的提示 在屏幕下方
+ (void)showMessage:(NSString *)message;
///类似安州的提示  在屏幕中间
+ (void)showCenterViewMessage:(NSString *)message;
///有两个选择按钮的 提示框 handle 点击自定义按钮的回掉
+ (void)showUIAlertControllerMessagePT:(NSString *)message actionText:(NSString *)actionText UIViewController:(UIViewController *)myVC handle:(void(^)())handle;
@end
