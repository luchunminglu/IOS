//
//  HttpUtils.m
//  learnIos
//
//  Created by chunminglu on 16/2/17.
//  Copyright © 2016年 chunminglu. All rights reserved.
//

#import "HttpUtils.h"
#import <AFNetworking.h>
#import "StringUtils.h"

/**
 *  定义基地址
 *  以后修改URI只需修改一处
 */
static NSString* baseUri = @"https://192.168.163.228";

/**
 *  请求响应超时时间间隔 以秒为单位  NSTimeInterval = double
 */
static NSTimeInterval timeInterval = 15;


@implementation HttpUtils


#pragma mark -interface接口实现

/**
 *  post请求
 *
 *  @param segment  指定除主网站地址以外的其它部分 如 form/1
 *  @param formData formData 如果没有，传nil
 *  @param success     success回调
 *  @param failure     failure回调
 */
+(void) post:(NSString*) segment params:(NSDictionary*) formData success:(void (^) (id)) success failure:(void (^) (NSError*)) failure  {
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    //使用
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //请求超时时间
    [manager.requestSerializer setTimeoutInterval: timeInterval];
    
    //设置请求编码格式
    [manager.requestSerializer setStringEncoding:NSUTF8StringEncoding];
    
    //设置响应编码格式
    [manager.responseSerializer setStringEncoding:NSUTF8StringEncoding];
    
    //加上 https ssl验证
    [manager setSecurityPolicy:[self customSecurityPolicy]];
    
    
    //构建url
    NSURL* url = [NSURL URLWithString:baseUri];
    
    if (![StringUtils isNullOrWhiteSpace:segment]) {
        url = [NSURL URLWithString:segment relativeToURL: [NSURL URLWithString:baseUri]];
    }
    
    
    NSLog(@"Post调用地址 %@",[url absoluteString]);
    
    //注：该方法是异步调用的
    [manager POST:[url absoluteString] parameters:formData progress:nil success:^(NSURLSessionTask* task, id responseObject){
        NSLog(@"success ----  %@",responseObject);
        if(success){
            //回调success
            success(responseObject);
        }
    }failure:^(NSURLSessionTask* operation, NSError* error){
        NSLog(@"falied ---- %@",error);
        if(failure){
            failure(error);
        }
    }];
    
}


/**
 *  get 请求
 *
 *  @param segment     指定除主网站地址以外的其它部分 如 form/1
 *  @param requestData request数据，如果没有传nil
 *  @param success     success回调
 *  @param failure     failure回调
 */
+(void) get:(NSString*) segment params:(NSDictionary*) requestData success:(void (^) (id)) success failure:(void (^) (NSError*)) failure {
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    //请求超时时间
    [manager.requestSerializer setTimeoutInterval: timeInterval];
    
    //设置请求编码格式
    [manager.requestSerializer setStringEncoding:NSUTF8StringEncoding];
    
    //设置响应编码格式
    [manager.responseSerializer setStringEncoding:NSUTF8StringEncoding];
    
    //加上 https ssl验证
    [manager setSecurityPolicy:[self customSecurityPolicy]];
    
    
    //构建url
    NSURL* url = [NSURL URLWithString:baseUri];
    
    if (![StringUtils isNullOrWhiteSpace:segment]) {
        url = [NSURL URLWithString:segment relativeToURL: [NSURL URLWithString:baseUri]];
    }
    
    
    NSLog(@"Get调用地址 %@",[url absoluteString]);
    
    //注：该方法是异步调用的
    [manager GET:[url absoluteString] parameters:requestData progress:nil success:^(NSURLSessionTask* task, id responseObject){
        NSLog(@"success ----  %@",responseObject);
        if(success){
            //回调
            success(responseObject);
        }
    }failure:^(NSURLSessionTask* operation, NSError* error){
        NSLog(@"falied ---- %@",error);
        if(failure){
            //回调
            failure(error);
        }
    }];
    
}


/**
 *  post请求
 *
 *  @param segment  指定除主网站地址以外的其它部分 如 form/1
 *  @param formData formData 如果没有，传nil
 *  @param success     success回调
 *  @param failure     failure回调
 */
