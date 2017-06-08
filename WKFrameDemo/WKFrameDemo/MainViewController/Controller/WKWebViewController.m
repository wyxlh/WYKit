//
//  WKWebViewController.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/8.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKWebViewController.h"

@interface WKWebViewController ()<WKUIDelegate,WKNavigationDelegate>

@end

@implementation WKWebViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = self.navTitle;
    [self.mainWeb loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:self.urlString]]];
}
// 页面开始加载时调用
- (void)webView:(WKWebView *)webView didStartProvisionalNavigation:(WKNavigation *)navigation
{
    dispatch_barrier_async(dispatch_get_main_queue(), ^(void){
        //        [self startLoading];
    });
}
// 当内容开始返回时调用
- (void)webView:(WKWebView *)webView didCommitNavigation:(WKNavigation *)navigation
{
    
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation
{
    //    [self stopLoaing];
}
// 页面加载失败时调用
- (void)webView:(WKWebView *)webView didFailProvisionalNavigation:(WKNavigation *)navigation
{
    //    [self stopLoaing];
    
}

-(void)backItemTouched:(id)sender{
    if ([self.mainWeb canGoBack]) {
        [self.mainWeb goBack];
    }else{
        [self.navigationController popViewControllerAnimated:YES];
    }
}

- (WKWebView *)mainWeb
{
    if (!_mainWeb) {
        _mainWeb = [[WKWebView alloc]initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight - NavHeight)];
        _mainWeb.navigationDelegate = self;
        _mainWeb.UIDelegate = self;
        [self.view addSubview:_mainWeb];
    }
    return _mainWeb;
}


@end
