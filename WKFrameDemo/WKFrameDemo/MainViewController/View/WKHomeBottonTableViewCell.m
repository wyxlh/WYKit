//
//  WKHomeBottonTableViewCell.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/9.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKHomeBottonTableViewCell.h"

@implementation WKHomeBottonTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    self.selectionStyle = 0;
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)setModel:(topicListModel *)model{
    [self.leftImg sd_setImageWithURL:[NSURL URLWithString:[[[model.layoutList layoutAdList] safeObjectAtIndex:0] topicUrl]] placeholderImage:[UIImage imageNamed:@"fang"]];
    [self.rightImg sd_setImageWithURL:[NSURL URLWithString:[[[model.layoutList layoutAdList] safeObjectAtIndex:1] topicUrl]] placeholderImage:[UIImage imageNamed:@"fang"]];
}

@end
