//
//  NSString+regular.h
//  123Test
//
//  Created by mdhj－2 on 16/2/2.
//  Copyright © 2016年 mdhj－2. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (regular)

/*
 正则表达式
 */

/**
*  字符串是否是邮箱
*
*  @param email 需要判断的字符串
*
*  @return 结果
*/

+(BOOL)isValidateEmail:(NSString *)email;
/**
 *  字符串是否是电话号码
 *
 *  @param number 需要判断的字符串
 *
 *  @return 结果
 */
+(BOOL)isValidateTelNumber:(NSString *)number;
/**
 *  字符串是否是手机号码
 *
 *  @param mobileNum 需要判断的字符串
 *
 *  @return 结果
 */
+(BOOL)isMobileNumber:(NSString *)mobileNum;
/**
 *  字符串是否是qq号
 *
 *  @param number 需要判断的字符串
 *
 *  @return 结果
 */
+(BOOL)isValidateQQ:(NSString *)number;
/**
 *  字符串是否是帐号 匹配帐号是否合法(字母开头，允许5-16字节，允许字母数字下划线)
 *
 *  @param number 需要判断的字符串
 *
 *  @return 结果
 */
+(BOOL)isValidateAccount:(NSString *)number;
@end
