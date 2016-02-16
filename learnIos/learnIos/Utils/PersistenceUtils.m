//
//  PersistenceUtils.m
//  learnIos
//
//  Created by chunminglu on 16/2/16.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "PersistenceUtils.h"

/**
 *  every application gets its own /Documents folder, and applications are allowed to read and write from only their own /Documents directory.
 */
@implementation PersistenceUtils


/**
 *  获取本程序的/Documents目录
 *
 *  @return <#return value description#>
 */
+(NSString*) getDirectoryOfDocuments{
    NSArray* paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //[paths[0] stringByAppendingPathComponent:@"theFile.txt"];//构建在/Documents下的theFile.txt路径。
    return paths[0];
}


/**
 *  获取保存在临时目录的fileName指定的文件名
 *
 *  @param fileName <#fileName description#>
 *
 *  @return <#return value description#>
 */
+(NSString*) getTemporaryFile:(NSString*)fileName{
    NSString* tempPath = NSTemporaryDirectory();
    return [tempPath stringByAppendingPathComponent:@"tempFile.txt"];
}

@end
