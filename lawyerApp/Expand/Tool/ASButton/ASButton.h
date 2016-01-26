//
//  ASButton.h
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ASButton : UIButton
/**
 *  自定义下拉菜单button
 *
 *  @param type  button 类型
 *  @param frame button frame
 *  @param title button title
 *  @param image button backgroundImage
 *  @param state button state
 *  @param btn   button 事件
 *
 *  @return UIButton ＊obj
 */
+(instancetype) createButton:(UIButtonType )type frame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)image state:(UIControlState)state action:(void(^)(ASButton *))btn;



/**
 *  自定义正常button
 *
 *  @param type  button 类型
 *  @param frame button frame
 *  @param title button title
 *  @param image button backgroundImage
 *  @param state button state
 *  @param btn   button 事件
 *
 *  @return UIButton ＊obj
 */
+(instancetype) createNomalButton:(UIButtonType )type frame:(CGRect)frame title:(NSString *)title backgroundImage:(UIImage *)image state:(UIControlState)state action:(void(^)(UIButton *sender))action;

@property(nonatomic,strong) UIImageView *littleImageView;





@end
