//
//  ViewControllerFirst.m
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "ViewControllerFirst.h"
#import "TableViewController.h"
#import "ASAlertView.h"
@interface ViewControllerFirst ()

@end

@implementation ViewControllerFirst

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UINavigationController *nc = [self.tabBarController.viewControllers objectAtIndex:2];
    nc.tabBarItem.badgeValue = @"3";
    
    
    
    
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)moreClick:(id)sender {
    
    TableViewController *vc = [[TableViewController alloc]init];
    [self.navigationController pushViewController:vc animated:NO];
    
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
