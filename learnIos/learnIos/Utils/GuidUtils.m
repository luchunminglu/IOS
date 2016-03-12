//
//  GuidUtils.m
//  learnIos
//
//  Created by chunminglu on 16/3/12.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "GuidUtils.h"


@implementation GuidUtils

/**
 *
 *  创建一个随机唯一的Guid
 *  @return
 */
+(NSString*) GuidString{
    return [[NSUUID UUID] UUIDString];
}

@end
