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
    if([self isNullOrWhiteSpace:s1] && [self isNullOrWhiteSpace:s2]){
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
    
    if ([[NSNull null] isEqual:s]) {
        return @"";
    }
    
    return [s stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

/**
 *  判断字符串s1中是否包含s2
 *  如果s1 s2 均为空白，则认为它们等价
 *  @param s1           <#s1 description#>
 *  @param s2           <#s2 description#>
 *  @param isIgnoreCase <#isIgnoreCase description#>
 *
 *  @return <#return value description#>
 */
+(BOOL) contains:(NSString*) s1 To:  (NSString*) s2 ByIgnoreCase:(BOOL) isIgnoreCase{
    if([self isNullOrWhiteSpace:s1] && [self isNullOrWhiteSpace:s2]){
        return YES;
    }
    
    if(s1 == nil || s2 == nil){
        return NO;
    }
    
    if(isIgnoreCase){
        NSRange range = [[[self trim:s1] lowercaseString] rangeOfString: [[self trim:s2] lowercaseString]];
        
        if (range.location != NSNotFound) {
            return YES;
        }
        else{
            return NO;
        }
        
    }
    else{
        NSRange range = [[self trim:s1]  rangeOfString: [self trim:s2]];
        
        if (range.location != NSNotFound) {
            return YES;
        }
        else{
            return NO;
        }
    }
}


/**
 *  将字符串分割，同时去除空项
 
 *
 *  @param s1       <#s1 description#>
 *  @param separaor <#separaor description#>
 *
 *  @return <#return value description#>
 */
+(NSArray*) split:(NSString*) s1 splitor:(NSString*)separaor{
    NSMutableArray* array = [NSMutableArray new];
    if ([self isNullOrWhiteSpace:s1]) {
        return array;
    }
    
    NSArray* result = [s1 componentsSeparatedByString:separaor];
    
    for (NSString* item in result) {
        if ([self isNullOrWhiteSpace:item]) {
            continue;
        }
        
        [array addObject:item];
    }
    
    return array;
}


/**
 *  将字符串以空白分割，同时去除空项
 
 *
 *  @param s1       <#s1 description#>
 *  @param separaor <#separaor description#>
 *
 *  @return <#return value description#>
 */
+(NSArray*) split:(NSString*) s1{
    NSMutableArray* array = [NSMutableArray new];
    if ([self isNullOrWhiteSpace:s1]) {
        return array;
    }
    
    NSArray* result = [s1 componentsSeparatedByCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    
    for (NSString* item in result) {
        if ([self isNullOrWhiteSpace:item]) {
            continue;
        }
        
        [array addObject:item];
    }
    
    return array;
}


/**
 *  获取app的名字
 *
 *  @return <#return value description#>
 */
+(NSString*) appName{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"];
}

/**
 *  获取app的build号
 *
 *  @return <#return value description#>
 */
+(NSString*) appBuild{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"];
}


/**
 *  获取app的version号
 *
 *  @return <#return value description#>
 */
+(NSString*) appVersion{
    return [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"];
}

@end
