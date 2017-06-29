//
//  UIScrollView+UITableViewCellDisplayAnimation.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/27.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "UIScrollView+UITableViewCellDisplayAnimation.h"
#import <objc/runtime.h>

static const void *ScrollAmount = &ScrollAmount;
static const void *PreviousScrollOffset = &PreviousScrollOffset;
@implementation UIScrollView (UITableViewCellDisplayAnimation)

- (void)setScrollAmount:(CGFloat)scrollAmount{
    NSNumber *number = [[NSNumber alloc]initWithFloat:scrollAmount];
    objc_setAssociatedObject(self, ScrollAmount, number, OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)scrollAmount{
    return [objc_getAssociatedObject(self, ScrollAmount) floatValue];
}


- (void)setPreviousScrollOffset:(CGFloat)previousScrollOffset{
    NSNumber *number = [[NSNumber alloc]initWithFloat:previousScrollOffset];
    objc_setAssociatedObject(self, PreviousScrollOffset, number, OBJC_ASSOCIATION_RETAIN);
}

- (CGFloat)previousScrollOffset{
    return [objc_getAssociatedObject(self, PreviousScrollOffset) floatValue];
}

- (void)offsetWithScrollView{
    if ([self isKindOfClass:[UITableView class]]) {
        UITableView *tableView = (UITableView*)self;
        CGFloat offset = tableView.contentOffset.y;
        self.scrollAmount = offset - self.previousScrollOffset;
        self.previousScrollOffset = offset;
    }
}

@end
