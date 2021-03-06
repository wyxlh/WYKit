//NewsView.h
//
//  NewsView.h
//  Created by maxin on 16/3/22.
//  Copyright © 2016年 maxin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsView : UIView
@property (retain, nonatomic) UILabel *titleLabel;
@property (retain, nonatomic) UIButton *newsButton;
@property (strong,nonatomic) NSMutableArray *dataArray;
@property (strong ,nonatomic) NSTimer *timer;
@property (nonatomic, strong) NSArray *array;
@property (nonatomic,copy)void (^ClickBlick)(NSInteger tag);
@end
