//
//  ASReadSetting.m
//  demo
//
//  Created by apple  on 15/11/27.
//  Copyright © 2015年 apple . All rights reserved.
//

#import "ASReadSetting.h"

@implementation ASReadSetting




+(NSMutableDictionary *)readSettingPlist
{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"setting" ofType:@"plist"];
    
    NSDictionary *tmp = [NSDictionary  dictionaryWithContentsOfFile:path];
    return [[NSMutableDictionary alloc]initWithDictionary:tmp];
    
}

+(NSArray *)readSettingPlist:(NSString *) info
{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"setting" ofType:@"plist"];
    
    NSDictionary *tmp = [NSDictionary  dictionaryWithContentsOfFile:path];
    
    NSArray *result = [NSArray arrayWithArray:tmp[info]];
    return result;
    
}

+(NSDictionary *)readSettingPlistOther:(NSString *) info
{
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"setting" ofType:@"plist"];
    
    NSDictionary *tmp = [NSDictionary  dictionaryWithContentsOfFile:path];
    
    NSDictionary *result = tmp[info];
    return result;
    
}
@end
