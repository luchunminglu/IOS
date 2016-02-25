//
//  ToastUtils.m
//  learnIos
//
//  Created by chunminglu on 16/2/25.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "ToastUtils.h"

@implementation ToastUtils

/**
 *  toast a str
 *
 *  @param str        <#str description#>
 *  @param controller <#controller description#>
 */
-(void) toast:(NSString*) str inController:(UIViewController*) controller{
    [controller.view makeToast:str duration:1.0 position:CSToastPositionCenter];
}


/**
 *  显示暗示页面活动的指示符
 *
 *  @param controller
 */
-(void) makeToastActivity:(UIViewController*) controller{
    [controller.view makeToastActivity:CSToastPositionCenter];
}

/**
 *  隐藏暗示页面活动的指示符
 *
 *  @param controller
 */
-(void) hideToastActivity:(UIViewController*) controller{
    [controller.view hideToastActivity];
}

@end
