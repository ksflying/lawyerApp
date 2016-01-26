//
//  ASAlbum.m
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "ASAlbum.h"

#define AppRootView  ([[[[[UIApplication sharedApplication] delegate] window] rootViewController] view])

#define AppRootViewController  ([[[[UIApplication sharedApplication] delegate] window] rootViewController])
@implementation ASAlbum

+ (ASAlbum *)sharedModel{
    static ASAlbum *sharedModel = nil;
    static dispatch_once_t oneToken;
    dispatch_once(&oneToken, ^{
        sharedModel = [[self alloc] init];
    });
    return sharedModel;
}


+ (void)sharedPictureFromAlbum:(sendPictureBlock)block;
{
    ASAlbum *album = [ASAlbum sharedModel];
    album.sPictureBlock =block;
    [album pushAlbumView];

}

+ (void )sharedPictureFromCamera:(sendPictureBlock)block
{
    ASAlbum *album = [ASAlbum sharedModel];
    album.sPictureBlock =block;
    [album takePhote];
}

-(void) pushAlbumView
{
    UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypePhotoLibrary;
    UIImagePickerController * picker = [[UIImagePickerController alloc]init];
    picker.delegate = self;
    picker.allowsEditing=YES;
    picker.sourceType=sourceType;
    [AppRootViewController presentViewController:picker animated:YES completion:NULL];
}
-(void) takePhote
{
    UIImagePickerControllerSourceType sourceType=UIImagePickerControllerSourceTypeCamera;
    
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        UIImagePickerController * picker = [[UIImagePickerController alloc]init];
        picker.delegate = self;
        picker.allowsEditing=YES;
        picker.sourceType=sourceType;
        [AppRootViewController presentViewController:picker animated:YES completion:NULL];
    }
    else
    {
        NSLog(@"不支持照相");
    }
    
}


#pragma mark <UIImagePickerControllerDelegate>
//选择完毕：
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    ASAlbum *album = [ASAlbum sharedModel];
    
    [picker dismissViewControllerAnimated:YES completion:^{}];
    
    UIImage *image = [info objectForKey:UIImagePickerControllerEditedImage];
    
    [album sPictureBlock](image);
    
}
//调用返回相册或者拍照图片
/*
-(void) addIMage
{
#if __IPHONE_OS_VERSION_MIN_REQUIRED <= __IPHONE_8_0
    
    //上传图片操作开始，选择图片的来源
    UIActionSheet*menu=[[UIActionSheet alloc]
                        initWithTitle:@"照片录入"
                        delegate:self
                        cancelButtonTitle:@"取消"
                        destructiveButtonTitle:nil
                        otherButtonTitles:@"拍照",@"从相册上传",nil];
    menu.actionSheetStyle=UIActionSheetStyleBlackTranslucent;
    [menu showInView:self.view];
    
#else
    
    UIAlertController *alertController=[UIAlertController alertControllerWithTitle:nil message:@"照片录入" preferredStyle:(UIAlertControllerStyleActionSheet)];
    UIAlertAction *cancelAction=[UIAlertAction actionWithTitle:@"取消" style:(UIAlertActionStyleCancel) handler:^(UIAlertAction *action) {
        ;
    }];
    UIAlertAction *takePtotoAction=[UIAlertAction actionWithTitle:@"拍照" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        [self shareForGetCamera];
        
    }];
    UIAlertAction *ptotoAction=[UIAlertAction actionWithTitle:@"从相册上传" style:(UIAlertActionStyleDefault) handler:^(UIAlertAction *action) {
        [self shareForGetPicture];
    }];
    [alertController addAction:cancelAction];
    [alertController addAction:takePtotoAction];
    [alertController addAction:ptotoAction];
    [self presentViewController:alertController animated:YES completion:nil];
    
#endif
    
}

-(void)actionSheet:(UIActionSheet*)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    if(buttonIndex==0){
        
        [self shareForGetCamera];
        
        
    }else if(buttonIndex==1){
        [self shareForGetPicture];
        
    }
    
}


-(void)shareForGetCamera
{
    [ASAlbum sharedPictureFromCamera:^(UIImage *image) {
        if (image!=nil) {
            
        }

    }];
    
}


-(void)shareForGetPicture
{
    [ASAlbum sharedPictureFromAlbum:^(UIImage *image) {
        if (image!=nil) {

        }

    }];
    
}
*/

@end
