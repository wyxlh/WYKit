//
//  WKTabbarController.m
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKTabbarController.h"
#import "WKHomeViewController.h"
#import "WKCategoryViewController.h"
#import "WKUserCenterViewController.h"
#import "WKShoppingCartViewController.h"
#import "WKMoreViewController.h"
#import "WKNavigationController.h"
@interface WKTabbarController ()

@end

@implementation WKTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置文字颜色
    self.tabBar.tintColor = [UIColor whiteColor];
    
    [UITabBar appearance].translucent = NO;
    [[UITabBar appearance] setBarTintColor:APPPurplefontcolor];

    
    //常规状态
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       UIColorFromRGB(0x808AA4), NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateNormal];
    //选中状态
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                       [UIColor whiteColor], NSForegroundColorAttributeName,
                                                       nil] forState:UIControlStateSelected];
    [self initializeTabBarController];
    
    
    self.selectedIndex = 0;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*添加子控制器 */
- (void)initializeTabBarController{
    //主页
    WKHomeViewController *home = [[WKHomeViewController alloc] init];
    [self addChildViewController:home title:@"首页" image:@"toolbar_btn_01" selectedImage:@"toolbar_btn_01_selected"];
    
    //同好
    WKCategoryViewController *classVC = [[WKCategoryViewController alloc] init];
    [self addChildViewController:classVC title:@"商品" image:@"toolbar_btn_02" selectedImage:@"toolbar_btn_02_selected"];
    
    //我的
    WKUserCenterViewController *userVC = [[WKUserCenterViewController alloc] init];
    [self addChildViewController:userVC title:@"我的" image:@"toolbar_btn_03" selectedImage:@"toolbar_btn_03_selected"];
    
    //我的
    WKShoppingCartViewController *shopVC = [[WKShoppingCartViewController alloc] init];
    [self addChildViewController:shopVC title:@"购物车" image:@"toolbar_btn_04" selectedImage:@"toolbar_btn_04_selected"];
    
    //我的
    WKMoreViewController *moreVC = [[WKMoreViewController alloc] init];
    [self addChildViewController:moreVC title:@"更多" image:@"toolbar_btn_05" selectedImage:@"toolbar_btn_05_selected"];
}


#pragma mark 添加子控制器的方法
- (void)addChildViewController:(UIViewController *)childVc
                         title:(NSString*)title
                         image:(NSString*)image
                 selectedImage:(NSString*)selectedImage {
    
    // 始终绘制图片原始状态，不使用Tint Color,系统默认使用了Tint Color（灰色）
    [childVc.tabBarItem setImage:[[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    [childVc.tabBarItem setSelectedImage:[UIImage imageNamed:selectedImage]];
    //图片偏移
//    childVc.tabBarItem.imageInsets = UIEdgeInsetsMake(10, 0, 0, 0);
    childVc.tabBarItem.title = title;
    
    WKNavigationController *nav = [[WKNavigationController alloc] initWithRootViewController:childVc];
    [self addChildViewController:nav];
}


/**
 *  指定选中这个Tabbar
 *
 */
-(void)appointTabbarIndex:(NSInteger)index{
    
    NSInteger number = self.viewControllers.count;
    if (index >= number|| index<0) {
        NSAssert(@"指定index出现错误", nil);
    }else{
        [self setSelectedIndex:index];
    }
    
}

/**
 *  指定哪一个Tabbar上面有一个小红点。为0 就不显示了
 *
 *  @param badgeValue 数量
 *  @param index      index
 */
-(void)appointbadgeValue:(NSInteger)badgeValue toIndex:(NSInteger)index{
    
    
    if (badgeValue!=0) {
        NSInteger number = self.viewControllers.count;
        if (index<number) {
            UIViewController *VC= [self.viewControllers objectAtIndex:index];
            VC.tabBarItem.badgeValue = [NSString stringWithFormat:@"%ld",(long)badgeValue];
        }
    } else {
        NSInteger number = self.viewControllers.count;
        if (index<number) {
            UIViewController *VC= [self.viewControllers objectAtIndex:index];
            VC.tabBarItem.badgeValue = nil;
        }
    }
}


@end
