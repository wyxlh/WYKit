//
//  WKBaseModel.h
//  WKKit
//
//  Created by 王宇 on 16/9/14.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKBaseModel : NSObject

@property (nonatomic, strong) NSMutableDictionary     *mDictionary;
@property (strong, nonatomic) NSString                *result;
@property (strong, nonatomic) NSString                *message;

/**
 *  用JSON对象初始化
 *
 *  @param aJson 服务器返回的JSON格式数据
 *
 *  @return YekBaseData
 */
-(id)initWithJsonObject:(id)aJson;
@end
