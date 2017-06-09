//
//  WKCategoryModel.h
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/9.
//  Copyright © 2017年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKCategoryModel : NSObject
@property (nonatomic, strong) NSArray *category;
@end

@interface categoryModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) BOOL   isActivity;
@property (nonatomic, strong) NSArray *subCategory;
@end

@interface subCategoryModel : NSObject
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, assign) BOOL   isActivity;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, copy) NSString *parentCid;
@end
