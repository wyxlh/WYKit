//
//  WKHomeThreeImgTableViewCell.h
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/9.
//  Copyright © 2017年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKHomeModel.h"
@interface WKHomeThreeImgTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftImg;
@property (weak, nonatomic) IBOutlet UIImageView *topImg;
@property (weak, nonatomic) IBOutlet UIImageView *bottonImg;
@property (nonatomic, strong)  topicListModel *model;
@end
