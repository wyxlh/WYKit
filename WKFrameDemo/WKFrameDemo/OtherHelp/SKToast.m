//
//  SKToast.m
//  SKKit
//
//  Created by maxin on 15/11/28.
//  Copyright (c) 2015年 maxin. All rights reserved.
//

#import "SKToast.h"
#import <objc/runtime.h>
@implementation SKToast

+ (void)showMessage:(NSString *)msg{

    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    [SKToast showMessage:msg inView:window.rootViewController.view duration:2.0f];
}

+ (void)showMessage:(NSString *)msg inView:(UIView *)view
{
    [SKToast showMessage:msg inView:view duration:2.0f];
}

+ (void)showMessage:(NSString *)msg inView:(UIView *)view duration:(NSTimeInterval)duration
{
    if(view && msg && duration > 0)
    {
        UILabel *lb = (UILabel *)objc_getAssociatedObject(view, @"Message");
        UIImageView *imgView = nil;
        if(!lb)
        {
            lb = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 260.0f, 2000.0f)];
            lb.backgroundColor = MSGreenColor;
            lb.textColor = [UIColor whiteColor];
            lb.textAlignment = NSTextAlignmentCenter;
            lb.font = [UIFont systemFontOfSize:14];
            lb.numberOfLines = 0;
            lb.layer.masksToBounds = YES;
            lb.layer.cornerRadius = 5.0f;
            lb.layer.shouldRasterize = YES;
            
            [view addSubview:lb];
            objc_setAssociatedObject(view, @"Message", lb, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            imgView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"img_moshi"]];
            imgView.bounds = CGRectMake(0, 0, 60, 60);
            [view addSubview:imgView];
            __block UILabel *blockLabel = lb;
            double delayInSeconds = duration;
            dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
            dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
                [blockLabel removeFromSuperview];
                [imgView removeFromSuperview];
                objc_setAssociatedObject(view, @"Message", nil, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
            });
        }
        
        [view bringSubviewToFront:lb];
        [view bringSubviewToFront:imgView];
        CGSize vwSize = view.bounds.size;
        CGSize lbSize =  [msg boundingRectWithSize:CGSizeMake(ScreenWidth, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]} context:nil].size;
        lbSize.width = MIN(260.0f, MAX(60.0f, lbSize.width + 20.0f));
        lbSize.height = MIN(120.0f, MAX(30.0f, lbSize.height + 40.0f));
        lb.frame = CGRectMake(0, 0, lbSize.width, lbSize.height);
        lb.center = CGPointMake(vwSize.width / 2.0f, vwSize.height- ScreenHeight * 0.5);
        lb.text = msg;
        imgView.center = CGPointMake(lb.centerX, lb.y-20);
    }
}

@end
