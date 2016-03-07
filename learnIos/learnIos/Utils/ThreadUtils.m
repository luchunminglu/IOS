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
 *  经过测试这是非主线程
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


#pragma mark -定时器Dispatch实现

/**
 *  在指定秒数之后在主线程上执行一段代码  仅执行一次
 *
 *  @param action  <#action description#>
 *  @param seconds <#seconds description#>
 */
+(void) dispatchOnce:(void (^)(void))action after:(double) seconds{
    dispatch_time_t executedTime = dispatch_time(DISPATCH_TIME_NOW, seconds*NSEC_PER_SEC);
    dispatch_after(executedTime, dispatch_get_main_queue(), ^(void){
        if (action) {
            action();
        }
    });
}


/**
 *  在指定秒周期后在多线程上执行一段代码 重复执行
 *
 *  暂时没有提供停止定时器的，
 *  @param action  <#action description#>
 *  @param seconds 重复执行的周期
 */
+(void) dispatch:(void (^)(void))action repeatTime:(double) periodSeconds{
    //The requested global concurrent queue.
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, queue);
    dispatch_source_set_timer(timer, dispatch_walltime(NULL, 0), periodSeconds*NSEC_PER_SEC, 0);
    
    dispatch_source_set_event_handler(timer, ^(void){
        if(action){
            action();
        }
    });
    
    dispatch_resume(timer);
    
}



@end
