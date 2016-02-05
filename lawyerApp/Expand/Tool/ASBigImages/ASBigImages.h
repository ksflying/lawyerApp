//
//  ASBigImages.h
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import <UIKit/UIKit.h>
/*
    图片浏览
 */
@interface ASBigImages : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *numberOfimageArray;
//设置默认滚动到第几页
@property(nonatomic,assign) NSInteger selectIndex;
//图片数组
@property(nonatomic,copy) NSArray *imageRuls;
@end
