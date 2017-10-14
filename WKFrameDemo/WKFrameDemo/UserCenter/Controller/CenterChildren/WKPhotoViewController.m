//
//  WKPhotoViewController.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/9/8.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKPhotoViewController.h"
#import "LLPhotoBrowser.h"
@interface WKPhotoViewController ()<LLPhotoBrowserDelegate>
@property (nonatomic, strong) NSArray *photoArr;
@end

@implementation WKPhotoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    SDCycleScrollView *banner =[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 100, ScreenWidth, ScreenWidth*55/75) imageURLStringsGroup:self.photoArr];
    banner.clickItemOperationBlock = ^(NSInteger index){
        // 1 初始化
        LLPhotoBrowser *photoBrowser = [[LLPhotoBrowser alloc]init];
        // 2 设置代理
        photoBrowser.delegate = self;
        // 3 设置当前图片
        photoBrowser.currentImageIndex = index;
        // 4 设置图片的个数
        photoBrowser.imageCount = self.photoArr.count;
        // 5 设置图片的容器
        photoBrowser.sourceImagesContainerView = self.view;
        // 6 展示
        [photoBrowser show];
    };
    banner.currentPageDotColor = APPbluefontcolor;
    banner.pageDotColor = [UIColor whiteColor];
    banner.placeholderImage=[UIImage imageNamed:@"chang"];
    banner.autoScrollTimeInterval = 3;
    [self.view addSubview:banner];
}

// 代理方法 返回图片URL
- (NSURL *)photoBrowser:(LLPhotoBrowser *)browser highQualityImageURLForIndex:(NSInteger)index{
    
    NSURL *url = [NSURL URLWithString:self.photoArr[index]];
    
    return url;
}
// 代理方法返回缩略图
//- (UIImage *)photoBrowser:(LLPhotoBrowser *)browser placeholderImageForIndex:(NSInteger)index{
//    
//    NSIndexPath *indexPath = [NSIndexPath indexPathForItem:index inSection:0];
//
//    LLPhotoCell *cell = (LLPhotoCell *)[self.collectionView cellForItemAtIndexPath:indexPath];
//    
//    return cell.bigImgV.image;
    
//}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (NSArray *)photoArr{
    if (!_photoArr) {
        _photoArr = @[@"http://ww2.sinaimg.cn/mw690/e67669aagw1fa6gynybcsj20iz0sgwhk.jpg",
                      @"http://ww2.sinaimg.cn/mw690/e67669aagw1fbfr3ryrt2j21kw2dc4eo.jpg",
                      @"http://wx4.sinaimg.cn/mw690/63e6fd01ly1fe2iqm8d2wj20qo11cn5d.jpg",
                      @"http://ww4.sinaimg.cn/bmiddle/6a15cf5aly1fewww17l6rj20qo0yatfc.jpg",
                      @"http://wx3.sinaimg.cn/mw690/b024b1c1ly1feg7x4lu0cg20dw07te85.gif",
                      @"http://ww3.sinaimg.cn/bmiddle/c45009afgy1ff9r1z9nsgj20qo3abhcj.jpg"];
    }
    return _photoArr;
}
@end
