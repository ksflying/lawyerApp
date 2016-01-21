//
//  ShowUIAlertController.m
//  demo
//
//  Created by mdhj－2 on 15/11/3.
//  Copyright © 2015年 HQcoder. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ShowUIAlertController.h"
#import "NSString+Size.h"

@implementation ShowUIAlertController



+ (void)showCenterViewMessage:(NSString *)message
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    CGFloat SCREEN_WIDTH = [UIScreen mainScreen].bounds.size.width;
    CGFloat SCREEN_HEIGHT = [UIScreen mainScreen].bounds.size.height;
    
    UILabel *label = [[UILabel alloc]init];
    
    //    boundingRectWithSize:options:attributes:context
    CGSize LabelSize = [message boundingRectWithSize:CGSizeMake(290, 9000) withFont:18];
    
    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:16];
    [showview addSubview:label];
    showview.frame = CGRectMake((SCREEN_WIDTH - LabelSize.width - 20)/2, SCREEN_HEIGHT - 100, LabelSize.width+20, LabelSize.height+10);
    
    showview.center = CGPointMake(SCREEN_WIDTH * 0.5, SCREEN_HEIGHT * 0.5);
    [UIView animateWithDuration:2 animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}


+ (void)showMessage:(NSString *)message
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    CGFloat SCREEN_WIDTH = [UIScreen mainScreen].bounds.size.width;
    CGFloat SCREEN_HEIGHT = [UIScreen mainScreen].bounds.size.height;
    
    UILabel *label = [[UILabel alloc]init];
    
//    boundingRectWithSize:options:attributes:context
    CGSize LabelSize = [message boundingRectWithSize:CGSizeMake(290, 9000) withFont:16];

    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:14];
    [showview addSubview:label];
    showview.frame = CGRectMake((SCREEN_WIDTH - LabelSize.width - 20)/2, SCREEN_HEIGHT - 100, LabelSize.width+20, LabelSize.height+10);
    [UIView animateWithDuration:2 animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
}

#pragma mark ----- 提示框

+ (UIAlertController *)showUIAlertControllerMessage:(NSString *)code  handle:(void(^)())handle{
    NSString *message = @"请求数据失败";
    switch (code.integerValue) {
        case 10013003:
            message = @"登录已过期，请重新登录";
            break;
        case 10012001:
            message = @"用户未注册";
            break;
            
        case 10012002:
            message = @"密码错误";
            break;
            
        case 10011002:
            message = @"手机号已注册";
            break;
        default:
            break;
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:handle];
    
    [alertController addAction:okAction];
    return alertController;
}

+ (void)showUIAlertControllerMessagePT:(NSString *)message UIViewController:(UIViewController *)myVC handle:(void(^)())handle{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:handle];
    
    [alertController addAction:okAction];
    [myVC presentViewController:alertController animated:YES completion:nil];
    
}

+ (void)showUIAlertControllerMessage:(NSString *)code UIViewController:(UIViewController *)myVC handle:(void(^)())handle{
    NSString *message = @"请求失败";
    switch (code.integerValue) {
        case 10013003:
            message = @"登录已过期，请重新登录";
            break;
        case 10012001:
            message = @"用户未注册";
            break;
        case 10012002:
            message = @"密码错误";
            break;
        case 10010201:
            message = @"旧密码输入错误";
            break;
        case 10011002:
            message = @"手机号已注册";
            break;
        case 10010202:
            message = @"验证码为4位数字";
            break;
        case 10010203:
            message = @"验证码错误";
            break;
        case 10010204:
            message = @"验证码过期";
            break;
        case 10013002:
            message = @"口令错误";
            break;
        case 10050107:
            message = @"手机号格式不正确";
            break;
        case 10015102:
            message = @"登录过期\n请重新登录后进行评论";
            break; 
        case 10010205:
            message = @"发送超出限制次数，每个手机号每天只能发送五次验证码";
            break;
        case 10060021:
            message = @"指定的地址不存在";
            break;
        default:
            message = [NSString stringWithFormat:@"请求失败\n错误码:%@",code];
            break;
    }
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"我知道了" style:UIAlertActionStyleDefault handler:handle];
    
    [alertController addAction:okAction];
    [myVC presentViewController:alertController animated:YES completion:nil];

}




+ (void)showUIAlertControllerMessagePT:(NSString *)message actionText:(NSString *)actionText UIViewController:(UIViewController *)myVC handle:(void(^)())handle{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:nil];
    
    UIAlertAction *relAction = [UIAlertAction actionWithTitle:actionText style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        handle();
    }];
    [alertController addAction:relAction];
    
    [alertController addAction:okAction];
    [myVC presentViewController:alertController animated:YES completion:nil];
    
}


//提示框
+ (UIAlertController *)showUIAlertControllerMessage:(NSString *)message type:(NSInteger)type actionText:(NSString *)actionText
                              handle:(void(^)())handle{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"提示" message:message preferredStyle:UIAlertControllerStyleAlert];
    
    
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"我知道了" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        if (handle != nil) {
            
            handle();
        }
        
    }];
    [alertController addAction:okAction];
    
    if (type != 1) {
        
        UIAlertAction *relAction = [UIAlertAction actionWithTitle:actionText style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
            handle();
        }];
        [alertController addAction:relAction];
    }
    return alertController; 
}


@end
