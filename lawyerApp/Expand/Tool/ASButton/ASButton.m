

//
//  ASButton.m
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "ASButton.h"

typedef void(^DoType)(ASButton *sender);
@implementation ASButton
{
    DoType touch;
}

#pragma mark 下拉菜单button
+(instancetype) createButton:(UIButtonType )type frame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)image state:(UIControlState)state action:(void(^)(ASButton *sender))action
{
    ASButton *button=[ASButton buttonWithType:type];
    [button setTitleColor:[UIColor orangeColor] forState:(UIControlStateNormal)];
    button.backgroundColor = [UIColor whiteColor];
    button.titleLabel.font=[UIFont systemFontOfSize:15];
    if (title) {
        [button setTitle:title forState:state];
    }
    if (image) {
        [button setBackgroundImage:image forState:state];
    }
    [button setFrame:frame];
    //处理TouchUpOutside事件
    [button addTarget:button action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    button->touch=action;
    
    
    button.littleImageView = [[UIImageView alloc]init];
    button.littleImageView.frame = CGRectMake(CGRectGetWidth(button.frame)-17, CGRectGetHeight(button.frame)-17, 15, 15);
    button.littleImageView.image = [UIImage imageNamed:@"sanjiao.@2x.png"];
    [button addSubview:button.littleImageView];
    
    return button;
}


-(void)setTitleColor:(UIColor *)color forState:(UIControlState)state
{
    [super setTitleColor:color forState:state];
    
    if (self.currentTitleColor == [UIColor orangeColor]) {
        
        self.littleImageView.image = [UIImage imageNamed:@"sanjiao.@2x.png"];
        
    }
    else
    {
        self.littleImageView.image = [UIImage imageNamed:@"sanjiao@2x.png"];
        
    }
}




#pragma mark 正常button
+(instancetype) createNomalButton:(UIButtonType )type frame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)image state:(UIControlState)state action:(void(^)(UIButton *sender))action
{
    ASButton *button=[ASButton buttonWithType:type];
    [button setTitleColor:[UIColor blackColor] forState:state];
    button.titleLabel.font=[UIFont systemFontOfSize:15];
    if (title) {
        [button setTitle:title forState:state];
    }
    if (image) {
        [button setBackgroundImage:image forState:state];
    }
    [button setFrame:frame];
    //处理TouchUpOutside事件
    [button addTarget:button action:@selector(click:) forControlEvents:(UIControlEventTouchUpInside)];
    button->touch=action;
    return button;
}




-(void) click:(ASButton *)sender
{
    //回调block,处理事件
    sender->touch(sender);
    
}


@end
