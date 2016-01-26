//
//  ASMacros.h
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#ifndef ASMacros_h
#define ASMacros_h

//屏幕bounds
#define kScreen_Bounds ([UIScreen mainScreen].bounds)
//屏幕宽度
#define kScreeWidth [UIScreen mainScreen].bounds.size.width
//屏幕高度
#define kScreeHeight [UIScreen mainScreen].bounds.size.height
//屏幕中心点
#define kScreeCenter (CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2))
//当前视图高
#define kSelfViewHeight (self.frame.size.height)
//当前视图宽
#define kSelfViewWidth (self.frame.size.width)
//除去导航栏和TabBar的Frame
#define kTableFrame (CGRectMake(0, 64, ScreenWidth, ScreenHeight-64-49))


//根视图
#define AppRootView  ([[[[[UIApplication sharedApplication] delegate] window] rootViewController] view])
//根控制器
#define AppRootViewController  ([[[[UIApplication sharedApplication] delegate] window] rootViewController])
//根window
#define AppRootWindow  ([[[UIApplication sharedApplication] delegate] window])

//当前系统版本
#define SystemVersion [[[UIDevice currentDevice] systemVersion] doubleValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]  


//rgb颜色转换（16进制->10进制） UIColorFromRGB(0x82a1b7)
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
//设置颜色RGB
#define COLOR(R, G, B, A) ([UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A])

//检测block是否可用
#define BLOCK_EXEC(block, ...) if (block) { block(__VA_ARGS__); };

//DEBUG  模式下打印日志,当前行
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif



#endif /* ASMacros_h */
