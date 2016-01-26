//
//  ASRequest.m
//  lawterApp
//
//  Created by ksflying on 15/10/15.
//  Copyright (c) 2015年 Ks.H. All rights reserved.
//

#import "ASRequest.h"
#import "AFNetworking.h"
@implementation ASRequest

+(void) requestByPostWithUrl:(NSString *)urlString parameters:(NSDictionary *)parameters Complete:(void (^)(id object))success faile:(void(^)(NSError *error))failture
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    // 设置超时时间
    [manager.requestSerializer setTimeoutInterval:10.0f];
    
    //发送请求
    [manager POST:urlString parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //调用success
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failture(error);
        
    }];
}

+(void) requestByGetWithUrl:(NSString *)urlString Complete:(void (^)(id object))success faile:(void(^)(NSError *error))failture
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/xml", @"text/plain", nil];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        success(responseObject);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        
        failture(error);
        
    }];
}




+(void) requestWithUrlByGet:(NSString *)urlString Complete:(void (^)(NSData *data))success faile:(void(^)(NSError *error))failture
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //调用success
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failture(error);
    }];
    
}

+(void) requestWithUrlByPost:(NSString *)urlString parameters:(NSDictionary *)parameters Complete:(void (^)(NSData *data))success faile:(void(^)(NSError *error))failture
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    // 设置超时时间
    [manager.requestSerializer willChangeValueForKey:@"timeoutInterval"];
    //manager.requestSerializer.timeoutInterval = 1.0f;
    [manager.requestSerializer setTimeoutInterval:10.0f];
    //NSLog(@"%f",manager.requestSerializer.timeoutInterval);
    [manager.requestSerializer didChangeValueForKey:@"timeoutInterval"];
    //申明返回的结果是二进制类型
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    //申明请求的数据是json类型
    manager.requestSerializer=[AFJSONRequestSerializer serializer];

    //发送请求
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //调用success
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failture(error);
    }];
}

+(void) requestWithUrlForBaidu:(NSString *)urlString Complete:(void (^)(NSData *data))success faile:(void(^)(NSError *error))failture
{
    AFHTTPRequestOperationManager *manager=[AFHTTPRequestOperationManager manager];
    [manager.requestSerializer setValue:@"d71314dc1c66f747e8caae22b679802f" forHTTPHeaderField:@"apikey"];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager GET:urlString parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        //调用success
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failture(error);
    }];
    
}




@end
