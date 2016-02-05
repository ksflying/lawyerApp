//
//  ASScannerViewController.h
//  DivineQuery
//
//  Created by qianfeng on 15/11/1.
//  Copyright © 2015年 ZYL. All rights reserved.
//


//导入AVFoundation
#import <UIKit/UIKit.h>
typedef void (^ResultScanner) (NSString* );
@interface ASScannerViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIView *scannerView;
@property (nonatomic,copy) ResultScanner   resultSranner;
@end
