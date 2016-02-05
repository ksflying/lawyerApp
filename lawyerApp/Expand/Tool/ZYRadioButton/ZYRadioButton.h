//
//  ZYRadioButton.h
//  RadioButtonDemo
//
//  Created by zhangyuc on 13-5-22.
//  Copyright (c) 2013年 zhangyuc. All rights reserved.
//

#import <UIKit/UIKit.h>

/*
 修改zhangyuc 支持分组单选
 使用方法:
 1.初始化button 并且设置组别(GroupId) 
   ZYRadioButton *rb = [[ZYRadioButton alloc] initWithGroupId:@"typeSelect_Group" index:i];
 2.设置button的frame
 3.设置lable的frame以及其值
 4.添加观察者 [ZYRadioButton addObserverForGroupId:@"typeSelect_Group" observer:self];
 注:
 有多少组设置多少观察者,同一工程内组别(GroupId)不要相同
 */
@protocol RadioButtonDelegate <NSObject>

-(void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString*)groupId;
@end

@interface ZYRadioButton : UIView{
    NSString *_groupId;
    NSUInteger _index;
    UIButton *_button;
    UILabel *_lable;
}


//GroupId
@property(nonatomic,retain)NSString *groupId;
//Group的索引
@property(nonatomic,assign)NSUInteger index;
//按钮
@property(nonatomic,strong) UIButton *button;
//lable
@property(nonatomic,strong) UILabel *lable;
//初始化RadioButton控件
-(id)initWithGroupId:(NSString*)groupId index:(NSUInteger)index;
//添加观察
+(void)addObserverForGroupId:(NSString*)groupId observer:(id)observer;


@end
