//
//  UIScrollView+UITableViewCellDisplayAnimation.h
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/27.
//  Copyright © 2017年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIScrollView (UITableViewCellDisplayAnimation)
@property (assign, nonatomic) CGFloat scrollAmount;
@property (assign, nonatomic) CGFloat previousScrollOffset;

/**
 *  获取当前Offset(当使用startCellDelayDisplayAnimationWithTableView动画时 需要在scrollViewDidScroll中加入该方法)
 *
 */
- (void)offsetWithScrollView;
@end
