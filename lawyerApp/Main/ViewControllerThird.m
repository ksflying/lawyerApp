//
//  ViewControllerThird.m
//  lawyerApp
//
//  Created by mdhj－2 on 16/1/12.
//  Copyright © 2016年 mdhj－2. All rights reserved.
//

#import "ViewControllerThird.h"
#import "ASButton.h"
#import "NextViewController.h"
@interface ViewControllerThird ()

@end

@implementation ViewControllerThird

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    ASButton *nextBtn = [ASButton createNomalButton:(UIButtonTypeSystem) frame:CGRectMake(200, 200, 100, 100) title:@"next" backgroundImage:nil state:(UIControlStateNormal) action:^(UIButton *sender) {
        
        NextViewController *nextVC = [[NextViewController alloc]init];
        [self.navigationController pushViewController:nextVC animated:YES];
        ;
    }];
    nextBtn.center = kScreeCenter;
    [self.view addSubview:nextBtn];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    

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
