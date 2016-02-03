//
//  NextViewController2.m
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "NextViewController2.h"
#import "ASNaviagtionItem.h"
#import "HQSearchBar.h"
#import "ASButton.h"
@interface NextViewController2 ()<UITextFieldDelegate>

@property (nonatomic,strong) HQSearchBar * searchBar;

@end

@implementation NextViewController2

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor =[UIColor whiteColor];
    
    HQSearchBar *searchBar = [HQSearchBar searchBar];
    self.searchBar = searchBar;
    self.searchBar.delegate = self;
    searchBar.width = 300;
    searchBar.height = 30;
    self.navigationItem.titleView = searchBar;
    
    
    [ASNaviagtionItem createBackNavigationItem:self image:@"na_back.png"];
    [ASNaviagtionItem createRightNavigationItem:self image:@"bar_item003.png" action:^(ASNaviagtionItem *sender) {
        NSLog(@"右按钮");
    }];

    
    __block ASButton *nextBtn0 = [ASButton createNomalButton:(UIButtonTypeSystem) frame:CGRectMake(200, 200, 100, 100) title:@"next" backgroundImage:nil state:(UIControlStateNormal) action:^(UIButton *sender) {
        

    }];
    [self.view addSubview:nextBtn0];
    
    
    
    __block ASButton *nextBtn = [ASButton createNomalButton:(UIButtonTypeSystem) frame:CGRectMake(200, 200, 100, 100) title:@"next" backgroundImage:nil state:(UIControlStateNormal) action:^(UIButton *sender) {
        
        
        [nextBtn makeToast:@"dd" duration:3 position:nextBtn0];
        [UIButton deleRepeatClcik:nextBtn delayTime:3 ];
    }];
    nextBtn.center = kScreeCenter;
    [self.view addSubview:nextBtn];

    
    // Do any additional setup after loading the view.
}

#pragma -UITextFieldDelegate
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSLog(@"%@",self.searchBar.text);
    [self.searchBar resignFirstResponder];
    return YES;
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
