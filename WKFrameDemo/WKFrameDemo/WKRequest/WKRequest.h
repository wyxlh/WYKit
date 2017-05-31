//
//  WKRequest.h
//  WKKit
//
//  Created by 王宇 on 16/9/14.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WKBaseModel.h"
typedef void (^SuccessBlock)(WKBaseModel *baseModel);
typedef void (^FailureBlock)(NSError *errer);

@interface WKRequest : NSObject

@property (nonatomic,copy)SuccessBlock successBlock;
@property (nonatomic,copy)FailureBlock failureBlock;

/**
 *   get 网络请求
 *
 *  @param UrlString    请求的网址字符串
 *  @param parameters   请求的参数
 *  @param successBlock 请求成功回调
 *  @param failureBlock 请求失败回调
 */
+(void)getWithURLString:(NSString *)urlString
             parameters:(id)parameters
                success:(SuccessBlock)successBlock
                failure:(FailureBlock)failureBlock;


/**
 *  post网络请求
 *
 *  @param UrlString    请求的网址字符串
 *  @param parameters   请求的参数
 *  @param successBlock 请求成功回调
 *  @param failureBlock 请求失败回调
 */
+(void)postWithURLString:(NSString *)urlString
              parameters:(id)parameters
                 success:(SuccessBlock)successBlock
                 failure:(FailureBlock)failureBlock;

@end
