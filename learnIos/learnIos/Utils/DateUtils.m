//
//  DateUtils.m
//  learnIos
//
//  Created by chunminglu on 16/2/18.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "DateUtils.h"

@implementation DateUtils

/**
 *  将时间转换为字符串
 *
 *  @param date   <#date description#>
 *  @param foramt 如"yyyy-MM-dd"  "yyyy-MM-dd HH:mm:ss"
 *
 *  @return <#return value description#>
 */
+(NSString*) convertToString:(NSDate*) date format:(NSString*) foramt{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:foramt];
    //设置时区，不然会差8小时
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    return [formatter stringFromDate:date];
}

/**
 *  将时间转换为字符串
 *
 *  @param str   <#date description#>
 *  @param foramt 如"yyyy-MM-dd"  "yyyy-MM-dd HH:mm:ss"
 *
 *  @return <#return value description#>
 */
+(NSDate*) convertToDate:(NSString*) str format:(NSString*) foramt{
    NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:foramt];
    //设置时区，不然会差8小时
    [formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    return [formatter dateFromString:str];
}

/**
 *  获取当前时间
 *
 *  @return <#return value description#>
 */
+(NSDate*) nowDate{
    return [NSDate date];
}

/**
 *  给date增减指定的秒数
 *  NSTimeInterval = double
 *
 *  @return <#return value description#>
 */
+(NSDate*) addSeconds:(NSDate*) date add:(NSTimeInterval)seconds{
    //负数返回之前时间，正数返回之后时间
    return [date dateByAddingTimeInterval:seconds];
}



@end
