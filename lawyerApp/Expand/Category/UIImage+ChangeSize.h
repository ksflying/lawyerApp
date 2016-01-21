//
//  UIImage+ChangeSize.h
//  demo
//
//  Created by mdhj－2 on 15/11/5.
//  Copyright © 2015年 HQcoder. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ChangeSize)

- (UIImage *)image:(UIImage*)image byScalingToSize:(CGSize)targetSize;

+ (NSString *)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

@end
