//
//  ASContstant.h
//  KSFramework
//
//  Created by qianfeng on 15/10/25.
//  Copyright © 2015年 Ks.H. All rights reserved.
//

#ifndef ASContstant_h
#define ASContstant_h


//0表示开发环境 1表示生产环境
#define kDevelopmentOrProduction 0

#if kDevelopmentOrProduction
    #define kBaseUrl @"http://tnfs.tngou.net/Production"
#else
    #define kBaseUrl @"http://tnfs.tngou.net/Development"
#endif

//第一次运行
#define isFirstRun @"isFirstRun"
//导航栏高度
#define NavigationBar_HEIGHT   44.f
// 状态栏高度
#define  StatusBarHeight       20.f
// 状态栏高度 + 导航栏高度
#define  StatusBarAndNavigationBarHeight   (20.f + 44.f)
// 标签栏高度
#define  TabbarHeight          49.f

#define  iPhone4_4s   (Width == 320.f && Height == 480.f ? YES : NO)
#define  iPhone5_5s   (Width == 320.f && Height == 568.f ? YES : NO)
#define  iPhone6      (Width == 375.f && Height == 667.f ? YES : NO)
#define  iPhone6_plus (Width == 414.f && Height == 736.f ? YES : NO)

#endif /* ASContstant_h */
