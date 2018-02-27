//
//  WKBaseViewController.m
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKBaseViewController.h"
#import "AppDelegate.h"
@interface WKBaseViewController ()
@end
#define ItemImagewidth 30.0f
#define ItemButtonwidth 50.0f
#define kRequestTime 2.0f//控制消失时间也可以设置网络
@implementation WKBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.automaticallyAdjustsScrollViewInsets = NO;
//    self.navigationController.navigationBar.hidden = YES;
    self.navigationController.navigationBar.translucent = NO;
    self.view.backgroundColor = [UIColor whiteColor];
      [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
    [self setNavBar];
    if ([self.navigationController viewControllers].count>1) {
        [self addBackItem];
    }
    [self addleftItem:@""];
    [self addrightItem:@""];
    
}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
}


/**
 *  设置Title
 *
 */
-(void)setTitle:(NSString *)title{
//    _navbar.titlelable.text = title;
}
/**
 *  添加NavBar
 */
-(void)setNavBar{
    _navbar = [[WKNavigationView alloc] initWithFrame:CGRectMake(0, 0,ScreenWidth, NavHeight)];
//    _navbar.titlelable.text = self.title;
//    [self.view addSubview:_navbar];
   
}


#pragma mark 返回
-(void)backItemTouched:(id)sender{
    
    [self goBack];
}

-(void)leftItemTouched:(id)sender{
    DLog(@"需要重写leftItemTouched");
}

-(void)leftButtonClick:(id)sender{
    DLog(@"需要重写leftButtonClick");
}

-(void)rightItemTouched:(id)sender{
    DLog(@"需要重写rightItemTouched");
}

-(void)rightButtonClick:(id)sender{
    DLog(@"需要重写rightItemTouched");
}

-(void)goBack{
    
    NSArray* vcarr = [self.navigationController viewControllers];
    if (vcarr.count > 1)
    {
        [self.navigationController popViewControllerAnimated:YES];
    }
    else
    {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}
#pragma mark 返回图片
-(void)addBackItem{
    self.backItem.image=[UIImage imageNamed:@"navbar_btn_back"];
}

-(UIImageView *)backItem{
    if (!_backItem) {
        _backItem = [[UIImageView alloc]init];
        _backItem.contentMode = UIViewContentModeScaleAspectFit;
        _backItem.userInteractionEnabled = YES;
        UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(backItemTouched:)];
        [_backItem addGestureRecognizer:backTap];
        [_navbar addSubview:_backItem];
        _backItem.frame = CGRectMake(5, 28, ItemImagewidth, ItemImagewidth);
    }
    return _backItem;
}

/**
 *  添加左按钮，传入图片名
 *
 */
-(void)addleftItem:(NSString *)leftItemImageName{
    
    if (leftItemImageName.length!=0)
    {
        if (_backItem!=nil) {
            [_backItem removeFromSuperview];
        }
        self.leftItem.image = [UIImage imageNamed:leftItemImageName];
    }
}

-(UIImageView *)leftItem{
    
    if (!_leftItem) {
        _leftItem = [[UIImageView alloc]init];
        
        _leftItem.userInteractionEnabled = YES;
        UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(leftItemTouched:)];
        [_leftItem addGestureRecognizer:backTap];
        [_navbar addSubview:_leftItem];
        _leftItem.frame = CGRectMake(5, 28, ItemImagewidth, ItemImagewidth);
    }
    return _leftItem;
}
/**
 *  添加右按钮，传入图片名
 *
 */
-(void)addrightItem:(NSString *)rightItemImageName{
    
    if (rightItemImageName.length!=0)
    {
        self.rightItem.image = [UIImage imageNamed:rightItemImageName];
    }
}

-(UIImageView *)rightItem{
    
    if (!_rightItem) {
        _rightItem = [[UIImageView alloc]init];
        _rightItem.userInteractionEnabled = YES;
        UITapGestureRecognizer *backTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(rightItemTouched:)];
        [_rightItem addGestureRecognizer:backTap];
        [_navbar addSubview:_rightItem];
        _rightItem.frame = CGRectMake(ScreenWidth-35, 28, ItemImagewidth, ItemImagewidth);
    }
    return _rightItem;
}

/**
 *  添加左侧按钮。传入一个Title
 *
 */
- (void)addleftButton:(NSString *)Title{
    
    if (Title.length!=0)
    {
        [self.leftButton setTitle:Title forState:0];
    }
    
}

