//
//  JsonUtils.h
//  learnIos
//
//  Created by chunminglu on 16/2/26.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import <Foundation/Foundation.h>


/*
 
 NSJSONSerialization能将JSON转换成Foundation对象，也能将Foundation对象转换成JSON，但转换成JSON的对象必须具有如下属性：
 1，顶层对象必须是NSArray或者NSDictionary
 2，所有的对象必须是NSString、NSNumber、NSArray、NSDictionary、NSNull的实例
 3，所有NSDictionary的key必须是NSString类型
 4，数字对象不能是非数值或无穷
 注意：尽量使用NSJSONSerialization.isValidJSONObject先判断能否可以转换。
 
 */
@interface JsonUtils : NSObject

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
+(NSString*) convertToJson:(id) jsonObject readable:(BOOL) readable;

/**
 *  将json字符串转换为object
 *
 *  @param str <#str description#>
 *
 *  @return <#return value description#>
 */
+(id) convertToObject:(NSString*) str;


@end
