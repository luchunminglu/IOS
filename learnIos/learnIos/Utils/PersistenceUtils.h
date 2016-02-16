//
//  PersistenceUtils.h
//  learnIos
//
//  Created by chunminglu on 16/2/16.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>


@interface PersistenceUtils : NSObject

#pragma mark -File&Directory

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

/**
 *  文件或目录是否存在
 *
 *  @param filePath <#filePath description#>
 *
 *  @return <#return value description#>
 */
+(BOOL) fileExist:(NSString*) filePath;


#pragma mark -Property list


/**
 *  write array to file,如果文件存在，内容被覆盖,文件编码utf8
 *
 *  @param array    <#array description#>
 *  @param fileName 在ios中应该是/Documents目录或子目录下的文件
 */
+(void) writeArray:(NSArray*) array toFile:(NSString*) fileName;

/**
 *  read file
 *
 *  @param fileName <#fileName description#>
 *
 *  @return <#return value description#>
 */
+(NSArray*) readArrayFromFile:(NSString*) fileName;


/**
 *  将Dictionary写到文件中，如果文件存在，内容被覆盖,文件编码utf8
 *
 *  @param dictionary <#dictionary description#>
 *  @param fileName   f在ios中应该是/Documents目录或子目录下的文件
 */
+(void) writeDictionary:(NSDictionary*) dictionary toFile:(NSString*)  fileName;

/**
 *  read file
 *
 *  @param fileName <#fileName description#>
 *
 *  @return <#return value description#>
 */
+(NSDictionary*) readDictionaryFromFile:(NSString*) fileName;


#pragma mark -sqlite3



+(sqlite3*) openSqlite:(NSString*) filePath;




















@end
