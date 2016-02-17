//
//  ThreadUtils.m
//  learnIos
//
//  Created by chunminglu on 16/2/17.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "ThreadUtils.h"

@implementation ThreadUtils



/**
 *  在多线程中执行action回调    GCD支持Cocoa的内存管理机制，因此可以再提交到queue的block自由的使用OC对象。每个dispatch queue维护自己的autorelease pool 确保释放autorelease对象，但是queue不保证这些对象实际释放时间。如果应用需要大量内存，可以自建autorelease pool.除非有明确理由，否则不建议这么做。
 *
 *  @param action action回调
 */
+(void) dispatch:(void (^) (void)) action{
    if(action){
        //使用具有默认优先级的队列执行
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        dispatch_async(queue, action);
    }
}

/**
 *  在主线程上执行action回调      GCD支持Cocoa的内存管理机制，因此可以再提交到queue的block自由的使用OC对象。每个dispatch queue维护自己的autorelease pool 确保释放autorelease对象，但是queue不保证这些对象实际释放时间。如果应用需要大量内存，可以自建autorelease pool.除非有明确理由，否则不建议这么做。
 *
 *  @param action action 回调
 */
+(void) dispatchMain:(void (^)(void))action{
    if(action){
        dispatch_async(dispatch_get_main_queue(), action);
    }
}

/**
 *  将一系列actions分布到多线程中
 *
 *  @param actions   一系列action
 *  @param completed 当action完成时的异步回调
 */
+(void) dispatchGroup:(NSArray*) actions onCompleted:(void (^)(void)) completed{
    if (actions == nil || [actions count] == 0) {
        return;
    }
    
    dispatch_group_t group = dispatch_group_create();
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    
    for (id action in actions) {
        dispatch_group_async(group, queue, action);
    }
    
    //notify异步调用
    dispatch_group_notify(group, queue,completed);
    
}


@end
