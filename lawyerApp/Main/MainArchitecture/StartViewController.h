//
//  StartViewController.h
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void (^Start)();
@interface StartViewController : UIViewController
@property (nonatomic,copy) Start start;
@end
