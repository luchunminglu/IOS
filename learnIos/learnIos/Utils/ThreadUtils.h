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
 *  在多线程中执行action回调
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
 *  将一系列actions分布到多线程中
 *
 *  @param actions   一系列action
 *  @param completed 当action完成时的异步回调
 */
+(void) dispatchGroup:(NSArray*) actions onCompleted:(void (^)(void)) completed;



@end
