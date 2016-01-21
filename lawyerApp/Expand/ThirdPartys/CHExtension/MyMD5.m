//
//  MD5.m
//  demo
//
//  Created by mdhj－2 on 15/11/17.
//  Copyright © 2015年 HQcoder. All rights reserved.
//

#import "MyMD5.h"

#import <CommonCrypto/CommonDigest.h>


@implementation MyMD5




//md5 32位 加密 （小写）

 + (NSString *) md5:(NSString *)str
 {
     const char *cStr = [str UTF8String];
   unsigned char result[CC_MD5_DIGEST_LENGTH];
     
    CC_MD5(cStr,(uint32_t)strlen(cStr), result );
     return [NSString stringWithFormat:@"%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", result[0], result[1], result[2], result[3], result[4], result[5], result[6], result[7], result[8], result[9], result[10], result[11], result[12], result[13], result[14], result[15]
 ];
 }

+ (BOOL)isIncludeSpecialCharact:(NSString *)str {
    //***需要过滤的特殊字符：~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€。
    NSRange urgentRange = [str rangeOfCharacterFromSet: [NSCharacterSet characterSetWithCharactersInString: @"\\~￥#&*<>《》()[]{}【】^@/￡¤￥|§¨「」『』￠￢￣~@#￥&*（）——+|《》$_€\"'!$%,.?:;+-="]];
    if (urgentRange.location == NSNotFound)
    {
        return NO;
    }
    return YES;
}





@end
