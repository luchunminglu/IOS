//
//  MessageBarUtils.h
//  learnIos
//
//  Created by chunminglu on 16/3/13.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TWMessageBarManager.h"

@interface MessageBarUtils : NSObject

/**
 *  展示一条消息
 *
 *  @param title   <#title description#>
 *  @param content <#content description#>
 */
+(void) showMessage:(NSString*) title content:(NSString*) content;

/**
 *  隐藏
 */
+(void) hideAllMessage;


@end
