//
//  XYColumnCell.m
//  netNews
//
//  Created by xiayao on 16/3/24.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import "XYColumnCell.h"

@implementation XYColumnCell
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        //设置所有的子视图
        [self setUpSubViews];
        self.contentView.backgroundColor = [UIColor clearColor];
    }
    return self;
}

- (void)setUpSubViews
{
    //栏目标签
    [self setUpContentLabel];
    //左上角删除按钮
    [self setUpDeleteBtn];
}
//标签
- (void)setUpContentLabel
{
    UILabel *contentLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.contentView.frame.size.width, self.contentView.bounds.size.height)];
    contentLabel.center = self.contentView.center;
    contentLabel.font = [UIFont systemFontOfSize:15];
    contentLabel.textAlignment = NSTextAlignmentCenter;
    contentLabel.numberOfLines = 1;
    contentLabel.adjustsFontSizeToFitWidth = YES;
    contentLabel.minimumScaleFactor = 0.1;
    _contentLabel = contentLabel;
    [self.contentView addSubview:_contentLabel];
}
//删除按钮
- (void)setUpDeleteBtn
{
    UIButton *delBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 10, 10)];
    [delBtn setBackgroundImage:[UIImage imageNamed:@"delete"] forState:UIControlStateNormal];
    [delBtn addTarget:self action:@selector(deleteAction:) forControlEvents:UIControlEventTouchUpInside];
    _deleteButton = delBtn;
    [self.contentView addSubview:_deleteButton];
}

- (void)deleteCellAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.deleteDelegate respondsToSelector:@selector(deleteItemAtIndexPath:)]) {
        [self.deleteDelegate deleteItemAtIndexPath:indexPath];
    }
}
- (void)configCell:(NSArray *)dataArray withIndexPath:(NSIndexPath *)indexPath
{
    self.indexPath = indexPath;
    _contentLabel.hidden = NO;
    _contentLabel.text = dataArray[indexPath.row];
    if (indexPath.section == 0 &&
        indexPath.row == 0) {
        _contentLabel.textColor = navigationColor;
    } else {
        _contentLabel.textColor = RGBA(101, 101, 101, 1);
        _contentLabel.layer.masksToBounds = YES;
        _contentLabel.layer.cornerRadius = CGRectGetHeight(self.contentView.bounds) * 0.5;
        _contentLabel.layer.borderWidth = 0.45;
    }
}

- (void)deleteAction:(UIButton *)btn
{
    
}
@end
