//
//  WKCategoryModel.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/9.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKCategoryModel.h"

@implementation WKCategoryModel

+(NSDictionary *)mj_objectClassInArray{
    return @{@"category":@"categoryModel"};
}

@end

@implementation categoryModel

+(NSDictionary *)mj_objectClassInArray{
    return @{@"subCategory":@"subCategoryModel"};
}

@end

@implementation subCategoryModel


@end
