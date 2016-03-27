//
//  UIImage+renderMode.m
//  美团
//
//  Created by xiayao on 16/3/23.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import "UIImage+renderMode.h"

@implementation UIImage (renderMode)
+ (instancetype)originalImageWithImage:(NSString *)imageStr
{
    UIImage *image = [UIImage imageNamed:imageStr];
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
