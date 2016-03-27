//
//  XYItemLabel.m
//  netNews
//
//  Created by xiayao on 16/3/26.
//  Copyright © 2016年 xiayao. All rights reserved.
//
#import "XYItemLabel.h"
@implementation XYItemLabel
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.textAlignment = NSTextAlignmentCenter;
        self.font = [UIFont systemFontOfSize:18];
        self.scale = 0.0;
        self.adjustsFontSizeToFitWidth = YES;
        self.backgroundColor = [UIColor clearColor];
        self.userInteractionEnabled = YES;

    }
    return self;
}

- (void)setScale:(CGFloat)scale
{
    _scale = scale;
    //根据 scale 调整颜色和大小
    self.textColor = RGBA(214 * scale, 39, 48, 1);
    CGFloat minScale = 0.8;
    CGFloat realScale = minScale + (1 - minScale) * scale;
    self.transform = CGAffineTransformMakeScale(realScale, realScale);
}

@end
