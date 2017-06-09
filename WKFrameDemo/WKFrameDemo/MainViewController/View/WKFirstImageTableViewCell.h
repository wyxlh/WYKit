//
//  WKFirstImageTableViewCell.h
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/9.
//  Copyright © 2017年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKHomeModel.h"
@interface WKFirstImageTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (nonatomic, strong)  topicListModel *model;

@end
