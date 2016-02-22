//
//  ScreenUtils.m
//  learnIos
//
//  Created by chunminglu on 16/2/22.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "ScreenUtils.h"

@implementation ScreenUtils

/**
 *  获取屏幕宽度  单位point  该方法考虑了屏幕旋转
 *
 *  @return <#return value description#>
 */
+(CGFloat) screenWidth{
    return [UIScreen mainScreen].bounds.size.width;
}

/**
 *  获取屏幕高度 单位point  该方法考虑了屏幕旋转
 *
 *  @return <#return value description#>
 */
+(CGFloat) screenHeight{
    return [UIScreen mainScreen].bounds.size.height;
}

@end
