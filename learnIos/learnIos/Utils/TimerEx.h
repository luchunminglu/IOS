//
//  TimerEx.h
//  learnIos
//
//  Created by chunminglu on 16/2/24.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimerEx : NSObject


/**
 *  开始定时器
 *
 *  @param seconds 定时器时间间隔 单位秒，实际上是一个double
 */
-(void) startTimer:(NSTimeInterval)seconds;

/**
 *  停止定时器
 */
-(void) stopTimer;



@end
