//
//  SKStartPageViewController.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/12.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "SKStartPageViewController.h"
#import "WKTabbarController.h"

@interface SKStartPageViewController ()
@property (nonatomic, strong) NSDictionary *imgArr;
@property (weak, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) UIWindow *window;
@property (nonatomic,strong) WKTabbarController *tabbar;
@end

@implementation SKStartPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self netWork];
}

-(void)netWork{
    NSString *coverUrl      = @"cover/index";
    NSString *string        = [self screenSize];;
    NSDictionary *params    = [NSDictionary dictionaryWithObjectsAndKeys:string, @"screen", nil];
    WS(weakSelf)
    [WKRequest getWithURLString:coverUrl parameters:params success:^(WKBaseModel *baseModel) {
        if (ZERO) {
            weakSelf.imgArr = [baseModel.mDictionary safeJsonObjForKey:@"imageList"];
            [weakSelf.imgView sd_setImageWithURL:[NSURL URLWithString:[weakSelf.imgArr safeJsonObjForKey:@"imageUrl"]]];
            [weakSelf disapper];
        }
        
    } failure:^(NSError *errer) {
        
    }];
}

-(void)disapper{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        //创建window
        UIWindow *window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
        self.window = window;
        [self.window setBackgroundColor:[UIColor whiteColor]];
        
        if (!self.tabbar) {
            self.tabbar = [[WKTabbarController alloc] init];
            self.tabbar.delegate = (id)self;
        }
            [self.window setRootViewController:self.tabbar];
        
        [self.window makeKeyAndVisible];
    });
}


- (NSString *)screenSize
{
    // 硬件设备的屏幕尺寸，如“320*480”
    CGSize scrSize;
    if ([UIScreen instancesRespondToSelector:@selector(currentMode)]) {
        scrSize = [[[UIScreen mainScreen] currentMode] size];
    }
    else {
        scrSize = [[UIScreen mainScreen] bounds].size;
    }
    NSString *screen = [NSString stringWithFormat:@"%d*%d",(int)scrSize.width,(int)scrSize.height];
    
    return screen;
}


@end