-(UIButton *)leftButton{
    
    if (!_leftbtn) {
        
        _leftbtn = [[UIButton alloc]init];
        [_leftbtn addTarget:self action:@selector(leftButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _leftbtn.titleLabel.font = BtnTextFont;
        [_leftbtn setTitleColor:[UIColor whiteColor] forState:0];
        [_navbar addSubview:_leftbtn];
        _leftbtn.frame = CGRectMake(5, 28, ItemButtonwidth, ItemImagewidth);
        
    }
    return _leftbtn;
}
/**
 *  添加右侧按钮。传入一个Title
 *
 */
- (void)addrightButton:(NSString *)Title{
    
    if (Title.length!=0)
    {
        [self.rightButton setTitle:Title forState:0];
    }
}

-(UIButton *)rightButton{
    
    if (!_rightbtn) {
        
        _rightbtn = [[UIButton alloc]init];
        [_rightbtn addTarget:self action:@selector(rightButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        _rightbtn.titleLabel.font = BtnTextFont;
        [_rightbtn setTitleColor:[UIColor whiteColor] forState:0];
        [_navbar addSubview:_rightbtn];
        _rightbtn.frame =  CGRectMake(ScreenWidth-55, 28, ItemButtonwidth, ItemImagewidth);
        
    }
    return _rightbtn;
    
}

/**
 *  隐藏tabbar
 */
-(void)hidenTabBar{
    [UIView animateWithDuration:0.2 animations:^{
        [UIView setAnimationCurve:1];
        AppDelegate *Delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        _tabbarVC = Delegate.tabbar;
        _tabbarVC.tabBar.frame=CGRectMake(-ScreenWidth, _tabbarVC.tabBar.frame.origin.y, _tabbarVC.tabBar.frame.size.width, TabbarHeight);
    }];
}
/**
 *  显示Tabbar
 */
-(void)showTabBar{
    [UIView animateWithDuration:0.2 animations:^{
        [UIView setAnimationCurve:1];
        AppDelegate *Delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        _tabbarVC = Delegate.tabbar;
        _tabbarVC.tabBar.frame=CGRectMake(0, _tabbarVC.tabBar.frame.origin.y, _tabbarVC.tabBar.frame.size.width, TabbarHeight);
        
    }];
}


/**
 *  指定选中的Tabbar
 *
 *  @param index 指定第几个
 */
- (void)appointSelectIndex:(NSInteger)index
{
    AppDelegate *Delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [Delegate.tabbar appointTabbarIndex:index];
}

/**
 *  指定哪一个Tabbar上面有一个小红点。为0 就不显示了
 *
 *  @param badgeValue 数量
 *  @param index      index
 */
-(void)appointbadgeValue:(NSInteger)badgeValue toIndex:(NSInteger)index{
    AppDelegate *Delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    [Delegate.tabbar appointbadgeValue:badgeValue toIndex:index];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/**
 *  是否可右滑返回
 *
 *  @param canDragBack canDragBack
 */
//- (void)navigationCanDragBack:(BOOL)canDragBack
//{
//    if (self.navigationController)
//    {
//        [((WKNavigationController *)(self.navigationController)) navigationCanDragBack:canDragBack];
//    }
//}
///**
// *  开始加载动画
// */
//-(void)startLoading{
//    self.hudView = [[TYDotIndicatorView alloc] initWithFrame:CGRectMake(30, CGRectGetHeight(self.view.frame)/2,100, 100) dotStyle:TYDotIndicatorViewStyleCircle dotColor:CustomColor(255, 255, 255, 1) dotSize:CGSizeMake(6,6)];
//    [self.hudView setCenter:self.view.center];
//    self.hudView.backgroundColor =CustomColor(0, 0, 0, 0.7);
//    //    darkCircleDot.hidden=YES;
//    UIImageView *imageView=[[UIImageView alloc]initWithFrame:CGRectMake(30, CGRectGetHeight(self.hudView.frame)/2-35, 40, 40)];
//    imageView.image=[UIImage imageNamed:@"HomePage_addressList"];
//    [self.hudView addSubview:imageView];
//    UILabel *title=[[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetHeight(imageView.frame)+20, CGRectGetWidth(self.hudView.frame), 20)];
//    title.text=@"加载中...";
//    title.font=[UIFont systemFontOfSize:13];
//    title.textAlignment=NSTextAlignmentCenter;
//    title.textColor=[UIColor whiteColor];
//    [self.hudView addSubview:title];
//    [self.hudView startAnimating];
//    self.hudView.layer.cornerRadius = 5.0f;
//    [self.view addSubview:self.hudView];
//}
//
///**
// *  结束动画
// */
//-(void)stopLoading{
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(kRequestTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        
//        //GCD减退 试图消失
//        [self.hudView removeFromSuperview];
//        
//        
//    });
//}
//
///*
// 开始动画
// */
//
//-(void)startHudLoading{
//    self.HView=[[JHUD alloc]initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-NavHeight)];
//    self.HView.backgroundColor=[UIColor whiteColor];
//    NSString *path = [[NSBundle mainBundle] pathForResource:@"shuaxin" ofType:@"gif"];
//    NSData *data = [NSData dataWithContentsOfFile:path];
//    self.HView.gifImageData = data;
//    self.HView.indicatorViewSize = CGSizeMake(250, 250);
//    self.HView.messageLabel.text = @"Hello ,this is a gif animation";
//    [self.HView showAtView:self.view hudType:JHUDLoadingTypeGifImage];
//}
//
//
//-(void)StopHudLoaing{
//    [self.HView hide];
//}



@end
