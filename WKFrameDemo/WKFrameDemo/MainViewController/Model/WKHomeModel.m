//
//  WKHomeModel.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/5/31.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKHomeModel.h"

@implementation WKHomeModel

+(NSDictionary *)mj_objectClassInArray{
    return @{@"promotionList":@"promotionListModel",@"topicList":@"topicListModel"};
}

@end

@implementation promotionListModel


@end

@implementation layoutListModel

+(NSDictionary *)mj_objectClassInArray{
    return @{@"layoutAdList":@"layoutAdListModel"};
}

@end

@implementation topicListModel

+(NSDictionary *)mj_replacedKeyFromPropertyName{
    return @{@"Id":@"id"};
}

+(NSDictionary *)mj_objectClassInArray{
    return @{@"layoutList":@"layoutListModel"};
}

@end



@implementation layoutAdListModel


@end
