//
//  WKFirstViewController.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/29.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKFirstViewController.h"
#import "WKFirstTableViewCell.h"
@interface WKFirstViewController ()<UITableViewDelegate , UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WKFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
}

-(void)setup{
    self.title                          = @"first";
    self.tableView.delegate             = self;
    self.tableView.dataSource           = self;
    self.tableView.estimatedRowHeight   = 50;
    [self.tableView registerNib:[UINib nibWithNibName:@"WKFirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"WKFirstTableViewCell"];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 50;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    WKFirstTableViewCell *cell          = [tableView dequeueReusableCellWithIdentifier:@"WKFirstTableViewCell" forIndexPath:indexPath];
    return cell;
}


-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    [cell startCellScaleAnimation]; 放大效果
    [cell startCellDelayDisplayAnimationWithTableView:tableView];//延时效果
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    // 延迟出现效果需要加这句
//    if (_cellDisplayAnimationType == CellDisplayAnimationTypeDelayDisplay) {
        [scrollView offsetWithScrollView];
//    }
}





@end
