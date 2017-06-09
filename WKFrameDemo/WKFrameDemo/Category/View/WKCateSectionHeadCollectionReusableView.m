//
//  WKCateSectionHeadCollectionReusableView.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/9.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKCateSectionHeadCollectionReusableView.h"

@implementation WKCateSectionHeadCollectionReusableView

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(void)setModel:(categoryModel *)model{
    self.leftLbl.backgroundColor = model.isActivity ? UIColorFromRGB(0xB00332) : APPDarkBlueBgColor;
    self.title.textColor         = model.isActivity ? UIColorFromRGB(0xB00332) : APPDarkBlueBgColor;
    self.lookBtn.hidden          = model.isActivity ? YES : NO;
    self.title.text              = model.name;
}

@end
