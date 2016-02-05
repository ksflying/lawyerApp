//
//  ViewControllerFirst1.m
//  lawyerApp
//
//  Created by mdhj－2 on 16/2/4.
//  Copyright © 2016年 mdhj－2. All rights reserved.
//

#import "ViewControllerFirst1.h"
#import "ASAlertView.h"
@interface ViewControllerFirst1 ()

@end

@implementation ViewControllerFirst1

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)alertBtnClick1:(id)sender {
    
    [ASAlertView alertMessage:@"普通警告框框适配IOS9"];
}
- (IBAction)alertBtnClick2:(id)sender {
    [ASAlertView showMessage:@"1.5s后消失"];
}

- (IBAction)alertBtnClick3:(id)sender {
    
    [ASAlertView alertMessageWithMaskView:@"带遮罩提示框"];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
