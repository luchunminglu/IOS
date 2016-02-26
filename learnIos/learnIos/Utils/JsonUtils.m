//
//  JsonUtils.m
//  learnIos
//
//  Created by chunminglu on 16/2/26.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "JsonUtils.h"

@implementation JsonUtils

/**
 *  将对象转换为json
 *
 *  支持Dictionary Array, 如果是Array里面的项最好是Dictionary，而不是自定义对象
 *
 *  @param jsonObject <#jsonObject description#>
 *  @param readable 是否有利于阅读
 *
 *  @return <#return value description#>
 */
+(NSString*) convertToJson:(id) jsonObject readable:(BOOL) readable{
    NSData* jsonData = [NSJSONSerialization dataWithJSONObject:jsonObject options:(readable?NSJSONWritingPrettyPrinted:0) error:nil];
    return [[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding];
}

/**
 *  将json字符串转换为object
 *
 *  @param str <#str description#>
 *
 *  @return <#return value description#>
 */
+(id) convertToObject:(NSString*) str{
    NSData* data = [str dataUsingEncoding:NSUTF8StringEncoding];
    return [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
}

@end
