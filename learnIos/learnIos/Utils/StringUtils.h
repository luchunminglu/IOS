//
//  StringUtils.h
//  learnIos
//
//  Created by chunminglu on 16/2/17.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringUtils : NSObject

/**
 *  判断字符串是否相同
 *
 *  @param s1          <#s1 description#>
 *  @param s2          <#s2 description#>
 *  @param isIgnoreCase YES,忽略大小写，NO不忽略。
 *
 *  @return <#return value description#>
 */
+(BOOL) equals:(NSString*) s1 To:  (NSString*) s2 ByIgnoreCase:(BOOL) isIgnoreCase;

/**
 *  是否为空或者nil
 *
 *  @param s <#s description#>
 *
 *  @return <#return value description#>
 */
+(BOOL) isNullOrEmpty:(NSString*) s;

/**
 *  判断字符串是否为nil或空白
 *
 *  @param s <#s description#>
 *
 *  @return <#return value description#>
 */
+(BOOL) isNullOrWhiteSpace:(NSString*) s;

/**
 *  如果为nil,返回@"";
 *
 *  @param s <#s description#>
 *
 *  @return <#return value description#>
 */
+(NSString*) trim:(NSString*) s;



@end
