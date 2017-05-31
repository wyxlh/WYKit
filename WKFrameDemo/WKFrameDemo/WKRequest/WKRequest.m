//
//  WKRequest.m
//  WKKit
//
//  Created by 王宇 on 16/9/14.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKRequest.h"
//设置网络请求超时
#define TIMEOUT 10
@implementation WKRequest


/**
 *  get 网络请求
 *
 *  @param urlString    请求的网址字符串
 *  @param parameters   请求的参数
 *  @param successBlock 请求成功回调
 *  @param failureBlock 请求失败回调
 */
+(void)getWithURLString:(NSString *)urlString
             parameters:(id)parameters
                success:(SuccessBlock)successBlock
                failure:(FailureBlock)failureBlock{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    /**
     *  可以接受的类型
     */
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    /**
     *  请求队列的最大并发数
     */
    //    manager.operationQueue.maxConcurrentOperationCount = 5;
    /**
     *  请求超时的时间
     */
    manager.requestSerializer.timeoutInterval = TIMEOUT;
    NSString *hostUrl=[NSString stringWithFormat:@"%@%@",TOMMY_REQUEST_URL,urlString];
     DLog(@"%@",hostUrl);
    [manager GET:hostUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            WKBaseModel *baseModel=[[WKBaseModel alloc]initWithJsonObject:dic];
            successBlock(baseModel);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
            DLog(@"网络异常 - T_T%@", error);
        }
    }];
}

/**
 *  post网络请求
 *
 *  @param urlString    请求的网址字符串
 *  @param parameters   请求的参数
 *  @param successBlock 请求成功回调
 *  @param failureBlock 请求失败回调
 */
+(void)postWithURLString:(NSString *)urlString
              parameters:(id)parameters
                 success:(SuccessBlock)successBlock
                 failure:(FailureBlock)failureBlock{
    
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer.timeoutInterval = TIMEOUT;
    NSString *hostUrl=[NSString stringWithFormat:@"%@%@",TOMMY_REQUEST_URL,urlString];
    DLog(@"%@",hostUrl);
    [manager POST:hostUrl parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (successBlock) {
            NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableLeaves error:nil];
            WKBaseModel *baseModel=[[WKBaseModel alloc]initWithJsonObject:dic];
            successBlock(baseModel);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        if (failureBlock) {
            failureBlock(error);
            DLog(@"网络异常 - T_T%@", error);
        }
    }];
    
}
@end
