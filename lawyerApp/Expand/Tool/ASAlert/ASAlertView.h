//
//  alertView.h
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASAlertView : UIView





/**
 *  根具系统版本选择提示框
 *
 *  @param message 提示消息
 */
+(void)alertMessage:(NSString*)message;


/**
 *  消息提示，timeInterval秒后消失
 *
 *  @param message 提示消息
 */
+(void)showMessage:(NSString *)message;



/**
 *  带遮罩提示框
 *
 *  @param message 提示消息
 */
+(void)alertMessageWithMaskView:(NSString*)message;
@end
