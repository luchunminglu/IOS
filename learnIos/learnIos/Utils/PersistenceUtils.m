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
 *  执行sql 用于插入、删除、修改  sql语句中可以用?来作为占位符
 *
 *  @param sql <#sql description#>
 */
+(void) executeNoQuery:(NSString*) sql{
    [self commonSqlProcess:^(sqlite3* database){
        int result = sqlite3_exec(database, [sql UTF8String], NULL, NULL, NULL);
        if (result == SQLITE_OK) {
            //执行成功
        }
    }];
}

/**
 *  执行sql  用于插入、删除、修改 对于有?号占位符的sql语句
 *
 *  @param sql <#sql description#>
 */
+(void) executeNoQuery2:(NSString*) sql{
    [self commonSqlProcess:^(sqlite3* database){
        sqlite3_stmt* statement;
        //第三个参数，当为负时，表示sql字符串的长度直到\0结束的位置
        int result = sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, nil);
        
        if (result == SQLITE_OK) {
            //在此位置准备占位符
            //第二个参数：要设置的占位符索引，从1开始计数，
            //第三个参数：替换的值
            sqlite3_bind_int(statement, 1, 235);
            sqlite3_bind_text(statement, 2, [sql UTF8String], -1, NULL);
        }
        
        //#define SQLITE_DONE        101  /* sqlite3_step() has finished executing */
        if(sqlite3_step(statement) == SQLITE_DONE)
        {
            //执行成功
        }
        
        sqlite3_finalize(statement);
        
    }];
}

/**
 *  执行查询sql， sql语句中可以用?来作为占位符
 *
 *  @param sql <#sql description#>
 */
+(void) executeQuery:(NSString*) sql{
    //NSString* query = @"SELECT Id,Name,Age FROM TABLENAME";
    
    [self commonSqlProcess:^(sqlite3* database){
        sqlite3_stmt* statement;
        //第三个参数，当为负时，表示sql字符串的长度直到\0结束的位置
        int result = sqlite3_prepare_v2(database, [sql UTF8String], -1, &statement, nil);
        
        if(result != SQLITE_OK){
            //Destroy A Prepared Statement Object
            sqlite3_finalize(statement);//statement为NULL是无害的
            return;
        }
        
        //在此位置准备占位符
        //第二个参数：要设置的占位符索引，从1开始计数，
        //第三个参数：替换的值
        sqlite3_bind_int(statement, 1, 235);
        sqlite3_bind_text(statement, 2, [sql UTF8String], -1, NULL);
        
        
//#define SQLITE_ROW         100  /* sqlite3_step() has another row ready */
//#define SQLITE_DONE        101  /* sqlite3_step() has finished executing */
        //step计算sql语句
        while (sqlite3_step(statement) == SQLITE_ROW) {
            //has another row ready
            //int rowNum = sqlite3_column_int(statement, 0);
            //NSString* name = [[NSString alloc] initWithUTF8String:(char *)sqlite3_column_text(statement, 1)];
        }
        
        //Destroy A Prepared Statement Object
        sqlite3_finalize(statement);
        
    }];
    
    
    
}



/**
 *  初始化数据库
 */
+(void) initDb{
    [self commonSqlProcess:^(sqlite3* database){
        //IF NOT EXISTS才创建表，所以这是可以重复执行的
        NSString* createSql = @"CREATE TABLE IF NOT EXISTS TABLENAME(Id INTEGER PRIMARY KEY AUTOINCREMENT, Name TEXT NOT NULL, Age INTEGER)";
        int result = sqlite3_exec(database, [createSql UTF8String], NULL, NULL, NULL);
        if (result == SQLITE_OK) {
            //执行成功
        }
    }];
}


/**
 *  处理sql，
 *
 *  @param action 实际处理的代码，不需要关心数据库的打开关闭，而专注于业务
 */
+(void) commonSqlProcess:(void(^)(sqlite3*)) action{
    sqlite3* database;
    const char* dbPath = [[self getSqlDb] UTF8String];
    //如果数据库存在，打开数据库，如果数据库不存在，新建一个
    int openResult = sqlite3_open(dbPath, &database);
    
    if (openResult != SQLITE_OK) {
        //打开连接失败  关闭连接，注：sqlite3_close可以接收NULL
        sqlite3_close(database);
        return;
    }
    @try{
        if (action) {
            //实际的处理
            action(database);
        }
    }
    @finally{
        sqlite3_close(database);
    }
}

/**
 *  获取sql执行使用的DB文件目录
 *
 *
 *  @return <#return value description#>
 */
+(NSString*) getSqlDb{
    NSString* docPath = [self getDirectoryOfDocuments];
    //[string UTF8String]   [NSString stringWithUTF8String:dbPath]; [[NSString alloc] initWithUTF8String:dbPath]来在NSString和const char*之间进行转换
    return [docPath stringByAppendingPathComponent:@"cmlu.db"];
}


#pragma mark -CoreData

/**
 *  <#Description#>
 */
+(void) execute{
    //[NSEntityDescription insertNewObjectForEntityForName:<#(nonnull NSString *)#> inManagedObjectContext:<#(nonnull NSManagedObjectContext *)#>]
}


































































































































































































































































































































































































































































@end
