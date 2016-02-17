//
//  PersistenceUtils.h
//  learnIos
//
//  Created by chunminglu on 16/2/16.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <sqlite3.h>
#import <CoreData/CoreData.h>


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


#pragma mark -archive

//archive需要补充




#pragma mark -sqlite3


/*
 sqlite3提供了C/C++接口
 Cora Data是apple提供的ORM框架
 sqlite3创建的数据库默认是UTF-8编码的
 
 */

/**
 *  执行sql  用于插入、删除、修改
 *
 *  @param sql <#sql description#>
 */
+(void) executeNoQuery:(NSString*) sql;

/**
 *  执行sql  用于插入、删除、修改 对于有?号占位符的sql语句
 *
 *  @param sql <#sql description#>
 */
+(void) executeNoQuery2:(NSString*) sql;

/**
 *  执行查询sql
 *
 *  @param sql <#sql description#>
 */
+(void) executeQuery:(NSString*) sql;


#pragma mark -CoreData


/**
 *  <#Description#>
 */
+(void) execute;






































































































































































@end
