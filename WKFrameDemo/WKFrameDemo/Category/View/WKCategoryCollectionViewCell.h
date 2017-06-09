//
//  WKCategoryCollectionViewCell.h
//  WKFrameDemo
//
//  Created by 王宇 on 2017/6/9.
//  Copyright © 2017年 wy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WKCategoryModel.h"
@interface WKCategoryCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (nonatomic, strong) subCategoryModel *model;

@end
