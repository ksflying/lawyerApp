//
//  NSString+regular.m
//  123Test
//
//  Created by mdhj－2 on 16/2/2.
//  Copyright © 2016年 mdhj－2. All rights reserved.
//

#import "NSString+regular.h"

@implementation NSString (regular)




//验证邮箱
+(BOOL)isValidateEmail:(NSString *)email {
    
    NSString *strRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{1,5}";
    
    return [NSString isValidateRegularExpression:email byExpression:strRegex];
    
}

//验证电话号码
+(BOOL)isValidateTelNumber:(NSString *)number {
    
    NSString *strRegex = @"[0-9]{1,20}";
    
    BOOL rt = [NSString isValidateRegularExpression:number byExpression:strRegex];
    
    return rt;
    
}
//正则判断手机号码地址格式
+(BOOL)isMobileNumber:(NSString *)mobileNum
{
    /**
     * 手机号码
     * 移动：134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     * 联通：130,131,132,152,155,156,185,186
     * 电信：133,1349,153,180,189
     */
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    /**
     * 中国移动：China Mobile
     * 134[0-8],135,136,137,138,139,150,151,157,158,159,182,187,188
     */
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    /**
     * 中国联通：China Unicom
     * 130,131,132,152,155,156,185,186
     */
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    /**
     * 中国电信：China Telecom
     * 133,1349,153,180,189
     */
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    /**
     * 大陆地区固话及小灵通
     * 区号：010,020,021,022,023,024,025,027,028,029
     * 号码：七位或八位
     */
    // NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    
    if (([regextestmobile evaluateWithObject:mobileNum] == YES)
        || ([regextestcm evaluateWithObject:mobileNum] == YES)
        || ([regextestct evaluateWithObject:mobileNum] == YES)
        || ([regextestcu evaluateWithObject:mobileNum] == YES))
    {
        if([regextestcm evaluateWithObject:mobileNum] == YES) {
            NSLog(@"China Mobile");
        } else if([regextestct evaluateWithObject:mobileNum] == YES) {
            NSLog(@"China Telecom");
        } else if ([regextestcu evaluateWithObject:mobileNum] == YES) {
            NSLog(@"China Unicom");
        } else {
            NSLog(@"Unknow");
        }
       
        return YES;
    }
    else
    {
        return NO;
    }
}
//是否是有效的qq
+(BOOL)isValidateQQ:(NSString *)number
{
    NSString *strRegex = @"[1-9][0-9]\\{4,\\}";
    BOOL rt = [NSString isValidateRegularExpression:number byExpression:strRegex];
    
    return rt;
}

//是否是有效的帐号
+(BOOL)isValidateAccount:(NSString *)number
{
    NSString *strRegex = @"^[a-zA-Z][a-zA-Z0-9_]{4,15}$";
    BOOL rt = [NSString isValidateRegularExpression:number byExpression:strRegex];
    
    return rt;
}


//是否是有效的正则表达式
+(BOOL)isValidateRegularExpression:(NSString*)str byExpression:(NSString*)regex
{
    
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [predicate evaluateWithObject:str];
}


@end
