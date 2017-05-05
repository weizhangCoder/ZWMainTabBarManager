//
//  UIView+XMGNib.h
// 
//
//  Created by ZW on 16/6/22.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (XMGNib)


/**
 *  返回当前视图, 所处的控制器
 *
 *  @return 控制器
 */
- (UIViewController *)currentViewController;

+ (instancetype)viewFromXib;

@end
