//
//  ASTabBarViewController.h
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASTabBarViewController : UITabBarController
//功能: 根据所给类名设置控制器所对应的标签的标题,图片,选中图片
//参数: controllerName 控制器的类名
//     title: 标签的标题; imageName:正常状态下标签图片
//     selectedImage:选中状态下标签图片
//返回值: 无
-(void) setcontroller:(NSString *)controllerName title:(NSString *) title imageNamed:(NSString *)imageName selectedImageName:(NSString *)selectedImage;
/**
 *  创建tabBar
 */
-(void)createtabBarController;
@end
