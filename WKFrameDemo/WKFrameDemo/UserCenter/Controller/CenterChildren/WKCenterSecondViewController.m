//
//  WKCenterSecondViewController.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/30.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKCenterSecondViewController.h"
#import "WKSizeClassTableViewCell.h"
#import "WKSizeClassFirstTableViewCell.h"
@interface WKCenterSecondViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

@implementation WKCenterSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUp];
}

-(void)setUp{
    self.title                          = @"sizeClass";
    self.tableView.delegate             = self;
    self.tableView.dataSource           = self;
    [self.tableView registerNib:[UINib nibWithNibName:@"WKSizeClassTableViewCell" bundle:nil] forCellReuseIdentifier:@"WKSizeClassTableViewCell"];
    [self.tableView registerNib:[UINib nibWithNibName:@"WKSizeClassFirstTableViewCell" bundle:nil] forCellReuseIdentifier:@"WKSizeClassFirstTableViewCell"];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        WKSizeClassFirstTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKSizeClassFirstTableViewCell" forIndexPath:indexPath];
        return cell;
    }
    WKSizeClassTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WKSizeClassTableViewCell" forIndexPath:indexPath];
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        return 200;
    }
    return 100;
    
}






@end
