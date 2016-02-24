//
//  TimerEx.m
//  learnIos
//
//  Created by chunminglu on 16/2/24.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "TimerEx.h"


@interface TimerEx()

/**
 * 底层的timer实例
 */
@property (strong,nonatomic) NSTimer* timer;

@end


@implementation TimerEx

/**
 *  开始定时器
 *
 *  @param seconds 定时器时间间隔 单位秒，实际上是一个double
 */
-(void) startTimer:(NSTimeInterval)seconds{
    
    /*
     repeats: If YES, the timer will repeatedly reschedule itself until invalidated. If NO, the timer will be invalidated after it fires.
     */
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:seconds target:self selector:@selector(timerCallback:) userInfo:nil repeats:YES];
    
    //scheduled方法已经加到currentRunLoop中了
    //[[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}

/**
 *  定时器回调
 *
 *  @param timer <#timer description#>
 */
- (void)timerCallback:(NSTimer *)timer{
    
}

/**
 *  停止定时器
 */
-(void) stopTimer{
    if (self.timer != nil) {
        //定时器失效
        [self.timer invalidate];
    }
}

@end
