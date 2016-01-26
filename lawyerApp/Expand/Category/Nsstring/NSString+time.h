//
//  NSString+time.h
//  TestDemo
//
//  Created by mdhj－2 on 16/1/8.
//  Copyright © 2016年 apple . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (time)
/**
 *  判断某个时间是否在一个时间段内
 *
 *  @param oneTime     开始时间
 *  @param otherTimer  结束时间
 *  @param compareTime 比较时间
 *  @param formatter   时间格式
 *
 *  @return 是否在时间段内
 */
-(BOOL) isBetweenOneToOther:(NSString *)oneTime otherTime:(NSString*)otherTimer compareTime:(NSString*)compareTime formatter:(NSDateFormatter*)formatter;

/**
 *  转换data格式
 *
 *  @param date           转换前的时间
 *  @param originalFormatter   原来的格式
 *  @param switchFormatter 转换后的格式
 *
 *  @return 转换后的时间
 */
-(NSString *)setDateStringFormat:(NSString *)date originalFormatter:(NSDateFormatter*)originalFormatter switchFormatter:(NSDateFormatter*)switchFormatter;


/**
 *  根据所需格式返回当前时间
 *
 *  @param formatter 时间格式
 *
 *  @return 当前时间
 */
-(NSString *)getNowDateWithformatter:(NSDateFormatter*)formatter;
@end
