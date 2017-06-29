//
//  WKFirstTableViewCell.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/29.
//  Copyright © 2017年 wy. All rights reserved.
//
#define CustomColor(R,G,B,A) [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#import "WKFirstTableViewCell.h"

@implementation WKFirstTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];

    int R = (arc4random() % 256) ;
    int G = (arc4random() % 256) ;
    int B = (arc4random() % 256) ;
    self.imgview.backgroundColor=CustomColor(R, G, B, 1);
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
