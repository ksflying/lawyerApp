//
//  NSString+time.m
//  TestDemo
//
//  Created by mdhj－2 on 16/1/8.
//  Copyright © 2016年 apple . All rights reserved.
//

#import "NSString+time.h"

@implementation NSString (time)
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
-(BOOL) isBetweenOneToOther:(NSString *)oneTime otherTime:(NSString*)otherTimer compareTime:(NSString*)compareTime formatter:(NSDateFormatter*)formatter
{
    //NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //[formatter setDateFormat:@"mm:ss"];
    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSDate *startTime=[formatter dateFromString:oneTime];
    NSDate *endTime=[formatter dateFromString:otherTimer];
    NSDate *middleTime=[formatter dateFromString:compareTime];
    if(([middleTime compare:startTime]==NSOrderedDescending)&&([middleTime compare:endTime]==NSOrderedAscending))
    {
        NSLog(@"yes");
        return YES;
    }
    NSLog(@"no");
    return NO;
}
/**
 *  根据所需格式返回当前时间
 *
 *  @param formatter 时间格式
 *
 *  @return 当前时间
 */
-(NSString *)getNowDateWithformatter:(NSDateFormatter*)formatter
{
    
    NSString *date=[formatter stringFromDate:[NSDate date]];
    return date;
}

/**
 *  转换data格式
 *
 *  @param date           转换前的时间
 *  @param originalFormatter   原来的格式
 *  @param switchFormatter 转换后的格式
 *
 *  @return 转换后的时间
 */
-(NSString *)setDateStringFormat:(NSString *)date originalFormatter:(NSDateFormatter*)originalFormatter switchFormatter:(NSDateFormatter*)switchFormatter
{
    //    //NSString-->NSDate
    //    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    //    [formatter setDateFormat:@"yyyyMMdd"];
    //    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    //    //[formatter setTimeZone:[NSTimeZone timeZoneWithName:@"GMT"]];
    //    NSDate *dateFormatted = [formatter dateFromString:date];
    //    //NSDate-->NSString
    //    [formatter setDateFormat:@"yyyy-MM-dd"];
    //    [formatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    
    [originalFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    NSDate *dateFormatted = [originalFormatter dateFromString:date];
    [switchFormatter setTimeZone:[NSTimeZone timeZoneWithName:@"UTC"]];
    return [switchFormatter stringFromDate:dateFormatted];
}

@end
