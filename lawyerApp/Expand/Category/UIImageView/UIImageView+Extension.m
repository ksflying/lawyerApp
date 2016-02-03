
//
//  UIImageView+BMExtension.m
//  BMDeliverySpecialists
//
//  Created by fenglh on 15/10/29.
//  Copyright (c) 2015年 BlueMoon. All rights reserved.
//

#import "UIImageView+Extension.h"


#pragma mark 内部类 ExImageView
@interface ExImageView : UIImageView
@property (copy,nonatomic) void (^action)(UIImageView *image);

@end

@implementation ExImageView

- (void)tapImageBtnClick{
    if (self.action) {
        self.action(self);
    }
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageBtnClick)];
        [self addGestureRecognizer:tapGes];
    }
    return self;
}
- (instancetype)init
{
    if (self = [super init]) {
        self.userInteractionEnabled = YES;
        UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapImageBtnClick)];
        [self addGestureRecognizer:tapGes];
    }
    return self;
}
@end


@implementation UIImageView (BMExtension)

+ (instancetype)createImageViewWithFrame:(CGRect)frame
                             imageStr:(NSString *)imageStr{
    UIImageView *image = [[UIImageView alloc] initWithFrame:frame];
    image.image = [UIImage imageNamed:imageStr];
    return image;
}

+ (instancetype)createImageViewWithFrame:(CGRect)frame
                             imageStr:(NSString *)imageStr
                            tapAction:( void(^)(UIImageView *image))tapAction{
    ExImageView *image = [[ExImageView alloc] initWithFrame:frame];
    image.image = [UIImage imageNamed:imageStr];
    image.clipsToBounds = YES;
    image.action = tapAction;
    return image;
}
@end
