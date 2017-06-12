//
//  WKUserCenterHeadView.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/12.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKUserCenterHeadView.h"

@implementation WKUserCenterHeadView

-(void)awakeFromNib{
    [super awakeFromNib];
    _pictureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 180)];
    _pictureImageView.image = [UIImage imageNamed:@"myaccount_bg"];
    /*
     重要的属性设置
     */
    //这个属性的值决定了 当视图的几何形状变化时如何复用它的内容 这里用 UIViewContentModeScaleAspectFill 意思是保持内容高宽比 缩放内容 超出视图的部分内容会被裁减 填充UIView
    _pictureImageView.contentMode = UIViewContentModeScaleAspectFill;
    // 这个属性决定了子视图的显示范围 取值为YES时，剪裁超出父视图范围的子视图部分.这里就是裁剪了_pictureImageView超出_header范围的部分.
    _pictureImageView.clipsToBounds = YES;
    
    [self addSubview:_pictureImageView];
    [self sendSubviewToBack:_pictureImageView];
}

@end
