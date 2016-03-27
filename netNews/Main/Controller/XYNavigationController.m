//
//  XYNavigationController.m
//  netNews
//
//  Created by xiayao on 16/3/24.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import "XYNavigationController.h"

@implementation XYNavigationController
+ (void)initialize
{
    UITabBarItem *item = [UITabBarItem appearanceWhenContainedIn:self, nil];
    [item setTitleTextAttributes:@{NSForegroundColorAttributeName: [UIColor whiteColor]} forState:UIControlStateNormal];

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.navigationBar.barTintColor = navigationColor;
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage originalImageWithImage:@"top_navigation_back"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"top_navigation_more"] style:UIBarButtonItemStylePlain target:self action:@selector(more)];
}

//左按钮点击，跳转页面
- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)more
{
    
}
@end
