//
//  WKHelp.h
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//

#ifndef WKHelp_h
#define WKHelp_h

#pragma mark ----------------------------------尺寸---------------------------------------------

//获取设备的物理高度
#define ScreenHeight [UIScreen mainScreen].bounds.size.height
//获取设备的物理宽度
#define ScreenWidth  [UIScreen mainScreen].bounds.size.width
//导航栏高度
#define NavHeight 64.0f
// Tabbar 高度
#define TabbarHeight 49.0f

//自定义颜色 
#define CustomColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]

#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]

#define SKOrangeColor    [UIColor colorWithRed:250/255. green:50/255. blue:100/255. alpha:1]  // 橙色

#define APPPurplefontcolor      [UIColor colorWithRed:0.f/255 green:22.f/255 blue:75.f/255      alpha:1] // 蓝色

#define APPbluefontcolor        [UIColor colorWithRed:23.f/255 green:153.f/255 blue:90.f/255      alpha:1] // Tommy绿色

#define APPDarkBlueBgColor      [UIColor colorWithRed:0.f/255 green:22.f/255 blue:75.f/255      alpha:1] // Tommy蓝色

//Button 字体
#define BtnTextFont [UIFont systemFontOfSize:14]

#define ZERO  [baseModel.result integerValue] ==0

// 设置view的圆角和边框
#define SKViewsBorder(View,radius,width,color)\
\
[View.layer setCornerRadius:(radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(width)];\
[View.layer setBorderColor:[color CGColor]];

#pragma mark ---------------------------------LOG--------------------------------------------------
//打印Log
#ifdef DEBUG
#define DLog( s, ... )                          NSLog( @"<%@:(%d)> %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DLog( s, ... )
#endif

#define iOS_V(i) ([[[UIDevice currentDevice] systemVersion] floatValue] >= i)

#pragma mark ------------------------------Bolck Self--------------------------------------------------
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;

// 定义服务器地址
// 测试
//#define TOMMY_REQUEST_URL   @"http://114.80.62.242:88/tommycms/api/index.php/version2/"

// 正式
#define HOST_URL   @"http://www.tommyapp.com.cn/api/index.php/version2/"
#endif /* WKHelp_h */
