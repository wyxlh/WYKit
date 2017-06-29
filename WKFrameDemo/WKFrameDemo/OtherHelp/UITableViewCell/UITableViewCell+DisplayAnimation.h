//
//  UITableViewCell+DisplayAnimation.h
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/27.
//  Copyright © 2017年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIScrollView+UITableViewCellDisplayAnimation.h"
@interface UITableViewCell (DisplayAnimation)<CAAnimationDelegate>


/**
 *  延迟出现动画
 *
 */
- (void)startCellDelayDisplayAnimationWithTableView:(UITableView *)tableView;

/**
 *  放大动画
 */
- (void)startCellScaleAnimation;

@end
