# WYKit
 网络请求的使用
 get请求 

 NSString *homeUrl = @"/home/index";
 [WKRequest getWithURLString:homeUrl parameters:nil success:^(WKBaseModel *baseModel) {

    } failure:^(NSError *errer) {

 }];

post 请求

NSMutableDictionary *parm=[NSMutableDictionary dictionary];
[parm setObject:@"1" forKey:@"type"];
[WKRequest postWithURLString:homeUrl parameters:parm success:^(WKBaseModel *baseModel) {

} failure:^(NSError *errer) {

}];

GCD 并发请求数据

第一步 定义
@property (nonatomic, strong) dispatch_group_t netWorkGroup;
第二部 实现
self.netWorkGroup = dispatch_group_create();
第三部 将你需要请求的接口都写在一个方法类
-(void)netWork{
WS(weakSelf)
dispatch_group_async(_netWorkGroup, dispatch_get_main_queue(), ^{
dispatch_group_enter(_netWorkGroup);
[weakSelf userInfo];
});

dispatch_group_async(_netWorkGroup, dispatch_get_main_queue(), ^{
dispatch_group_enter(_netWorkGroup);
[weakSelf mobileVip];
});

dispatch_group_notify(_netWorkGroup, dispatch_get_main_queue(), ^{
[weakSelf.tableView reloadData];
});

}

第四部 调用接口 然后在调用成功的时候在调用此函数
dispatch_group_leave(weakSelf.netWorkGroup);

完成

