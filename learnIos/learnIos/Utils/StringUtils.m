//
//  StringUtils.m
//  learnIos
//
//  Created by chunminglu on 16/2/17.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "StringUtils.h"

@implementation StringUtils



/**
 *  判断字符串是否相同
 *
 *  @param s1          s1
 *  @param s2          s2
 *  @param isIgnoreCase YES,忽略大小写，NO不忽略。
 *
 *  @return <#return value description#>
 */
+(BOOL) equals:(NSString *)s1 To:(NSString *)s2 ByIgnoreCase:(BOOL)isIgnoreCase{
    if([self isNullOrWhiteSpace:s1] || [self isNullOrWhiteSpace:s2]){
        return YES;
    }
    
    if(s1 == nil || s2 == nil){
        return NO;
    }
    
    if(isIgnoreCase){
        return [[self trim:s1] caseInsensitiveCompare:[self trim:s2]] == NSOrderedSame;
    }
    else{
        return [[self trim:s1] isEqualToString:[self trim:s2]];
    }
}

/**
 *  判断字符串是否为空或nil
 *
 *  @param s s
 *
 *  @return
 */
+(BOOL) isNullOrEmpty:(NSString *)s{
    if(s==nil || [s isEqualToString:@""]){
        return YES;
    }
    else{
        return NO;
    }
}

/**
 *  判断字符串是否为空白或nil
 *
 *  @param s <#s description#>
 *
 *  @return <#return value description#>
 */
+(BOOL) isNullOrWhiteSpace:(NSString *)s{
    if(s==nil || [[self trim:s] isEqualToString:@""]){
        return YES;
    }
    else{
        return NO;
    }
}


/**
 *  如果为nil,返回空字符串。
 *  否则去掉前后空白
 *
 *  @param s <#s description#>
 *
 *  @return <#return value description#>
 */
+(NSString*) trim:(NSString *)s{
    if (s == nil){
        return @"";
    }
    
    return [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}


@end
