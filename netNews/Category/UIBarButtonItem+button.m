//
//  UIBarButtonItem+button.m
//  美团
//
//  Created by xiayao on 16/3/23.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import "UIBarButtonItem+button.h"

@implementation UIBarButtonItem (button)
+ (instancetype)barButtonItemWithImage:(UIImage *)image
                      highlightedImage:(UIImage *)highlightedImage
                                target:(id)target
                                action:(SEL)action
                       forControlEvent:(UIControlEvents)controlEvent
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:highlightedImage forState:UIControlStateHighlighted];
    [btn addTarget:target action:action forControlEvents:controlEvent];
    [btn sizeToFit];
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}
@end
