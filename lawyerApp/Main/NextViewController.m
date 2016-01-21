//
//  NextViewController.m
//  lawyerApp
//
//  Created by mdhj－2 on 16/1/21.
//  Copyright © 2016年 mdhj－2. All rights reserved.
//

#import "NextViewController.h"
#import "ASNaviagtionItem.h"
#import "ASButton.h"
#import "NextViewController2.h"
@interface NextViewController ()

@end

@implementation NextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    [ASNaviagtionItem createBackNavigationItem:self image:@"na_back.png"];
    [ASNaviagtionItem createRightNavigationItem:self image:@"bar_item003.png" action:^(ASNaviagtionItem *sender) {
        NSLog(@"右按钮");
    }];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    ASButton *nextBtn = [ASButton createNomalButton:(UIButtonTypeSystem) frame:CGRectMake(200, 200, 100, 100) title:@"next" backgroundImage:nil state:(UIControlStateNormal) action:^(UIButton *sender) {
        
        NextViewController2 *nextVC = [[NextViewController2 alloc]init];
        [self.navigationController pushViewController:nextVC animated:YES];
        ;
    }];
    nextBtn.center = kScreeCenter;
    [self.view addSubview:nextBtn];
    
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
