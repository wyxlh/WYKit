
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
#import "WKHomeTextModel.h"
#import "WKWebViewController.h"
#import "WKFirstImageTableViewCell.h"
#import "WKHomeOneImgTableViewCell.h"
#import "WKHomeTwoImgTableViewCell.h"
#import "WKHomeThreeImgTableViewCell.h"
#import "WKHomeBottonTableViewCell.h"
#import "UIImageView+WebCache.h"
#define FirstImageHeight ScreenWidth*220/750
#define OneImageHeight ScreenWidth*420/750
#define EFirstImageHeight ScreenWidth*160/750
#define TwoImageHeight ScreenWidth*750/750
@interface WKHomeViewController ()<UITableViewDelegate,UITableViewDataSource,SDCycleScrollViewDelegate>
@property (nonatomic, strong) WKHomeModel *model;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray     *textArr;
@end

@implementation WKHomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"首页";
    self.view.backgroundColor = UIColorFromRGB(0xF6F5F2);
    [self.tableView.mj_header beginRefreshing];
//     [[SDImageCache sharedImageCache] storeImage:[UIImage imageNamed:@""] imageData:[NSData data] forKey:urlString toDisk:YES completion:nil];

    
}

#pragma mark  网络请求
-(void)netRequest{
    
    NSString *homeUrl = @"/home/index";
    WS(weakSelf)
    [WKRequest getWithURLString:homeUrl parameters:nil success:^(WKBaseModel *baseModel) {
        if (ZERO) {
            weakSelf.model = [WKHomeModel mj_objectWithKeyValues:baseModel.mDictionary];
            [weakSelf newProduct];
            [SKToast showMessage:baseModel.message inView:weakSelf.view];
            
        }
        
    } failure:^(NSError *errer) {
        [weakSelf reloadData];
    }];
}

#pragma mark 滚动的title
-(void)newProduct{
    NSString *homeUrl = @"newProduct/index";
    WS(weakSelf)
    [WKRequest getWithURLString:homeUrl parameters:nil success:^(WKBaseModel *baseModel) {
        if (ZERO) {
            weakSelf.textArr = [WKHomeTextModel mj_objectArrayWithKeyValuesArray:[baseModel.mDictionary objectForKey:@"annList"]];
            [weakSelf reloadData];
        }
        
    } failure:^(NSError *errer) {
        [weakSelf reloadData];
    }];
}



#pragma mark 刷新表格
-(void)reloadData{
    [self.tableView.mj_header endRefreshing];
    [self.tableView reloadData];
}

#pragma mark  UITableViewDelegate,UITableViewDataSource

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 9;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        WKHomeFourChooseTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKHomeFourChooseTableViewCell" forIndexPath:indexPath];
        cell.titleArray = self.textArr;
        cell.superVC = self;
        return cell;
    }else if (indexPath.section == 1){
        WKFirstImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKFirstImageTableViewCell" forIndexPath:indexPath];
        cell.model = self.model.topicList[indexPath.section-1];
        return cell;
    }else if (indexPath.section == 2){
        WKHomeOneImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKHomeOneImgTableViewCell" forIndexPath:indexPath];
        cell.model = self.model.topicList[indexPath.section-1];
        return cell;
    }else if (indexPath.section == 3){
        WKHomeTwoImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKHomeTwoImgTableViewCell" forIndexPath:indexPath];
        cell.model = self.model.topicList[indexPath.section-1];
        return cell;
    }else if (indexPath.section == 4){
        WKFirstImageTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKFirstImageTableViewCell" forIndexPath:indexPath];
        cell.model = self.model.topicList[indexPath.section-1];
        return cell;
    }else if (indexPath.section == 5){
        WKHomeThreeImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKHomeThreeImgTableViewCell" forIndexPath:indexPath];
        cell.model = self.model.topicList[indexPath.section-1];
        return cell;
    }else if (indexPath.section == 6 || indexPath.section == 7){
        WKHomeOneImgTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKHomeOneImgTableViewCell" forIndexPath:indexPath];
        cell.model = self.model.topicList[indexPath.section-1];
        return cell;
    }else if (indexPath.section == 8){
        WKHomeBottonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKHomeBottonTableViewCell" forIndexPath:indexPath];
//        cell.model = self.model.topicList [indexPath.section-1];
        return cell;
    }
    return [UITableViewCell new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        return 100;
    }else if (indexPath.section ==1){
        return FirstImageHeight;
    }else if (indexPath.section ==2 || indexPath.section ==3 || indexPath.section == 5 ||indexPath.section ==6  ||indexPath.section == 7){
        return OneImageHeight;
    }else if (indexPath.section == 4){
        return EFirstImageHeight;
    }else if (indexPath.section == 8){
        return TwoImageHeight;
    }
    return 0;
}

#pragma mark  banner高度
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        return ScreenWidth*550/750.0;
    }
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    
    return 0.01;
}

#pragma mark  banner视图
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 0) {
        UIView *header = [[UIView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth*550/750.0)];
        header.backgroundColor=UIColorFromRGB(0xF6F5F2);
        NSMutableArray *imgUrlArray = [NSMutableArray new];
        for (promotionListModel *BannerModel in self.model.promotionList) {
            [imgUrlArray addObject:BannerModel.proUrl];
        }
        SDCycleScrollView *banner =[SDCycleScrollView cycleScrollViewWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenWidth*55/75) imageURLStringsGroup:imgUrlArray];
        banner.currentPageDotColor = APPbluefontcolor;
        banner.pageDotColor = [UIColor whiteColor];
        banner.placeholderImage=[UIImage imageNamed:@"chang"];
        banner.autoScrollTimeInterval = 3;
        banner.delegate= self;
        [header addSubview:banner];
        return header;
    }
    return nil;
   
}

#pragma mark SDCycleScrollViewDelegate
-(void)cycleScrollView:(SDCycleScrollView *)cycleScrollView didScrollToIndex:(NSInteger)index{
//    DLog(@"%ld",index);
}


#pragma mark 懒加载
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:CGRectMake(5, NavHeight+5, ScreenWidth-10, ScreenHeight-NavHeight-TabbarHeight-5) style:UITableViewStyleGrouped];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.separatorStyle = 0;
        _tableView.backgroundColor = UIColorFromRGB(0xF6F5F2);
        WS(weakSelf)
        _tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
            [weakSelf netRequest];
        }];
        [_tableView registerNib:[UINib nibWithNibName:@"WKHomeFourChooseTableViewCell" bundle:nil] forCellReuseIdentifier:@"WKHomeFourChooseTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"WKFirstImageTableViewCell" bundle:nil] forCellReuseIdentifier:@"WKFirstImageTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"WKHomeOneImgTableViewCell" bundle:nil] forCellReuseIdentifier:@"WKHomeOneImgTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"WKHomeTwoImgTableViewCell" bundle:nil] forCellReuseIdentifier:@"WKHomeTwoImgTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"WKHomeThreeImgTableViewCell" bundle:nil] forCellReuseIdentifier:@"WKHomeThreeImgTableViewCell"];
        [_tableView registerNib:[UINib nibWithNibName:@"WKHomeBottonTableViewCell" bundle:nil] forCellReuseIdentifier:@"WKHomeBottonTableViewCell"];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}


@end
