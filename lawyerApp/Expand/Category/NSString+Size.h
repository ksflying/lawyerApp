//
//  NSString+Size.h
//  Uhere
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 chehao. All rights reserved.
//  根据 nsstring 和 font 计算出size

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NSString (Size)

- (CGSize)boundingRectWithSize:(CGSize)size withFont:(NSInteger)font;

+ (CGFloat)heightForString:(NSString *)str fontSize:(NSInteger)fontSize width:(CGFloat)width;

@end
