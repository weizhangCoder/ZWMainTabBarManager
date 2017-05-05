//
//  UIFont+Extension.h
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/7/22.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIFont (Extension)
/**
 *  根据不同的设置返回不同的字体
 */
+ (UIFont *)fontWithDevice:(CGFloat)fontSize;
/**
 * 加粗
 */
+ (UIFont *)boldfontWithDevice:(CGFloat)fontSize;
@end
