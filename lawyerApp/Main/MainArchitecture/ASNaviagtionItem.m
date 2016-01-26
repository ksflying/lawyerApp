//
//  ASNaviagtionItem.m
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "ASNaviagtionItem.h"
typedef void(^DoType)(ASNaviagtionItem *sender);
@implementation ASNaviagtionItem
{
    DoType touch;
}
/**
 *  自定义NavigationBar返回按钮
 *
 *  @param currentController 当前控制器
 *  @param image             返回按钮图片
 */
+(void) createBackNavigationItem:(UIViewController *)currentController image:(NSString *)image
{
    ASNaviagtionItem *backButton = [self createButton:UIButtonTypeCustom frame:CGRectMake(0, 0, 30, 30) title:nil backgroundImage:[UIImage imageNamed:image] state:UIControlStateNormal action:^(ASNaviagtionItem *sender) {
        [currentController.navigationController popViewControllerAnimated:YES];
    }];
    currentController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:backButton];
}
/**
 *  自定义NavigationBar右按钮
 *
 *  @param currentController 当前控制器
 *  @param image             按钮图片
 *  @param action            点击事件
 */
+(void) createRightNavigationItem:(UIViewController *)currentController image:(NSString *)image action:(void(^)(ASNaviagtionItem *sender))action
{
    ASNaviagtionItem *rightButton = [self createButton:UIButtonTypeCustom frame:CGRectMake(0, 0, 30, 30) title:nil backgroundImage:[UIImage imageNamed:image] state:UIControlStateNormal action:^(ASNaviagtionItem *sender) {
        
        action(sender);
        
    }];
    currentController.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
}

//TODO: 自定义导航栏上的搜索框

#pragma createBtn
/**
 *  自定义button
 *
 *  @param type  button 类型
 *  @param frame button frame
 *  @param title button title
 *  @param image button backgroundImage
 *  @param state button state
 *  @param btn   button 事件
 *
 *  @return UIButton ＊obj
 */
+(instancetype) createButton:(UIButtonType )type frame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)image state:(UIControlState)state action:(void(^)(ASNaviagtionItem *sender))action
{
    ASNaviagtionItem *button=[ASNaviagtionItem buttonWithType:type];
    [button setTitleColor:[UIColor blackColor] forState:state];
    button.titleLabel.font=[UIFont systemFontOfSize:15];
    if (title) {
        [button setTitle:title forState:state];
    }
    if (image) {
        [button setBackgroundImage:image forState:state];
    }
    [button setFrame:frame];
    //处理TouchUpOutside事件
    [button addTarget:button action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    button->touch=action;
    return button;
}
-(void) click:(ASNaviagtionItem *)sender
{
    //回调block,处理事件
    sender->touch(sender);
    
}

@end
