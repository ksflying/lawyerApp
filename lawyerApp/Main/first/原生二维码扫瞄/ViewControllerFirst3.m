//
//  ViewControllerFirst3.m
//  lawyerApp
//
//  Created by mdhj－2 on 16/2/4.
//  Copyright © 2016年 mdhj－2. All rights reserved.
//

#import "ViewControllerFirst3.h"
#import "ASButton.h"
#import "ASScannerViewController.h"
#import "ASDepthModalViewController.h"
@interface ViewControllerFirst3 ()

@end

@implementation ViewControllerFirst3

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor RandomColor];
    ASButton *btn =  [ASButton createNomalButton:(UIButtonTypeSystem) frame:CGRectMake(0, 200, 100, 60) title:@"扫描" backgroundImage:nil state:(UIControlStateNormal) action:^(UIButton *sender) {
        
        ASScannerViewController * scanner = [[ASScannerViewController alloc] init];
        scanner.resultSranner = ^(NSString * string){
            NSLog(@"%@",string);
        };
        [self.navigationController pushViewController:scanner  animated:YES];
    }];
    btn.centerX = kScreeCenter.x;
    [self.view addSubview:btn];
    
    ASButton *btn1 =  [ASButton createNomalButton:(UIButtonTypeSystem) frame:CGRectMake(0, 300, 100, 60) title:@"推出视图" backgroundImage:nil state:(UIControlStateNormal) action:^(UIButton *sender) {
        

        UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
        view.backgroundColor = [UIColor orangeColor];
        //view.center = kScreeCenter;
        [ASDepthModalViewController presentView:view withBackgroundColor:nil popupAnimationStyle:(3)];
        
        
    }];
    btn1.centerX = kScreeCenter.x;
    [self.view addSubview:btn1];
    
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
