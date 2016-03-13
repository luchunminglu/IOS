//
//  NotificationUtils.m
//  learnIos
//
//  Created by chunminglu on 16/3/13.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "NotificationUtils.h"

@implementation NotificationUtils


/**
 *  展示Notifition
 *
 *  @param str <#str description#>
 */
+(void) show:(NSString*) str{
    [JDStatusBarNotification showWithStatus:str styleName:@"JDStatusBarStyleSuccess"];
}


@end
