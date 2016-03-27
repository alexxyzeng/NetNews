//
//  XYColumnCell.h
//  netNews
//
//  Created by xiayao on 16/3/24.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import <UIKit/UIKit.h>
@protocol DeleteDelegate <NSObject>

- (void)deleteItemAtIndexPath:(NSIndexPath *)indexPath;

@end

@interface XYColumnCell : UICollectionViewCell
@property (nonatomic, assign) id <DeleteDelegate> deleteDelegate;
/**
 *  栏目标签
 */
@property (nonatomic, weak)UILabel *contentLabel;
/**
 *  标签左上角删除按钮
 */
@property (nonatomic, weak)UIButton *deleteButton;
/**
 *  标签的 indexPath
 */
@property (nonatomic, strong)NSIndexPath *indexPath;

-(void)configCell:(NSArray *)dataArray withIndexPath:(NSIndexPath *)indexPath;
@end
