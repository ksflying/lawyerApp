//
//  UILabel+Size.m
//  Uhere
//
//  Created by lanou3g on 15/10/16.
//  Copyright (c) 2015年 chehao. All rights reserved.
//

#import "UILabel+Size.h"

@implementation UILabel (Size)

- (CGSize)boundingRectWithSize:(CGSize)size
{
    NSDictionary *attribute = @{NSFontAttributeName:self.font};
    
    CGSize retSize = [self.text boundingRectWithSize:size
                                        options:\
                      NSStringDrawingTruncatesLastVisibleLine |
                      NSStringDrawingUsesLineFragmentOrigin |
                      NSStringDrawingUsesFontLeading
                                     attributes:attribute
                                        context:nil].size;
    
    return retSize;
}

@end
