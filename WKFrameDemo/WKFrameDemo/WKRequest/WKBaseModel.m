//
//  WKBaseModel.m
//  WKKit
//
//  Created by 王宇 on 16/9/14.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKBaseModel.h"

@implementation WKBaseModel
@synthesize mDictionary;

- (id)initWithJsonObject:(id)aJson
{
    self = [super init];
    
    if ( self ) {
        if ( aJson && [aJson isKindOfClass:[NSDictionary class]] ) {
            self.mDictionary = [NSMutableDictionary dictionaryWithDictionary:aJson];
        }
    }
    
    return self;
}

- (NSString *)result
{
    return [NSString strOrEmpty:[mDictionary objectForKey:@"result"]];
}

- (NSString *)message
{
    return [NSString strOrEmpty:[mDictionary objectForKey:@"message"]];
}
@end
