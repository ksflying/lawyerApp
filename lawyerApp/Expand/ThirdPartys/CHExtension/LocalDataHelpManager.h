//
//  LocalDataHelpManager.h
//  demo
//
//  Created by mdhj－2 on 15/11/4.
//  Copyright © 2015年 HQcoder. All rights reserved.
//
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@interface LocalDataHelpManager : NSObject
///存文件
+ (void)writeToLocalWithPatch:(NSString *)aPath dateName:(NSString *)aDateName data:(NSDictionary *)aData;
///取文件
+ (NSDictionary *)readToLocalwithPatch:(NSString *)aPath dateName:(NSString *)aDateName;
///删除文件
+ (void)deleteFileWithPath:(NSString *)aPath dataName:(NSString *)aDateName;

///保存图片
+ (void)saveDownloadImage:(UIImage *)image filePath:(NSString *)aPath;


///程序启动读取收藏列表
+ (NSArray *)readLocalMyCollectionList;
///程序退出保存收藏列表到本地
+ (void)waitLocalMyCollectionListWithArray:(NSArray *)listArray;
///判断本地是否有这个文件
+ (BOOL)isExistsFile:(NSString *)fileName;



@end
