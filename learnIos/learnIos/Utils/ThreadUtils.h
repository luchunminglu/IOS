//
//  ThreadUtils.h
//  learnIos
//
//  Created by chunminglu on 16/2/17.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ThreadUtils : NSObject



/**
 *  在多线程中执行action回调  GCD支持Cocoa的内存管理机制，因此可以再提交到queue的block自由的使用OC对象。每个dispatch queue维护自己的autorelease pool 确保释放autorelease对象，但是queue不保证这些对象实际释放时间。如果应用需要大量内存，可以自建autorelease pool.除非有明确理由，否则不建议这么做。
 *
 *  @param action action回调
 */
+(void) dispatch:(void (^) (void)) action;

/**
 *  在主线程上执行action回调
 *
 *  @param action action回调
 */
+(void) dispatchMain:(void (^)(void))action;

/**
 *  将一系列actions分布到多线程中 GCD支持Cocoa的内存管理机制，因此可以再提交到queue的block自由的使用OC对象。每个dispatch queue维护自己的autorelease pool 确保释放autorelease对象，但是queue不保证这些对象实际释放时间。如果应用需要大量内存，可以自建autorelease pool.除非有明确理由，否则不建议这么做。
 *
 *  @param actions   一系列action
 *  @param completed 当action完成时的异步回调
 */
+(void) dispatchGroup:(NSArray*) actions onCompleted:(void (^)(void)) completed;


#pragma mark -定时器Dispatch实现

/**
 *  在指定秒数之后在主线程上执行一段代码 仅执行一次
 *
 *  @param action  <#action description#>
 *  @param seconds <#seconds description#>
 */
+(void) dispatchOnce:(void (^)(void))action after:(double) seconds;


/**
 *  在指定秒数之后在主线程上执行一段代码 仅执行一次
 *
 *  @param action  <#action description#>
 *  @param seconds <#seconds description#>
 */
+(void) dispatch:(void (^)(void))action repeatTime:(double) periodSeconds;

@end
