//
//  NSString+log.h
//  TestDemo
//
//  Created by mdhj－2 on 16/1/8.
//  Copyright © 2016年 apple . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (log)
/**
 *  输出model熟悉信息
 *
 *  @param model 传人要输出的类对象
 */
+(void)printLog:(id)model;
@end
