//
//  WKHomeFourChooseTableViewCell.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/8.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKHomeFourChooseTableViewCell.h"
#import "ZXCenterBtn.h"
@implementation WKHomeFourChooseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    for (int i=0; i<4; i++) {
        ZXCenterBtn *btn=[[[NSBundle mainBundle] loadNibNamed:@"ZXCenterBtn" owner:nil options:nil] lastObject];
        btn.tag=i+1;
        btn.imgview.image=[UIImage imageNamed:[NSString stringWithFormat:@"homemenu%d",i+1]];
        btn.frame=CGRectMake(i*ScreenWidth/4, 0, ScreenWidth/4, 70);
        btn.autoresizingMask = 0;
        if (i<3) {
            btn.countLbl.hidden=NO;
            [self getOrderCount:i];
        }
        [self addSubview:btn];
    }
}

-(void)getOrderCount:(NSInteger)index{
    
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
