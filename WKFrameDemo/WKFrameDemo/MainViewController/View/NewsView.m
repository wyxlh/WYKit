//
//  NewsView.m
//  Created by maxin on 16/3/22.
//  Copyright © 2016年 maxin. All rights reserved.
//
#import "NewsView.h"
#import "WKHomeTextModel.h"
@implementation NewsView
@synthesize titleLabel;
@synthesize newsButton;
static int countInt=0;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        titleLabel=[[UILabel alloc] initWithFrame:CGRectMake(0, 2, 211, 30)];
        titleLabel.textColor=APPDarkBlueBgColor;
        titleLabel.backgroundColor=[UIColor clearColor];
        titleLabel.font=[UIFont systemFontOfSize:12.0];
        titleLabel.lineBreakMode = NSLineBreakByTruncatingTail;
        titleLabel.numberOfLines = 1;
        [self addSubview:titleLabel];
        newsButton=[UIButton buttonWithType:UIButtonTypeCustom];
        [newsButton setFrame:titleLabel.bounds];
        [self addSubview:newsButton];
    }
    return self;
}

-(void)setArray:(NSArray *)array{
    _array = array;
    if (array.count==0) {
        return;
    }
    
    for (WKHomeTextModel *model in array) {
        [self.dataArray addObject:model.annName];
    }
    [titleLabel setText:[self.dataArray objectAtIndex:countInt]];
    [newsButton addTarget:self action:@selector(topNewsInfoClicked:) forControlEvents:UIControlEventTouchUpInside];
    //设置定时器
    if (!self.timer) {
        self.timer = [NSTimer scheduledTimerWithTimeInterval:3 target:self selector:@selector(displayNews) userInfo:nil repeats:YES];
        [[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
    }

}

-(NSMutableArray *)dataArray{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:0];
    }
    return _dataArray;
}

-(void)displayNews{
    countInt++;
//    DLog(@"%d",countInt);
    if (countInt >= [ self.array count])
        countInt=0;
    [UIView animateWithDuration:0.5 animations:^{
        titleLabel.frame = CGRectMake(0,-30, 211, 30);
    }completion:^(BOOL flage){
        titleLabel.frame = CGRectMake(0, 0, 211, 30);
        CATransition *animation = [CATransition animation];
        animation.duration = 0.4f;
        animation.type = kCATransitionFade;
        animation.subtype = kCATransitionFromTop;
        [self.layer addAnimation:animation forKey:@"animation"];
        [titleLabel setText:[self.dataArray objectAtIndex:countInt]];
    }];
    
    self.clipsToBounds = YES;
    
}
-(void)topNewsInfoClicked:(id)sender{
    
    if (self.ClickBlick) {
        self.ClickBlick(countInt);
    }
    
}

@end
