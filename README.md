# WYKit
# 网络请求的使用
 * get请求 
```
 NSString *homeUrl = @"/home/index";
 [WKRequest getWithURLString:homeUrl parameters:nil success:^(WKBaseModel *baseModel) {

    } failure:^(NSError *errer) {

 }];

```

* post 请求
```
NSMutableDictionary *parm=[NSMutableDictionary dictionary];
[parm setObject:@"1" forKey:@"type"];
[WKRequest postWithURLString:homeUrl parameters:parm success:^(WKBaseModel *baseModel) {

} failure:^(NSError *errer) {

}];
```

# GCD 并发请求数据

 * 第一步 定义
```
@property (nonatomic, strong) dispatch_group_t netWorkGroup;

```
* 第二部 实现
```
self.netWorkGroup = dispatch_group_create();
```
* 第三部 将你需要请求的接口都写在一个方法类
```
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
```
* 第四部 调用接口 然后在调用成功的时候在调用此函数
```
dispatch_group_leave(weakSelf.netWorkGroup);
```

完成

# 添加tableviewCell 放大, 拖拽效果
 * 第一步 定义
```
@property (nonatomic, strong) UIImageView *pictureImageView;
```
*第二步 在头视图里面实现 
```
_pictureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 180)];
_pictureImageView.image = [UIImage imageNamed:@"myaccount_bg"];
/*
重要的属性设置
*/
//这个属性的值决定了 当视图的几何形状变化时如何复用它的内容 这里用 UIViewContentModeScaleAspectFill 意思是保持内容高宽比 缩放内容 超出视图的部分内容会被裁减 填充UIView
_pictureImageView.contentMode = UIViewContentModeScaleAspectFill;
// 这个属性决定了子视图的显示范围 取值为YES时，剪裁超出父视图范围的子视图部分.这里就是裁剪了_pictureImageView超出_header范围的部分.
_pictureImageView.clipsToBounds = YES;

[self addSubview:_pictureImageView];
[self sendSubviewToBack:_pictureImageView];
```
* 第三步 在 conteoller 里面实现 scrollView 的 delegate
```
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
```

