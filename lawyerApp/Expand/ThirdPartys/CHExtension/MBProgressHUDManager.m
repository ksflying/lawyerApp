//
//  MBProgressHUDManager.m
//  Uhere
//
//  Created by lanou3g on 15/10/14.
//  Copyright (c) 2015年 chehao. All rights reserved.
//

#import "MBProgressHUDManager.h"
// 2.获得RGB颜色
#define RGBA(r, g, b, a)                    [UIColor colorWithRed:r/255.0f green:g/255.0f blue:b/255.0f alpha:a]
#define RGB(r, g, b)                        RGBA(r, g, b, 1.0f)


@implementation MBProgressHUDManager

+ (instancetype)MBProgressHUDManagerWithText:(NSString *)text view:(id)view{
    
    MBProgressHUDManager *HUD = [[super alloc] initWithView:view];
    HUD.dimBackground = YES;
    HUD.detailsLabelText = text;
    HUD.color = RGB(104, 104, 104);
    [view addSubview:HUD];
    return HUD;
}


+ (instancetype)MBProgressHUDManagerWithText:(NSString *)text view:(id)view dimBackground:(BOOL)dim{
    
    MBProgressHUDManager *HUD = [[super alloc] initWithView:view];
    HUD.dimBackground = dim;
    HUD.detailsLabelText = text;
    HUD.color = RGB(104, 104, 104);
    [view addSubview:HUD];
    return HUD;
}
@end
