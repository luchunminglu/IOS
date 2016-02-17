//
//  UserDefaultUtils.h
//  learnIos
//
//  Created by chunminglu on 16/2/17.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import <Foundation/Foundation.h>


/**
 *  作为NSUserDefaults的拓展工具类
 *  NSUserDefaults用于存储数据量小的数据，如用户配置
 *  NSUserDefaults支持NSSString NSNumber,NSArray,NSDictionary,NSDate
 *  NSUserDefaults并不是保存在/Documents目录下
 */
@interface UserDefaultsUtils : NSObject

/**
 *  获取字符串关联的字符串值
 *
 *  @param key <#key description#>
 *
 *  @return 如果没有关联的key，返回nil
 */
+(NSString*) getStringForKey:(NSString*) key;

/**
 *  获取字符串关联的字符串值
 *
 *  @param key          <#key description#>
 *  @param defaultValue <#defaultValue description#>
 *
 *  @return 如果没有关联的key,返回defaultValue
 */
+(NSString*) getStringForKey:(NSString*) key default:(NSString*) defaultValue;

/**
 *  将key和value组成的配置项写到磁盘上
 *
 *  @param value <#value description#>
 */
+(void) setString:(NSString*) value forKey:(NSString*)key;

/**
 *  获取key关联的bool值，如果没有关联的key,返回NO
 *
 *  @param key <#key description#>
 *
 *  @return <#return value description#>
 */
+(BOOL) GetBoolForKey:(NSString*)key;

/**
 *  将key和value组成的配置项写到磁盘上
 *
 *  @param key <#key description#>
 */
+(void) setBool:(BOOL) value forKey:(NSString*) key;


@end
