//
//  ASAlbum.h
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
/*
    相册拍照
 */
typedef void (^sendPictureBlock)(UIImage *image);

@interface ASAlbum : NSObject<UIActionSheetDelegate,UINavigationControllerDelegate, UIImagePickerControllerDelegate>
@property (nonatomic,copy)sendPictureBlock sPictureBlock;
/**
 *  打开相册，并且返回照片
 *
 *  @param block 照片
 */
+ (void )sharedPictureFromAlbum:(sendPictureBlock)block;
/**
 *  打开相机，并且返回照片
 *
 *  @param block 照片
 */
+ (void )sharedPictureFromCamera:(sendPictureBlock)block;



@end
