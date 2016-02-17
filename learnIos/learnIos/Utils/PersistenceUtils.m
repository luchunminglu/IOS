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


#pragma mark -File&Directory

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

/**
 *  文件或目录是否存在
 *
 *  @param filePath <#filePath description#>
 *
 *  @return <#return value description#>
 */
+(BOOL) fileExist:(NSString*) filePath{
    NSFileManager* fileManager = [NSFileManager defaultManager];
    return [fileManager fileExistsAtPath:filePath];
}


#pragma mark -Property list


/**
 *  write array to file，如果文件存在内容被覆盖。,文件编码utf8
 *
 *  @param array    <#array description#>
 *  @param fileName 在ios中应该是/Documents目录或子目录下的文件
 */
+(void) writeArray:(NSArray*) array toFile:(NSString*) fileName{
    //If YES, the array is written to an auxiliary file, and then the auxiliary file is renamed to path.
    [array writeToFile:fileName atomically:YES];
}

/**
 *  read file
 *
 *  @param fileName <#fileName description#>
 *
 *  @return <#return value description#>
 */
+(NSArray*) readArrayFromFile:(NSString*) fileName{
    return [NSArray arrayWithContentsOfFile:fileName];
}

/**
 *  将Dictionary写到文件中，如果文件存在，内容被覆盖,文件编码utf8
 *
 *  @param dictionary <#dictionary description#>
 *  @param fileName   f在ios中应该是/Documents目录或子目录下的文件
 */
+(void) writeDictionary:(NSDictionary*) dictionary toFile:(NSString*)  fileName{
    [dictionary writeToFile:fileName atomically:YES];
}

/**
 *  read file
 *
 *  @param fileName <#fileName description#>
 *
 *  @return <#return value description#>
 */
+(NSDictionary*) readDictionaryFromFile:(NSString*) fileName{
    return [NSDictionary dictionaryWithContentsOfFile:fileName];
}


#pragma mark -archive

//archive需要补充





#pragma mark -sqlite3


/**
 *  执行sql
 *
 *  @param sql <#sql description#>
 */
+(void) executeNoQuery:(NSString*) sql{
    
}


+(void) sqlProcess:(void(^)(void)) action{
    sqlite3* database;
    [[self getSqlDb] UTF8String];
}

/**
 *  <#Description#>
 *
 *
 *  @return <#return value description#>
 */
+(NSString*) getSqlDb{
    NSString* docPath = [self getDirectoryOfDocuments];
    
    return [docPath stringByAppendingPathComponent:@"cmlu.db"];
}







































































































































































































































































































































































































































































@end
