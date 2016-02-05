//
//  ViewControllerFirst4.m
//  lawyerApp
//
//  Created by mdhj－2 on 16/2/4.
//  Copyright © 2016年 mdhj－2. All rights reserved.
//

#import "ViewControllerFirst4.h"
#import "ASButton.h"
#import "OTRAlbumViewController.h"
@interface ViewControllerFirst4 ()

@end

@implementation ViewControllerFirst4

- (void)viewDidLoad {
    [super viewDidLoad];
    ASButton *btn =  [ASButton createNomalButton:(UIButtonTypeSystem) frame:CGRectMake(0, 200, 100, 60) title:@"国家地理" backgroundImage:nil state:(UIControlStateNormal) action:^(UIButton *sender) {
        
        
        OTRAlbumViewController *vc = [[OTRAlbumViewController alloc]init];
        [self.navigationController pushViewController:vc animated:NO];
        
    }];
    btn.centerX = kScreeCenter.x;
    [self.view addSubview:btn];
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
