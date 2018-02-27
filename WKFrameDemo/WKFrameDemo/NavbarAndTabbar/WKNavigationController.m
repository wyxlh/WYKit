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
    self.navigationBar.translucent = NO;
    self.navigationBar.barTintColor = APPPurplefontcolor;//设置导航栏背景颜色
    [self.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blackColor]}];// 设置字体颜色
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// 是否可右滑返回
//- (void)navigationCanDragBack:(BOOL)canDragBack
//{
//    self.interactivePopGestureRecognizer.enabled = canDragBack;
//}

@end
