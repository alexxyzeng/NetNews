//
//  XYTabBarController.m
//  netNews
//
//  Created by xiayao on 16/3/24.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import "XYTabBarController.h"
#import "XYNavigationController.h"
#import "XYNewsViewController.h"
#import "XYBarController.h"
#import "XYReaderController.h"
#import "XYMediaController.h"
#import "XYMeController.h"
@implementation XYTabBarController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setUpAllViewControllers];
    [[UITabBarItem appearance] setTitleTextAttributes:@{NSForegroundColorAttributeName:navigationColor} forState:UIControlStateSelected];
}






- (void)setUpAllViewControllers
{
    XYNewsViewController *newsVc = [[XYNewsViewController alloc] init];
    [self setUpVierController:newsVc withImage:[UIImage originalImageWithImage:@"tabbar_icon_news_normal"] selectedImage:[UIImage originalImageWithImage:@"tabbar_icon_news_highlight"] title:@"新闻"];
    
    XYReaderController *readerVc = [[XYReaderController alloc] init];
    [self setUpVierController:readerVc withImage:[UIImage originalImageWithImage:@"tabbar_icon_reader_normal"] selectedImage:[UIImage originalImageWithImage:@"tabbar_icon_reader_highlight"] title:@"阅读"];
    
    XYMediaController *mediaVc = [[XYMediaController alloc] init];
    [self setUpVierController:mediaVc withImage:[UIImage originalImageWithImage:@"tabbar_icon_media_normal"] selectedImage:[UIImage originalImageWithImage:@"tabbar_icon_media_highlight"] title:@"视听"];
    
    XYBarController *bartVc = [[XYBarController alloc] init];
    [self setUpVierController:bartVc withImage:[UIImage originalImageWithImage:@"tabbar_icon_bar_normal"] selectedImage:[UIImage originalImageWithImage:@"tabbar_icon_bar_highlight"] title:@"话题"];
    
    XYMeController *meVc = [[XYMeController alloc] init];
    [self setUpVierController:meVc withImage:[UIImage originalImageWithImage:@"night_tabbar_icon_me_normal"] selectedImage:[UIImage originalImageWithImage:@"night_tabbar_icon_me_highlight"] title:@"我"];
    
}


- (void)setUpVierController:(UIViewController *)vc withImage:(UIImage *)image selectedImage:(UIImage *)selectedImage title:(NSString *)title
{
    vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:title image:image selectedImage:selectedImage];
    XYNavigationController *navVc = [[XYNavigationController alloc] initWithRootViewController:vc];
    [self addChildViewController:navVc];
    
}
@end
