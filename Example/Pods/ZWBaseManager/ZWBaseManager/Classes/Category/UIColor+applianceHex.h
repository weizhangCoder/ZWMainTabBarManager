//
//  UIColor+applianceHex.h
//  张云杰
//
//  Created by mac on 16/3/13.
//  Copyright © 2016年 com.jyall. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (applianceHex)
/*
 *  输入6位数返回一个颜色值
 */
+ (UIColor *)colorFromHex:(NSString *)hex;
/*
 *  输入6位数和透明度返回一个颜色值
 */
+ (UIColor *)colorFromHex:(NSString *)hex alpha:(CGFloat)alpha;

@end
