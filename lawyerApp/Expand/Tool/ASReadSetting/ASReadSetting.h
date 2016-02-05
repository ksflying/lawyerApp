//
//  ASReadSetting.h
//  demo
//
//  Created by apple  on 15/11/27.
//  Copyright © 2015年 apple . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ASReadSetting : NSObject
/**
 *  返回配置文件字典
 *
 *  @return 返回配置文件字典
 */
+(NSMutableDictionary *)readSettingPlist;
/**
 *  根据info返回配置文件字典中的数组
 *
 *  @param info 配置文件字段
 *
 *  @return 根据info返回配置文件字典中的数组
 */
+(NSArray *)readSettingPlist:(NSString *) info;
/**
 *  根据info返回配置文件字典中的字典
 *
 *  @param info 配置文件字段
 *
 *  @return 根据info返回配置文件字典中的字典
 */
+(NSDictionary *)readSettingPlistOther:(NSString *) info;
@end
