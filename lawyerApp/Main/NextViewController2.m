//
//  NextViewController2.m
//  lawyerApp
//
//  Created by simon on 16/1/21.
//  Copyright © 2016年 mdhj－2. All rights reserved.
//

#import "NextViewController2.h"
#import "ASNaviagtionItem.h"
#import "HQSearchBar.h"
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
