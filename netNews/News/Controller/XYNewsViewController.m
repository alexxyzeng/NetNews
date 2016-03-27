//
//  XYNewsViewController.m
//  netNews
//
//  Created by xiayao on 16/3/24.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import "XYNewsViewController.h"
#import "XYColumnCell.h"
#import "XYItemScrollView.h"
#import "XYItemLabel.h"
@interface XYNewsViewController () <UICollectionViewDelegate, UICollectionViewDataSource, XYItemScrollViewDelegate>
/**
 *  所有栏目的集合视图
 */
@property (nonatomic, weak) UICollectionView *columnView;
/**
 *  顶部滚动条
 */
@property (nonatomic, weak) XYItemScrollView *itemScrollView;
/**
 *  <#Description#>
 */
@property (nonatomic, weak) UIButton *columnBtn;
/**
 *  新闻内容视图
 */
@property (nonatomic, weak) UITableView *contentView;
@property (nonatomic, weak) UIScrollView *contentScrollView;
@end


@implementation XYNewsViewController
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *array = @[@"新闻",@"房产",@"体育",@"中国足球",@"文化",@"历史",@"故事",@"汽车"];
    _selectedArr = [NSMutableArray arrayWithArray:array];
    _optionalArr = [NSMutableArray array];
    [self setUpNavBar];
    [self setUpItemScrollView];
    [self setUpColumnBtn];
    [self addChildViewController];
    [self setUpContentView];
}
#pragma mark 加载子视图
//导航条
- (void)setUpNavBar
{
//    UIBarButtonItem *left                  = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"top_navigation_back"] style:UIBarButtonItemStylePlain target:self action:@selector(mainNews:)];
//    self.navigationItem.leftBarButtonItem  = left;
    UIBarButtonItem *search                = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"top_navigation_square"] style:UIBarButtonItemStylePlain target:self action:@selector(search)];
    self.navigationItem.rightBarButtonItem = search;
    self.navigationItem.title              = @"网易";
}

- (void)search
{
    
}
//顶部 item 条
- (void)setUpItemScrollView
{
    XYItemScrollView *itemScrollView = [XYItemScrollView addAllItemFromItemArr:_selectedArr withFrame:CGRectMake(0, 64, SCREEN_SIZE.width - 60, 36)];
    CGRect frame = itemScrollView.frame;
    itemScrollView.contentSize = CGSizeMake(frame.size.width * 1.6, 0);
    itemScrollView.showsHorizontalScrollIndicator = NO;
    itemScrollView.itemDelegate = self;
    _itemScrollView = itemScrollView;
    //默认选中第一个 item
    XYItemLabel *firstLabel = [self.itemScrollView.subviews firstObject];
    firstLabel.scale = 1.0;
    [self.view addSubview:_itemScrollView];
    
}
//新闻内容视图
- (void)setUpContentView
{
    CGFloat contentX = self.childViewControllers.count * SCREEN_SIZE.width;
    UIScrollView *contentScrollView = [[UIScrollView alloc] init];
    contentScrollView.pagingEnabled = YES;
    contentScrollView.contentSize = CGSizeMake(contentX, 0);
    _contentScrollView = contentScrollView;
//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 100, SCREEN_SIZE.width, SCREEN_SIZE.height - 100) style:UITableViewStylePlain];
    UIViewController *firstVc = [self.childViewControllers firstObject];
    firstVc.view.frame = _contentScrollView.bounds;
    [_contentScrollView addSubview:firstVc.view];
    [self.view addSubview:_contentScrollView];
}
//子控制器
- (void)addChildViewController
{
    for (NSInteger i = 0; i < _selectedArr.count; i ++) {
        UIViewController *vc = [[UIViewController alloc] init];
        vc.title = (NSString *)_selectedArr[i];
        vc.view.backgroundColor = [UIColor colorWithRed:arc4random()/255 green:arc4random()/255 blue:arc4random()/255 alpha:1];
        [self addChildViewController:vc];
    }
}
//item 栏右侧按钮
- (void) setUpColumnBtn
{
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(SCREEN_SIZE.width - 60, 64, 60, 40)];
    [btn setImage:[UIImage imageNamed:@"night_top_navigation_plusicon"] forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:32];
    btn.titleLabel.textColor = [UIColor grayColor];
    btn.titleLabel.textAlignment = NSTextAlignmentCenter;
//    btn.backgroundColor = [UIColor blueColor];
    _columnBtn = btn;
    [self.view addSubview:_columnBtn];
    
}
// item 集合视图
- (void)setUpColumnView
{
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.scrollDirection = UICollectionViewScrollDirectionVertical;
    UICollectionView *columnView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 64, SCREEN_SIZE.width, SCREEN_SIZE.height - 64) collectionViewLayout:layout];
    columnView.delegate = self;
    columnView.dataSource = self;
    
    //注册 cell 和 header
    [columnView registerClass:[XYColumnCell class] forCellWithReuseIdentifier:@"cell"];
    _columnView = columnView;
    
    
    [self.view addSubview:_columnView];
}


//itemLabel 点击事件
- (void)didClick:(UITapGestureRecognizer *)recognizer
{
    XYItemLabel *itemLabel = (XYItemLabel *)recognizer.view;
    NSUInteger index = [self.itemScrollView.subviews indexOfObject:itemLabel];
    CGFloat offsetX = index * SCREEN_SIZE.width;
    CGFloat offsetY = 0;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    [self.contentScrollView setContentOffset:offset animated:YES];
}

- (void)itemScrollView:(XYItemScrollView *)itemScrollView didClick:(UITapGestureRecognizer *)tapGest
{
    XYItemLabel *itemLabel = (XYItemLabel *)tapGest.view;
    NSUInteger index = [self.itemScrollView.subviews indexOfObject:itemLabel];
    CGFloat offsetX = index * SCREEN_SIZE.width;
    CGFloat offsetY = 0;
    CGPoint offset = CGPointMake(offsetX, offsetY);
    [self.contentScrollView setContentOffset:offset animated:YES];
}

#pragma mark UIScrollView 代理方法
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    //通过绝对值来计算当前 item 的 index 和 scale
    CGFloat value = ABS(scrollView.contentOffset.x / scrollView.bounds.size.width);
    NSUInteger leftIndex = (NSUInteger)value;
    NSUInteger rightIndex = leftIndex + 1;
    CGFloat leftScale = value - leftIndex;
    CGFloat rightScale = 1 - leftScale;
    XYItemLabel *leftLabel = self.itemScrollView.subviews[leftIndex];
    leftLabel.scale =leftScale;
    if (rightIndex < self.contentScrollView.subviews.count) {
        XYItemLabel *rightLabel = self.itemScrollView.subviews[rightIndex];
        rightLabel.scale = rightScale;
    }
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    NSUInteger index = scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5;
    XYItemLabel *itemLabel = self.itemScrollView.subviews[index];
    if (index >= 2 &&
        index < _selectedArr.count) {
        CGFloat offsetX = itemLabel.bounds.origin.x * (index - 2);
        CGPoint offset = CGPointMake(offsetX, 0);
        [self.itemScrollView setContentOffset:offset animated:YES];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
@end
