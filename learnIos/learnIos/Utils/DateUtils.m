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

@end
