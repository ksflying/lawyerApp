//
//  NSString+getUppercaseString.m
//  Uhere
//
//  Created by lanou3g on 15/10/13.
//  Copyright (c) 2015年 chehao. All rights reserved.
//

#import "NSString+getUppercaseString.h"

@implementation NSString (getUppercaseString)

+ (NSString *)getUppercaseStringWithString:(NSString *)string{
    if ([string length]) {
        NSMutableString *ms = [[NSMutableString alloc] initWithString:string];
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformMandarinLatin, NO)) {
            //            NSLog(@"pinyin: %@", ms);
        }else{
            return nil;
        }
        if (CFStringTransform((__bridge CFMutableStringRef)ms, 0, kCFStringTransformStripDiacritics, NO)) {
            //            NSLog(@"pinyin:%@", ms);
        }else{
            return nil;
        }
//        NSLog(@"pinyin:%@", ms);
        NSString *str = [[ms substringToIndex:1] uppercaseString];
        return str;
//        NSLog(@"pinyin:%@", str);
    }
    return nil;
}

@end
