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
