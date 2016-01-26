//
//  NSString+Tool.m
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "NSString+Tool.h"

@implementation NSString (Tool)



/**
 *  获得18位不重复字符串
 *
 *  @return 返回18位不重复字符串
 */
-(NSString *) getUUID
{
    CFUUIDRef uuidRef =CFUUIDCreate(NULL);
    
    CFStringRef uuidStringRef =CFUUIDCreateString(NULL, uuidRef);
    
    CFRelease(uuidRef);
    
    NSString *uniqueId = (__bridge NSString *)(uuidStringRef);
    return uniqueId;
}
@end
