//
//  WKBaseViewController.h
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKNavigationController.h"
#import "WKTabbarController.h"
@interface WKBaseViewController : UIViewController

@property (nonatomic,strong)WKNavigationView *navbar;
@property (nonatomic,strong)WKTabbarController *tabbarVC;
@property (nonatomic,strong)UIImageView *backItem;
@property (nonatomic,strong)UIImageView *leftItem;
@property (nonatomic,strong)UIImageView *rightItem;
@property (nonatomic,strong)UIButton *leftbtn;
@property (nonatomic,strong)UIButton *rightbtn;

- (void)backItemTouched:(id)sender;
- (void)leftItemTouched:(id)sender;
- (void)rightItemTouched:(id)sender;
- (void)leftButtonClick:(id)sender;
- (void)rightButtonClick:(id)sender;

/**
 *  返回
 */
- (void)goBack;
/**
 *  返回
 */
- (void)addBackItem;
/**
 *  添加左侧按钮，传入图片名
 *
 *  @param rightItemImageName  传入图片名
 */
- (void)addleftItem:(NSString *)leftItemImageName;
/**
 *  添加右侧按钮，传入图片名
 *
 *  @param rightItemImageName  传入图片名
 */
- (void)addrightItem:(NSString *)rightItemImageName;

/**
 *  添加左侧按钮。传入一个Title
 *
 *  @param Title
 */
- (void)addleftButton:(NSString *)Title;
/**
 *  添加右侧按钮。传入一个Title
 *
 *  @param Title
 */
- (void)addrightButton:(NSString *)Title;

/**
 *  隐藏Tabbar
 */

-(void)hidenTabBar;
/**
 *  显示Tabbar
 */
-(void)showTabBar;

/**
 *  指定选中的Tabbar
 *
 *  @param index 指定第几个
 */
- (void)appointSelectIndex:(NSInteger)index;

/**
 *  指定哪一个Tabbar上面有一个小红点。为0 就不显示了
 *
 *  @param badgeValue 数量
 *  @param index      index
 */
-(void)appointbadgeValue:(NSInteger)badgeValue toIndex:(NSInteger)index;

/**
 *
 *
 *  @param canDragBack 是否可右滑返回
 */
- (void)navigationCanDragBack:(BOOL)canDragBack;


///**
// *  开始加载动画
// */
//-(void)startLoading;
//
//-(void)startHudLoading;
//
///**
// *  结束动画
// */
//-(void)stopLoading;
//
//-(void)StopHudLoaing;

@end
