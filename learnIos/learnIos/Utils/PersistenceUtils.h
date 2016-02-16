//
//  PersistenceUtils.h
//  learnIos
//
//  Created by chunminglu on 16/2/16.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersistenceUtils : NSObject

/**
 *  获取本程序的/Documents目录
 *
 *  @return <#return value description#>
 */
+(NSString*) getDirectoryOfDocuments;


/**
 *  获取保存在临时目录的fileName指定的文件名
 *
 *  @param fileName <#fileName description#>
 *
 *  @return <#return value description#>
 */
+(NSString*) getTemporaryFile:(NSString*)fileName;

@end
