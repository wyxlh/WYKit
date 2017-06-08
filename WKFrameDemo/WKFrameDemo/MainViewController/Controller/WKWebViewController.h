//
//  WKWebViewController.h
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/8.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKBaseViewController.h"
#import <WebKit/WebKit.h>
@interface WKWebViewController : WKBaseViewController
@property (nonatomic, copy)NSString      *urlString;
@property (nonatomic, strong)WKWebView   *mainWeb;
@property (nonatomic, copy) NSString     *navTitle;
@end
