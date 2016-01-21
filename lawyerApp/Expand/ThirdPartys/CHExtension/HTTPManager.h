//
//  HTTPManager.h
//  B_test
//
//  Created by lanou3g on 15/9/18.
//  Copyright (c) 2015年 chehao. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"

@interface HTTPManager : AFHTTPRequestOperationManager

//接口域名
//@property (copy, nonatomic) NSString *yrrUrlString;
//@property (copy, nonatomic) NSString *upLoadImageUrl;
//@property (copy, nonatomic) NSString *myCollectionImageURL;
//@property (copy, nonatomic) NSString *imageUrl;



//- (NSString *)imageUrl;
//- (void)setImageUrl:(NSString *)urlString;
////--------
//- (NSString *)yrrUrlString;
//- (void)setYrrUrlString:(NSString *)yrrUrlString;
////--------
//- (NSString *)upLoadImageUrl;
//- (void)setUpLoadImageUrl:(NSString *)upLoadImageUrl;
////--------
//- (NSString *)myCollectionImageURL;
//- (void)setMyCollectionImageURL:(NSString *)myCollectionImageURL;
////--------
+ (instancetype)manager;
@end
