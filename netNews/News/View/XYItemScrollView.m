//
//  XYColumnScrollView.m
//  netNews
//
//  Created by xiayao on 16/3/25.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import "XYItemScrollView.h"


@implementation XYItemScrollView

//添加新的 item
- (void)addItem:(XYItemLabel *)itemLabel
{
    NSInteger numOfSubViews = self.subviews.count;
    itemLabel.frame = CGRectMake(self.contentSize.width, 0, self.contentSize.width / numOfSubViews, self.contentSize.height);
    [self addSubview:itemLabel];
    
}
//移除已有的 item
- (void)removeItem:(XYItemLabel *)itemLabel
{
    //获取要移除的 item 的 index
    NSInteger index = [self.subviews indexOfObject:itemLabel];
    NSInteger numOfSubViews = self.subviews.count;
    for (NSInteger i = index + 1; i < numOfSubViews; i ++) {
        XYItemLabel *label = (XYItemLabel *)self.subviews[i];
        label.frame = CGRectOffset(label.frame, -1.0 * CGRectGetWidth(itemLabel.frame), 0);
    }
    [itemLabel removeFromSuperview];
    self.contentSize = CGSizeMake(CGRectGetWidth(itemLabel.bounds) * (numOfSubViews - 1), self.contentSize.height);
}

+ (instancetype)addAllItemFromItemArr:(NSArray *)itemArr withFrame:(CGRect)frame
{
    XYItemScrollView *itemScrollView = [[XYItemScrollView alloc] initWithFrame:frame];
    itemScrollView.directionalLockEnabled = YES;
    //添加所有的 item 到滚动条中
    for (NSInteger i = 0; i < 8; i ++) {
        CGFloat itemW = frame.size.width / 5;
        CGFloat itemH = frame.size.height;
        CGFloat itemX = itemW * i;
        CGFloat itemY = 0;
        XYItemLabel *itemLabel = [[XYItemLabel alloc] init];
        itemLabel.frame = CGRectMake(itemX, itemY, itemW, itemH);
        itemLabel.text = (NSString *)itemArr[i];
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(click:)];
        [itemScrollView addGestureRecognizer:tap];
        [itemScrollView addSubview:itemLabel];
    }
    
    return itemScrollView;
}

- (void)click:(UITapGestureRecognizer *)tapGest
{
    if ([self.itemDelegate respondsToSelector:@selector(itemScrollView:didClick:)]) {
        [self.itemDelegate itemScrollView:self didClick:tapGest];
        
    }
}
@end
