//
//  ToastUtils.h
//  learnIos
//
//  Created by chunminglu on 16/2/25.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIView+Toast.h"

@interface ToastUtils : NSObject

/**
 *  toast a str
 *
 *  @param str        <#str description#>
 *  @param controller <#controller description#>
 */
-(void) toast:(NSString*) str inController:(UIViewController*) controller;


/**
 *  显示暗示页面活动的指示符
 *
 *  @param controller
 */
-(void) makeToastActivity:(UIViewController*) controller;

/**
 *  隐藏暗示页面活动的指示符
 *
 *  @param controller
 */
-(void) hideToastActivity:(UIViewController*) controller;

@end
