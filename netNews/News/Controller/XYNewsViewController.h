//
//  XYNewsViewController.h
//  netNews
//
//  Created by xiayao on 16/3/24.
//  Copyright © 2016年 xiayao. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XYNewsViewController : UIViewController
/**
 *  已选择的栏目数组
 */
@property (nonatomic, strong) NSMutableArray *selectedArr;
/**
 *  备选的栏目数组
 */
@property (nonatomic, strong) NSMutableArray *optionalArr;
@end
