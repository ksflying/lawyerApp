//
//  NSString+Size.m
//  Uhere
//
//  Created by lanou3g on 15/10/9.
//  Copyright (c) 2015年 chehao. All rights reserved.
//

#import "NSString+Size.h"

@implementation NSString (Size)

- (CGSize)boundingRectWithSize:(CGSize)size withFont:(NSInteger)font
{
    NSDictionary *attribute = @{NSFontAttributeName: [UIFont systemFontOfSize:font]};
    
    CGSize retSize = [self boundingRectWithSize:size
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize;
}

//自适应高度
//文本高度
+ (CGFloat)heightForString:(NSString *)str fontSize:(NSInteger)fontSize width:(CGFloat)width{
    //1获取文本属性 （字体样式，字体大小，行高）用字典储存  key值为NSFontAttributeName
    NSDictionary *dic = [NSDictionary dictionaryWithObjectsAndKeys:[UIFont systemFontOfSize:fontSize], NSFontAttributeName, nil];
    //    2根据一个字符串绘制一个矩形
    CGRect bound = [str boundingRectWithSize:(CGSizeMake(width, 1000)) options:(NSStringDrawingUsesLineFragmentOrigin) attributes:dic context:nil];
    return bound.size.height;
    
}

@end
