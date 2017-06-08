
//
//  WKHomeViewController.m
//  WKKit
//
//  Created by 王宇 on 16/9/13.
//  Copyright © 2016年 王宇. All rights reserved.
//
#import "WKHomeViewController.h"
#import "WKHomeModel.h"
#import "WKHomeFourChooseTableViewCell.h"
@interface WKHomeViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
@property (nonatomic, strong) WKHomeModel *model;
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation WKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    [self.tableView.mj_header beginRefreshing];
    [self netRequest];
}

#pragma mark  网络请求
-(void)netRequest{
    
    NSString *homeUrl = @"/home/index";
    WS(weakSelf)
    [WKRequest getWithURLString:homeUrl parameters:nil success:^(WKBaseModel *baseModel) {
        if (ZERO) {
            weakSelf.model = [WKHomeModel mj_objectWithKeyValues:baseModel.mDictionary];
            NSString *str = [[weakSelf.model.topicList[0] layoutList] layoutHeight];
            [weakSelf reloadData];
        }
        
    } failure:^(NSError *errer) {
        
    }];
}

-(void)reloadData{
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
}

#pragma mark  UITableViewDelegate,UITableViewDataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row==0) {
        WKHomeFourChooseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKHomeFourChooseTableViewCell" forIndexPath:indexPath];
        return cell;
    }
    return [UITableViewCell new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 70;
    }
    return 0;
}

#pragma mark  banner高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return ScreenWidth*550/750.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.01;
}

#pragma mark  banner视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    
    UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth*550/750.0)];
    header.backgroundColor=UIColorFromRGB(0xF6F5F2);
    NSMutableArray *imgUrlArray = [NSMutableArray new];
    for (promotionListModel *BannerModel in self.model.promotionList) {
        [imgUrlArray addObject:BannerModel.proUrl];
    }
    SDCycleScrollView *banner =[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(5, 5, ScreenWidth-10, ScreenWidth*55/75) imageURLStringsGroup:imgUrlArray];
    banner.currentPageDotColor = APPbluefontcolor;
    banner.pageDotColor = [UIColor whiteColor];
    banner.placeholderImage=[UIImage imageNamed:@"chang"];
    banner.autoScrollTimeInterval = 3;
    banner.delegate= self;
    [header addSubview:banner];
    return header;
}

#pragma mark SDCycleScrollViewDelegate
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
    DLog(@"%ld",index);
}

#pragma mark 懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-NavHeight) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = 0;
        WS(weakSelf)
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf netRequest];
        }];
        [_tableView registerNib:[UINib nibWithNibName:@"WKHomeFourChooseTableViewCell" bundle:nil] forCellReuseIdentifier:@"WKHomeFourChooseTableViewCell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

@end
