//
//  WKTableAnimationsListViewController.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/10/18.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKTableAnimationsListViewController.h"
#import "WKTableViewAnDetailViewController.h"
@interface WKTableAnimationsListViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic, strong) NSArray *styles;
@end

@implementation WKTableAnimationsListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"表格动画";
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.delaysContentTouches = NO;
    self.tableView.rowHeight = 60;
    self.tableView.tableFooterView = [UIView new];
    if (!_styles) {
        _styles = @[@"SlideFromLeft", @"SlideFromRight", @"Fade", @"Fall", @"Vallum", @"Shakee", @"Flip", @"FlipX", @"Balloon", @"BalloonTop"];
    }
}
#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _styles.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    }
    cell.textLabel.text = _styles[indexPath.row];
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WKTableViewAnDetailViewController *detail = [WKTableViewAnDetailViewController new];
    detail.type = indexPath.row+1;
    [self.navigationController pushViewController:detail animated:YES];
    
}
@end
