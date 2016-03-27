//
//  XYColumnScrollView.h
//  netNews
//
//  Created by xiayao on 16/3/25.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "XYItemLabel.h"
@class XYItemScrollView;
@protocol XYItemScrollViewDelegate <NSObject>

- (void)itemScrollView:(XYItemScrollView *)itemScrollView didClick:(UITapGestureRecognizer *)tapGest;

@end

@interface XYItemScrollView : UIScrollView
@property (nonatomic, weak) id <XYItemScrollViewDelegate> itemDelegate;
/**
 *  在指定位置添加 itemLabel
 *
 *  @param itemLabel  栏目标题 item
 *  @param index     item 的位置
 */
- (void)addItem:(XYItemLabel *)itemLabel;
/**
 *  移除指定位置的 itemLabel
 *
 *  @param itemLabel  栏目标题 item
 *  @param index     item 的位置
 */
- (void)removeItem:(XYItemLabel *)itemLabel;
/**
 *  添加所有的 item
 *
 *  @param itemArr  包含 item 名称的数组
 *
 *  @return 返回一个加载所有 item 的 itemScrollView
 */
+ (instancetype)addAllItemFromItemArr:(NSArray *)itemArr withFrame:(CGRect)frame;
@end
