//
//  WKTableViewAnDetailViewController.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/10/18.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKTableViewAnDetailViewController.h"

@interface WKTableViewAnDetailViewController () <UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation WKTableViewAnDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"效果";
    [self addrightButton:@"刷新"];
    [self.tableView reloadData];
}

-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-64) style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.delaysContentTouches = NO;
        _tableView.rowHeight = 90;
        _tableView.zh_reloadAnimationType = self.type;
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(void)rightButtonClick:(id)sender{
    [_tableView reloadData];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 30;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"_cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"_cell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
        button.frame = CGRectMake(10, 10, ScreenWidth-20, 70);
        button.backgroundColor = [UIColor darkGrayColor];
        button.layer.cornerRadius = 5;
        [cell.contentView addSubview:button];
       
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    [cell zh_presentAnimateSlideFromLeft];
}


@end
