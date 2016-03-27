//
//  UIBarButtonItem+button.h
//  美团
//
//  Created by xiayao on 16/3/23.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (button)
+ (instancetype)barButtonItemWithImage:(UIImage *)image
                      highlightedImage:(UIImage *)highlightedImage
                                target:(id)target
                                action:(SEL)action
                       forControlEvent:(UIControlEvents)controlEvent;
@end