+(void) postString:(NSString*) segment params:(NSDictionary*) formData success:(void (^) (id)) success failure:(void (^) (NSError*)) failure  {
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    //使用
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //请求超时时间
    [manager.requestSerializer setTimeoutInterval: timeInterval];
    
    //设置请求编码格式
    [manager.requestSerializer setStringEncoding:NSUTF8StringEncoding];
    
    //设置响应编码格式
    [manager.responseSerializer setStringEncoding:NSUTF8StringEncoding];
    
    //加上 https ssl验证
    [manager setSecurityPolicy:[self customSecurityPolicy]];
    
    
    //构建url
    NSURL* url = [NSURL URLWithString:baseUri];
    
    if (![StringUtils isNullOrWhiteSpace:segment]) {
        url = [NSURL URLWithString:segment relativeToURL: [NSURL URLWithString:baseUri]];
    }
    
    
    NSLog(@"Post调用地址 %@",[url absoluteString]);
    
    //注：该方法是异步调用的
    [manager POST:[url absoluteString] parameters:formData progress:nil success:^(NSURLSessionTask* task, id responseObject){
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"success ----  %@",result);
        if(success){
            //回调
            success(result);
        }
    }failure:^(NSURLSessionTask* operation, NSError* error){
        NSLog(@"falied ---- %@",error);
        if(failure){
            failure(error);
        }
    }];
    
}


/**
 *  get 请求
 *
 *  @param segment     指定除主网站地址以外的其它部分 如 form/1
 *  @param requestData request数据，如果没有传nil
 *  @param success     success回调
 *  @param failure     failure回调
 */
+(void) getString:(NSString*) segment params:(NSDictionary*) requestData success:(void (^) (id)) success failure:(void (^) (NSError*)) failure {
    
    AFHTTPSessionManager* manager = [AFHTTPSessionManager manager];
    
    //manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    //请求超时时间
    [manager.requestSerializer setTimeoutInterval: timeInterval];
    
    //设置请求编码格式
    [manager.requestSerializer setStringEncoding:NSUTF8StringEncoding];
    
    //设置响应编码格式
    [manager.responseSerializer setStringEncoding:NSUTF8StringEncoding];
    
    //加上 https ssl验证
    [manager setSecurityPolicy:[self customSecurityPolicy]];
    
    
    //构建url
    NSURL* url = [NSURL URLWithString:baseUri];
    
    if (![StringUtils isNullOrWhiteSpace:segment]) {
        url = [NSURL URLWithString:segment relativeToURL: [NSURL URLWithString:baseUri]];
    }
    
    
    NSLog(@"Get调用地址 %@",[url absoluteString]);
    
    //注：该方法是异步调用的
    [manager GET:[url absoluteString] parameters:requestData progress:nil success:^(NSURLSessionTask* task, id responseObject){
        NSString *result = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"success ----  %@",result);
        if(success){
            //回调
            success(result);
        }
    }failure:^(NSURLSessionTask* operation, NSError* error){
        NSLog(@"falied ---- %@",error);
        if(failure){
            //回调
            failure(error);
        }
    }];
    
}




#pragma mark -辅助私有方法

/**
 *  定制安全策略
 *
 *  @return
 */
+ (AFSecurityPolicy*) customSecurityPolicy{
    
    //导入证书taocares.cer
    NSString* cerPath = [[NSBundle mainBundle] pathForResource:@"taocares" ofType:@"cer"];
    //读入byte buffer
    NSData* cerData = [NSData dataWithContentsOfFile:cerPath];
    
    //使用证书验证模式
    AFSecurityPolicy* securityPolicy  = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
    
    //允许无效证书（也就是自建证书）
    securityPolicy.allowInvalidCertificates = YES;
    
    //不验证域名
    securityPolicy.validatesDomainName = NO;
    
    //证书
    securityPolicy.pinnedCertificates = [NSSet setWithObjects:cerData, nil];
    
    return securityPolicy;
}


@end
