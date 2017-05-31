
//
//  WKHomeViewController.m
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//
#import "WKHomeViewController.h"

@interface WKHomeViewController ()

@end

@implementation WKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"首页";
    [self netRequest];
   
}

-(void)netRequest{
    NSString *homeUrl = @"/home/index";
    [WKRequest getWithURLString:homeUrl parameters:nil success:^(WKBaseModel *baseModel) {
        
    } failure:^(NSError *errer) {
        
    }];
    
}



@end
