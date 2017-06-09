//
//  WKCategoryViewController.m
//  WKFrameDemo
//
//  Created by 王宇 on 2017/5/31.
//  Copyright © 2017年 wy. All rights reserved.
//

#import "WKCategoryViewController.h"
#import "WKCategoryModel.h"
#import "XLPlainFlowLayout.h"
#import "WKCateSectionHeadCollectionReusableView.h"
#import "WKCategoryCollectionViewCell.h"
@interface WKCategoryViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) WKCategoryModel *mainModel;
@property (nonatomic, strong) UICollectionView *collection;
@end

@implementation WKCategoryViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title                            = @"分类";
    [self netWork];
}
#pragma mark 请求分类数据
-(void)netWork{
    NSString *categoryStr                 = @"/newCategory/index";
    NSMutableDictionary *param            =[NSMutableDictionary dictionary];
    [param safeSetObject:self.cId forKey:@"cid"];
    WS(weakSelf)
    [WKRequest postWithURLString:categoryStr parameters:param success:^(WKBaseModel *baseModel) {
        if (ZERO) {
            weakSelf.mainModel           = [WKCategoryModel mj_objectWithKeyValues:baseModel.mDictionary];
            [weakSelf.collection reloadData];
        }
        
    } failure:^(NSError *errer) {
        
    }];
}

#pragma mark  UICollectionViewDelegate,UICollectionViewDataSource

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return self.mainModel.category.count;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [self.mainModel.category[section] subCategory].count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    WKCategoryCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"WKCategoryCollectionViewCell" forIndexPath:indexPath];
    cell.model = [self.mainModel.category[indexPath.section] subCategory][indexPath.row];
    return cell;
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
    if (kind == UICollectionElementKindSectionHeader) {
        WKCateSectionHeadCollectionReusableView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WKCateSectionHeadCollectionReusableView" forIndexPath:indexPath];
        headView.model = self.mainModel.category[indexPath.section];
        return headView;
    }
    return nil;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
{
    
    return CGSizeMake(0, 40);
}

#pragma mark 懒加载
-(UICollectionView *)collection{
    if (!_collection) {
        XLPlainFlowLayout *layout       = [[XLPlainFlowLayout alloc]init];
        [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
        layout.itemSize                 = CGSizeMake(ScreenWidth/2-5, 40);
        layout.naviHeight               = 40;
        _collection                     = [[UICollectionView alloc]initWithFrame:CGRectMake(0, NavHeight, ScreenWidth, ScreenHeight-NavHeight-TabbarHeight) collectionViewLayout:layout];;
        _collection.delegate            = self;
        _collection.dataSource          = self;
        _collection.backgroundColor     = [UIColor whiteColor];
        [_collection registerNib:[UINib nibWithNibName:@"WKCateSectionHeadCollectionReusableView" bundle:nil] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"WKCateSectionHeadCollectionReusableView"];
        [_collection registerNib:[UINib nibWithNibName:@"WKCategoryCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"WKCategoryCollectionViewCell"];
        [self.view addSubview:_collection];
    }
    return _collection;
}




@end
