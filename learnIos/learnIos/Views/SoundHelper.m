//
//  SoundHelper.m
//  learnIos
//
//  Created by chunminglu on 16/2/29.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "SoundHelper.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation SoundHelper

/**
 *  震动
 *  你不能修改震动参数，每个调用都会生成一个简短的1~2秒的震动。在不支持震动的平台上，该调用不执行任何操作，但也不会发生错误！
 *  可以在非UI线程
 */
+(void) vibrate{
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

/**
 *  播放声音  可以在非UI线程
 */
+(void) playSound{
    SystemSoundID soundId = 0;
    NSString* path = [[NSBundle mainBundle] pathForResource:@"msg" ofType:@"wav"];
    if (path) {
        AudioServicesCreateSystemSoundID((__bridge  CFURLRef)[NSURL fileURLWithPath:path], &soundId);
        AudioServicesPlaySystemSound(soundId);
    }
}


@end
