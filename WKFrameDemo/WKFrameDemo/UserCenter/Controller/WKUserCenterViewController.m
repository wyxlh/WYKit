//
//  WKUserCenterViewController.m
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//

#import "WKUserCenterViewController.h"
#import "WKUserCenterTableViewCell.h"
#import "WKUserCenterHeadView.h"
@interface WKUserCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) WKUserCenterHeadView *headView;
@end

@implementation WKUserCenterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"我的";
    [self.tableView reloadData];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WKUserCenterTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKUserCenterTableViewCell" forIndexPath:indexPath];
    return cell;
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    /**
     *  这里的偏移量是纵向从contentInset算起 则一开始偏移就是0 向下为负 上为正 下拉
     */
    
    // 获取到tableView偏移量
    CGFloat Offset_y = scrollView.contentOffset.y;
    // 下拉 纵向偏移量变小 变成负的
    if ( Offset_y < 0) {
        // 拉伸后图片的高度
        CGFloat totalOffset = 180 - Offset_y;
        // 图片放大比例
        CGFloat scale = totalOffset / 180;
        CGFloat width = ScreenWidth;
        // 拉伸后图片位置
        _headView.pictureImageView.frame = CGRectMake(-(width * scale - width) / 2, Offset_y, width * scale, totalOffset);
    }
    
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView=[[UITableView alloc]initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-NavHeight) style:UITableViewStylePlain];
        _tableView.delegate=self;
        _tableView.dataSource=self;
        _tableView.separatorStyle=0;
        _tableView.rowHeight = 210 ;
        _tableView.tableHeaderView = self.headView;
        [_tableView registerNib:[UINib nibWithNibName:@"WKUserCenterTableViewCell" bundle:nil] forCellReuseIdentifier:@"WKUserCenterTableViewCell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

#pragma mark  🚖
-(WKUserCenterHeadView *)headView{
    if (!_headView) {
        _headView = [[[NSBundle mainBundle] loadNibNamed:@"WKUserCenterHeadView" owner:nil options:nil] lastObject];
    }
    return _headView;
}

@end
