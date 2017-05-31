//
//  WKNavigationController.m
//  WKKit
//
//  Created by 王宇 on 16/9/14.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKNavigationController.h"

@interface WKNavigationController ()

@end

@implementation WKNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // 使导航条有效
    [self setNavigationBarHidden:NO];
    
    // 隐藏导航条，但由于导航条有效，系统的返回按钮页有效，所以可以使用系统的右滑返回手势。
//    [self.navigationBar setHidden:YES];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 是否可右滑返回
- (void)navigationCanDragBack:(BOOL)canDragBack
{
    self.interactivePopGestureRecognizer.enabled = canDragBack;
}

@end
