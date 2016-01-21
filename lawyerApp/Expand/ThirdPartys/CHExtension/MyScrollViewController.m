//
//  MyScrollViewController.m
//  demo
//
//  Created by mdhj－2 on 15/11/2.
//  Copyright © 2015年 HQcoder. All rights reserved.
//

#import "MyScrollViewController.h"

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScrollViewH 40/375 * [UIScreen mainScreen].bounds.size.width

@interface MyScrollViewController ()

@property (strong, nonatomic) UIScrollView *CHScrollView;

@end

@implementation MyScrollViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UILabel *label = [[UILabel alloc] initWithFrame:(CGRectMake(50, 100, 200, 40))];
    label.text = self.string;
    [self.view addSubview:label];
    // Do any additional setup after loading the view.
}

- (UIScrollView *)CHScrollView{
    if (_CHScrollView == nil) {
        _CHScrollView = [[UIScrollView alloc] initWithFrame:(CGRectMake(0, 0, kScreenWidth, kScrollViewH))];
    }
    return _CHScrollView;
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
