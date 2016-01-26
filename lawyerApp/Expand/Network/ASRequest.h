//
//  ASRequest.h
//  loveLimitFree
//
//  Created by qianfeng on 15/9/29.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASRequest : NSObject


/**
 *  完成网络Post请求成功返回id类型数据
 *
 *  @param urlString  网址
 *  @param parameters 参数
 *  @param success    请求完成时的回调
 *  @param failture   请求失败时的回调
 */
+(void) requestByPostWithUrl:(NSString *)urlString parameters:(NSDictionary *)parameters Complete:(void (^)(id object))success faile:(void(^)(NSError *error))failture;

/**
 *  完成网络Get请求成功返回id类型数据
 *
 *  @param urlString  网址
 *  @param parameters 参数
 *  @param success    请求完成时的回调
 *  @param failture   请求失败时的回调
 */
+(void) requestByGetWithUrl:(NSString *)urlString Complete:(void (^)(id object))success faile:(void(^)(NSError *error))failture;



/**
 *  完成网络Get请求成功返回data类型数据
 *
 *  @param urlString 网址
 *  @param success   请求完成时的回调
 *  @param failture  请求失败时的回调
 */
+(void) requestWithUrlByGet:(NSString *)urlString Complete:(void (^)(NSData *data))success faile:(void(^)(NSError *error))failture;

/**
 *  完成网络Post请求成功返回data类型数据
 *
 *  @param urlString  网址
 *  @param parameters 参数
 *  @param success    请求完成时的回调
 *  @param failture   请求失败时的回调
 */
+(void) requestWithUrlByPost:(NSString *)urlString parameters:(NSDictionary *)parameters Complete:(void (^)(NSData *data))success faile:(void(^)(NSError *error))failture;

#pragma mark abandoned
/**
 *  完成网络Get请求(包含HTTP头字段)
 *
 *  @param urlString 网址
 *  @param success   请求完成时的回调
 *  @param failture  请求失败时的回调
 */
+(void) requestWithUrlForBaidu:(NSString *)urlString Complete:(void (^)(NSData *data))success faile:(void(^)(NSError *error))failture;

@end
