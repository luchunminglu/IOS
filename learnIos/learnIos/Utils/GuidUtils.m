//
//  GuidUtils.m
//  learnIos
//
//  Created by chunminglu on 16/3/12.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "GuidUtils.h"
#import <AdSupport/ASIdentifierManager.h>


@implementation GuidUtils

/**
 *
 *  创建一个随机唯一的Guid
 *  @return
 */
+(NSString*) GuidString{
    return [[NSUUID UUID] UUIDString];
}

/**
 *  返回给在这个设备上所有软件供应商相同的 一个值，所以只能在广告的时候使用。这个值会因为很多情况而有所变化，比如说用户初始化设备的时候便会改变。
 *
 *  @return <#return value description#>
 */
+(NSString*) deviceId{
    NSString *identifierForAdvertising = [[ASIdentifierManager sharedManager].advertisingIdentifier UUIDString];
    return identifierForAdvertising;
}

@end
