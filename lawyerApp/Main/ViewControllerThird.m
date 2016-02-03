//
//  ViewControllerThird.m
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
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
    
    
    //快速创建Button   继承
    ASButton *nextBtn = [ASButton createNomalButton:(UIButtonTypeSystem) frame:CGRectMake(100, 0, 100, 100) title:@"next" backgroundImage:nil state:(UIControlStateNormal) action:^(UIButton *sender) {
        
        NextViewController *nextVC = [[NextViewController alloc]init];
        [self.navigationController pushViewController:nextVC animated:YES];
        ;
    }];
    nextBtn.y = 100;
    //渐变颜色
    nextBtn.backgroundColor = [UIColor gradientFromColor:[UIColor whiteColor] toColor:[UIColor orangeColor] withHeight:nextBtn.height];
    nextBtn.cornerRadius = 5;
    [self.view addSubview:nextBtn];
    
    
    //快速创建可点击ImageView   分类
    __block UIImageView *imgView = [UIImageView createImageViewWithFrame:CGRectMake(100, 0, 100, 100) imageStr:@"_bar_item001" tapAction:^(UIImageView *image) {
        
        //抖动效果
//        [imgView shake:5 withDelta:1];
//        [nextBtn shake];


        NSLog(@"图片点击");
    }];
    imgView.y = nextBtn.y + nextBtn.height + 50;
    [self.view addSubview:imgView];
    
    
    

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
