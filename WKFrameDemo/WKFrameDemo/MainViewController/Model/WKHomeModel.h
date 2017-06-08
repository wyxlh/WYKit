//
//  WKHomeModel.h
//  WKFrameDemo
//
//  Created by 王宇 on 2017/5/31.
//  Copyright © 2017年 wy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WKHomeModel : NSObject
@property (nonatomic, strong) NSArray *promotionList;
@property (nonatomic, strong) NSArray *topicList;
@end

@interface promotionListModel : NSObject
@property (nonatomic, copy) NSString *pageurl;
@property (nonatomic, copy) NSString *proId;
@property (nonatomic, copy) NSString *proUrl;
@property (nonatomic, copy) NSString *promotionType;
@property (nonatomic, copy) NSString *shareContent;
@property (nonatomic, copy) NSString *shareImageUrl;
@property (nonatomic, copy) NSString *shareUrl;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *usepage;
@end

@interface layoutListModel : NSObject
@property (nonatomic, copy) NSString *layoutHeight;
@property (nonatomic, strong) NSArray *layoutAdList;
@end


@interface topicListModel : NSObject
@property (nonatomic, copy) NSString *Id;
@property (nonatomic, strong) layoutListModel *layoutList;
@property (nonatomic, copy) NSString *layoutType;
@property (nonatomic, copy) NSString *name;
@end

@interface layoutAdListModel : NSObject
@property (nonatomic, copy) NSString *adFrame;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, copy) NSString *pageurl;
@property (nonatomic, copy) NSString *shareContent;
@property (nonatomic, copy) NSString *shareImageUrl;
@property (nonatomic, copy) NSString *shareUrl;
@property (nonatomic, copy) NSString *topicId;
@property (nonatomic, copy) NSString *topicName;
@property (nonatomic, copy) NSString *topicUrl;
@property (nonatomic, copy) NSString *type;
@property (nonatomic, copy) NSString *usepage;
@end
