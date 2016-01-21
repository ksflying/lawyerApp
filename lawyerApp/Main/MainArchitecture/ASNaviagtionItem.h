//
//  ASNaviagtionItem.h
//  lawyerApp
//
//  Created by mdhj－2 on 16/1/21.
//  Copyright © 2016年 mdhj－2. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASNaviagtionItem : UIButton
/**
 *  自定义NavigationBar返回按钮
 *
 *  @param currentController 当前控制器
 *  @param image             返回按钮图片
 */
+(void) createBackNavigationItem:(UIViewController *)currentController image:(NSString *)image;

+(void)
/**
*  自定义NavigationBar右按钮
*
*  @param currentController 当前控制器
*  @param image             按钮图片
*  @param action            点击事件
*/ createRightNavigationItem:(UIViewController *)currentController image:(NSString *)image action:(void(^)(ASNaviagtionItem *sender))action;
@end
