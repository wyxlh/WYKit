//
//  WKNavigationView.m
//  WKKit
//
//  Created by 王宇 on 16/9/14.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKNavigationView.h"

@implementation WKNavigationView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        _titlelable = [[UILabel alloc] init];
        _line  = [[UILabel alloc] init];
        _line.backgroundColor = [UIColor blackColor];
        _line.alpha = 0.1;
        _titlelable.backgroundColor = [UIColor clearColor];
        _titlelable.numberOfLines = 1;
        _titlelable.textColor = [UIColor whiteColor];
        _titlelable.textAlignment = NSTextAlignmentCenter;
        [_titlelable setFont:[UIFont fontWithName:@"CourierNewPSMT" size:17.0]];
        _titlelable.frame = CGRectMake(0, 20, ScreenWidth, NavHeight-20);
        _line.frame = CGRectMake(0, NavHeight-0.5, ScreenWidth, 0.5);
//        self.backgroundColor=[UIColor colorWithPatternImage:[UIImage imageNamed:@"navbar_img_bg"]];
        self.backgroundColor = APPPurplefontcolor;
        [self addSubview:_titlelable];
        [self addSubview:_line];
    }
    return self;
}

@end
