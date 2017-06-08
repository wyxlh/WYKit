//
//  WKHomeFourChooseTableViewCell.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/8.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKHomeFourChooseTableViewCell.h"
#import "ZXCenterBtn.h"
#import "NewsView.h"
#import "WKWebViewController.h"
@interface WKHomeFourChooseTableViewCell()
@property (nonatomic,strong)NewsView *newsview;
@property (nonatomic,strong)UIView *showtitleview;
@end

@implementation WKHomeFourChooseTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    for (int i=0; i<4; i++) {
        ZXCenterBtn *btn=[[[NSBundle mainBundle] loadNibNamed:@"ZXCenterBtn" owner:nil options:nil] lastObject];
        btn.tag=i+1;
        btn.imgview.image=[UIImage imageNamed:[NSString stringWithFormat:@"homemenu%d",i+1]];
        btn.frame=CGRectMake(i*ScreenWidth/4, 0, ScreenWidth/4, 70);
        btn.autoresizingMask = 0;
        if (i<3) {
            btn.countLbl.hidden=NO;
            [self getOrderCount:i];
        }
        [self addSubview:btn];
    }
}

-(void)getOrderCount:(NSInteger)index{
    
}
-(UIView *)showtitleview{
    
    
    if (!_showtitleview) {
        _showtitleview = [[UIView alloc]initWithFrame:CGRectMake(0, 70, ScreenWidth, 30)];
        _showtitleview.backgroundColor = [UIColor whiteColor];
        _showtitleview.userInteractionEnabled = YES;
        [self addSubview:_showtitleview];
        
        //TOMMY 快报
        UILabel *Letters = [[UILabel alloc]initWithFrame:CGRectMake(10, 0, 80, 30)];
        Letters.textColor = [UIColor colorWithRed:0.746 green:0.000 blue:0.141 alpha:1.000];
        Letters.text = @"TOMMY快报";
        Letters.textAlignment = NSTextAlignmentLeft;
        Letters.font = [UIFont systemFontOfSize:12];
        [_showtitleview addSubview:Letters];
        
        
        //imageline
        UIImageView *imageline = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(Letters.frame)-5, 5, 1, 20)];
        imageline.image = [UIImage imageNamed:@"1px.png"];
        [_showtitleview addSubview:imageline];
        
        
        //radio
        UIImageView *imageradio = [[UIImageView alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageline.frame)+8, 8, 15, 15)];
        imageradio.image = [UIImage imageNamed:@"homemenu5.png"];
        [_showtitleview addSubview:imageradio];
        
        self.newsview.frame = CGRectMake(CGRectGetMaxX(imageradio.frame)+5, 0,250, 30);
        [_showtitleview addSubview:self.newsview];
        
    }
    return _showtitleview;
}

-(void)setTitleArray:(NSArray *)array{
    _titleArray = array;
    if (array.count>0) {
        self.showtitleview.hidden = NO;
        self.newsview.hidden = NO;
        [self showtitleview];
        self.newsview.array = array;
    }else{
        self.showtitleview.hidden = YES;
        self.newsview.hidden = YES;
    }
    
}


-(NewsView *)newsview{
    
    if (!_newsview) {
        _newsview = [[NewsView alloc]init];
        _newsview.backgroundColor = [UIColor whiteColor];
        WS(weakSelf)
        _newsview.ClickBlick = ^(NSInteger index){
            [weakSelf jumpVC:index];
        };
    }
    return _newsview;
}

#pragma  maek 跳转
-(void)jumpVC:(NSInteger)index{
    NSString *path = [self.titleArray[index] pageurl];
    NSString *annName = [self.titleArray[index] annName];
    WKWebViewController *web = [WKWebViewController new];
    web.urlString = path;
    web.navTitle  = annName;
    web.hidesBottomBarWhenPushed = YES;
    [self.superVC.navigationController pushViewController:web animated:YES];
}



- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
