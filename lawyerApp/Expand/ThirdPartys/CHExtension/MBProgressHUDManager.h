//
//  MBProgressHUDManager.h
//  Uhere
//
//  Created by lanou3g on 15/10/14.
//  Copyright (c) 2015年 chehao. All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUDManager : MBProgressHUD

+ (instancetype)MBProgressHUDManagerWithText:(NSString *)text view:(id)view;

+ (instancetype)MBProgressHUDManagerWithText:(NSString *)text view:(id)view dimBackground:(BOOL)dim;

@end
