//
//  RadioViewController1.m
//  lawyerApp
//
//  Created by mdhj－2 on 16/2/4.
//  Copyright © 2016年 mdhj－2. All rights reserved.
//

#import "RadioViewController1.h"
#import "ZYRadioButton.h"
#import "ASDepthModalViewController.h"
#import "ASReadSetting.h"
#define radioItemHeight 30
@interface RadioViewController1 ()

@end

@implementation RadioViewController1
{
    NSMutableArray *_colorArray;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor RandomColor];
    

    UIView *view = [[UIView alloc]initWithFrame:CGRectMake(0, 64, self.view.width, self.view.height - 100)];
    view.backgroundColor = [UIColor RandomColor];
    [self.view addSubview:view];
    
    
    _colorArray = [NSMutableArray arrayWithArray:[ASReadSetting readSettingPlist:@"firstType"]];
    
    
    for (int i = 0; i < _colorArray.count; i++) {
        //初始化单选按钮控件 GroupId是组别
        ZYRadioButton *rb = [[ZYRadioButton alloc] initWithGroupId:@"typeSelect_Group" index:i];
        rb.frame = CGRectMake(10, radioItemHeight*(i)+5, kScreeWidth, 50);
        [view addSubview:rb];


        rb.lable.frame = CGRectMake(rb.button.frame.size.width+rb.button.frame.origin.x, rb.button.frame.origin.y, kScreeWidth-rb.button.frame.size.width-rb.button.frame.origin.x, 30);
        rb.lable.text = _colorArray[i];
    }
    //按照GroupId添加观察者
    [ZYRadioButton addObserverForGroupId:@"typeSelect_Group" observer:self];
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark <RadioButtonDelegate>

-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString *)groupId{
    
    NSLog(@"第%lu个 组别%@",(unsigned long)index,groupId);
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
