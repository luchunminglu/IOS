//
//  MessageBarUtils.m
//  learnIos
//
//  Created by chunminglu on 16/3/13.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "MessageBarUtils.h"

@implementation MessageBarUtils

/**
 *  展示一条消息
 *
 *  @param title   <#title description#>
 *  @param content <#content description#>
 */
+(void) showMessage:(NSString*) title content:(NSString*) content{
    //显示3s
    [[TWMessageBarManager sharedInstance] showMessageWithTitle:title description:content type:TWMessageBarMessageTypeInfo duration:30.0 callback:^{}];
}


/**
 *  隐藏
 */
+(void) hideAllMessage{
    //[[TWMessageBarManager sharedInstance] hideAll];
    [[TWMessageBarManager sharedInstance] hideAllAnimated:YES];
}

@end
