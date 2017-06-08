
//
//  WKHomeViewController.m
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//
#import "WKHomeViewController.h"
#import "WKHomeModel.h"
@interface WKHomeViewController ()
@property (nonatomic, strong) WKHomeModel *model;

@end

@implementation WKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"首页";
    [self netRequest];
   
}

-(void)netRequest{
    NSString *homeUrl = @"/home/index";
    WS(weakSelf)
    [WKRequest getWithURLString:homeUrl parameters:nil success:^(WKBaseModel *baseModel) {
        if (ZERO) {
            weakSelf.model=[WKHomeModel mj_objectWithKeyValues:baseModel.mDictionary];
            NSString *str=[[weakSelf.model.topicList[0] layoutList] layoutHeight];
            DLog(@"%@",str);
        }
        
    } failure:^(NSError *errer) {
        
    }];
    
    
    
}



@end
