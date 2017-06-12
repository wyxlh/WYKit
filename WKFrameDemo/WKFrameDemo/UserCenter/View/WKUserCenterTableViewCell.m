//
//  WKUserCenterTableViewCell.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/12.
//  Copyright © 2017年 wy. All rights reserved.
//
#define kLoginTopImgArray  @[ \
@"geren_img_dingdan.png", \
@"geren_img_youhui", \
@"geren_img_love.png", \
@"geren_img_Purse.png", \
@"geren_img_dizhi.png", \
@"morephoto",\
@"onlineservice_img_usercenter",\
@"geren_img_pinglun.png", \
@"geren_img_huizhang.png",\
@"geren_img_fapiao.png", \
@"geren_img_Chima.png"]

#import "WKUserCenterTableViewCell.h"
#import "ZXCenterBtn.h"
@implementation WKUserCenterTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    for (int i=0; i<kLoginTopImgArray.count; i++) {
        ZXCenterBtn *btn=[[[NSBundle mainBundle] loadNibNamed:@"ZXCenterBtn" owner:nil options:nil] lastObject];
        btn.tag=i+1;
        btn.imgview.image=[UIImage imageNamed:kLoginTopImgArray[i]];
        btn.frame=CGRectMake(i%4*ScreenWidth/4, i/4*70, ScreenWidth/4, 70);
        btn.autoresizingMask = 0;
        btn.backgroundColor = [UIColor whiteColor];
        btn.countLbl.hidden=NO;
        [self addSubview:btn];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    
}

@end
