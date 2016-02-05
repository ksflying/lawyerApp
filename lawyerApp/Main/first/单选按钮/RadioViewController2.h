//
//  RadioViewController2.h
//  demo
//
//  Created by apple  on 15/11/27.
//  Copyright © 2015年 apple . All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^MaintenanceConditionsResult)(NSArray *);
@interface RadioViewController2 : UITableViewController

//返回选选择结果
@property(nonatomic,copy) MaintenanceConditionsResult mcResult;
@end
