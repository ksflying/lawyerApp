//
//  alertView.m
//  demo
//
//  Created by apple  on 15/11/23.
//  Copyright © 2015年 apple . All rights reserved.
//

#import "ASAlertView.h"



//根视图
#define AppRootView  ([[[[[UIApplication sharedApplication] delegate] window] rootViewController] view])
//根控制器
#define AppRootViewController  ([[[[UIApplication sharedApplication] delegate] window] rootViewController])
//屏幕中心点
#define ScreeCenter (CGPointMake([UIScreen mainScreen].bounds.size.width/2, [UIScreen mainScreen].bounds.size.height/2))
//1.5s后消失
#define timeInterval 1.5

@implementation ASAlertView




/**
 *  带遮罩提示框
 *
 *  @param message 提示消息
 */
+(void)alertMessageWithMaskView:(NSString*)message
{
    
    [ASAlertView showMaskView];
   
    
    UIView *rectangleView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 180, 60)];
    rectangleView.center = ScreeCenter;

    rectangleView.layer.cornerRadius = 5;
    rectangleView.layer.backgroundColor = [UIColor whiteColor].CGColor;

    //FIXME: 增加提示框样式,动画效果
    
    UILabel * lable = [[UILabel alloc]initWithFrame:CGRectMake(40, 10, 100, 40)];
    lable.text = message;
    lable.font = [UIFont systemFontOfSize:13];
    lable.textAlignment = NSTextAlignmentCenter;
    [rectangleView addSubview:lable];
    
    
    
    UITapGestureRecognizer *singleTapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTap:)];
    singleTapRecognizer.numberOfTapsRequired = 1; // 单击
    [rectangleView addGestureRecognizer:singleTapRecognizer];
    
    [AppRootView addSubview:rectangleView];
 
}



//点击手势
+ (void)singleTap:(UITapGestureRecognizer *)gestureRecognizer{
    
    [gestureRecognizer.view removeFromSuperview];
    [ASAlertView removeMaskView];
}

/**
 *  创建屏幕大小maskView
 *
 *  @return 返回maskView
 */
+ (UIView *)shareMaskView
{
    static dispatch_once_t once;
    static UIView *maskView;
    dispatch_once(&once, ^{
        
        maskView = [[UIView alloc]initWithFrame:AppRootView.frame];
        maskView.backgroundColor = [UIColor grayColor];
        maskView.alpha = 0.6;
        maskView.userInteractionEnabled = YES;
        
    });
    return maskView;
}
/**
 *  创建MaskView
 */
+ (void ) showMaskView
{
    
    [AppRootView addSubview:[ASAlertView shareMaskView]];
}
/**
 *  移除MaskView
 */
+ (void) removeMaskView
{
    [[ASAlertView shareMaskView] removeFromSuperview];
    
}


#pragma mark 
/**
 *  根具系统版本选择提示框
 *
 *  @param message 提示消息
 */
+(void)alertMessage:(NSString*)message
{
#if __IPHONE_OS_VERSION_MIN_REQUIRED <= __IPHONE_8_0
    UIAlertView * alert =[[UIAlertView alloc]initWithTitle:@"警告" message:message delegate:nil cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alert show];
#else
    [self alertMessageIOS8:message];
#endif
}



+(void)alertMessageIOS8:(NSString*)message{
    UIAlertController * alertController =[UIAlertController alertControllerWithTitle:@"警告" message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * okAction =[UIAlertAction actionWithTitle:@"确定" style:1 handler:^(UIAlertAction *action) {
    }];
    [alertController addAction:okAction];
    [AppRootViewController presentViewController:alertController animated:YES completion:nil];
}

/**
 *  消息提示，timeInterval秒后消失
 *
 *  @param message 提示消息
 */
+(void)showMessage:(NSString *)message
{
    UIWindow * window = [UIApplication sharedApplication].keyWindow;
    UIView *showview =  [[UIView alloc]init];
    showview.backgroundColor = [UIColor blackColor];
    showview.frame = CGRectMake(1, 1, 1, 1);
    showview.alpha = 1.0f;
    showview.layer.cornerRadius = 5.0f;
    showview.layer.masksToBounds = YES;
    [window addSubview:showview];
    
    UILabel *label = [[UILabel alloc]init];
    // 根据字体得到NSString的尺寸
#if __IPHONE_OS_VERSION_MIN_REQUIRED <= __IPHONE_6_0
    CGSize LabelSize = [message sizeWithFont:[UIFont systemFontOfSize:17] constrainedToSize:CGSizeMake(290, 9000)];
#else
    UIFont *fnt = [UIFont fontWithName:@"HelveticaNeue" size:17.0f];
    label.font = fnt;
    
    CGSize LabelSize = [message sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:fnt,NSFontAttributeName, nil]];
#endif
    label.frame = CGRectMake(10, 5, LabelSize.width, LabelSize.height);
    label.text = message;
    label.textColor = [UIColor whiteColor];
    label.textAlignment = 1;
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:15];
    [showview addSubview:label];
    showview.frame = CGRectMake((kScreeWidth - LabelSize.width - 20)/2, kScreeHeight - 100, LabelSize.width+20, LabelSize.height+10);
    [UIView animateWithDuration:timeInterval animations:^{
        showview.alpha = 0;
    } completion:^(BOOL finished) {
        [showview removeFromSuperview];
    }];
    
    
}


#pragma mark 暂未使用



/**
 *  创建屏幕大小图层
 *
 *  @return 返回图层
 */
+ (CALayer *) showMask {
    CALayer *maskLayer = [CALayer layer];
    [maskLayer setFrame:AppRootView.frame];
    [maskLayer setBackgroundColor:[[UIColor grayColor] CGColor]];
    //
    maskLayer.opacity = 0.9 ;
    [AppRootView.layer addSublayer:maskLayer];
    return maskLayer;
    
}
/**
 *  移除图层
 *
 *  @param maskLayer 被移除图层
 */


- (void) hiddenMask:(CALayer *)maskLayer{
    
    [maskLayer removeFromSuperlayer];
}

@end
