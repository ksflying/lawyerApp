//
//  MD5.h
//  demo
//
//  Created by mdhj－2 on 15/11/17.
//  Copyright © 2015年 HQcoder. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyMD5 : NSObject

+ (NSString *) md5:(NSString *)str;

+ (BOOL)isIncludeSpecialCharact:(NSString *)str;

@end
