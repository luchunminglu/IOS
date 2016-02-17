//
//  HttpUtils.h
//  learnIos
//
//  Created by chunminglu on 16/2/17.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpUtils : NSObject


/**
 *  post请求 返回结果为json格式
 *
 *  @param segment  指定除主网站地址以外的其它部分 如 form/1
 *  @param formData formData 如果没有，传nil
 *  @param success     success回调
 *  @param failure     failure回调
 */
+(void) post:(NSString*) segment params:(NSDictionary*) formData success:(void (^) (id)) success failure:(void (^) (NSError*)) failure ;

/**
 *  get 请求 返回结果为json格式
 *
 *  @param segment     指定除主网站地址以外的其它部分 如 form/1
 *  @param requestData request数据，如果没有传nil
 *  @param success     success回调
 *  @param failure     failure回调
 */
+(void) get:(NSString*) segment params:(NSDictionary*) requestData success:(void (^) (id)) success failure:(void (^) (NSError*)) failure ;


/**
 *  post请求 返回结果为string格式
 *
 *  @param segment  指定除主网站地址以外的其它部分 如 form/1
 *  @param formData formData 如果没有，传nil
 *  @param success     success回调
 *  @param failure     failure回调
 */
+(void) postString:(NSString*) segment params:(NSDictionary*) formData success:(void (^) (id)) success failure:(void (^) (NSError*)) failure ;

/**
 *  get 请求 返回结果为string格式
 *
 *  @param segment     指定除主网站地址以外的其它部分 如 form/1
 *  @param requestData request数据，如果没有传nil
 *  @param success     success回调
 *  @param failure     failure回调
 */
+(void) getString:(NSString*) segment params:(NSDictionary*) requestData success:(void (^) (id)) success failure:(void (^) (NSError*)) failure ;



@end
