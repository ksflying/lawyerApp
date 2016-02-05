

//
//  ViewControllerFirst2.m
//  lawyerApp
//
//  Created by mdhj－2 on 16/2/4.
//  Copyright © 2016年 mdhj－2. All rights reserved.
//

#import "ViewControllerFirst2.h"
#import "RadioViewController1.h"
#import "RadioViewController2.h"
@interface ViewControllerFirst2 ()

@end

@implementation ViewControllerFirst2

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)click1:(id)sender {
    RadioViewController1 *r1 = [[RadioViewController1 alloc]init];
    [self.navigationController pushViewController:r1 animated:NO];
    
}
- (IBAction)click2:(id)sender {
    
    
    RadioViewController2 *r2 = [[RadioViewController2 alloc]init];
    [self.navigationController pushViewController:r2 animated:NO];
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
