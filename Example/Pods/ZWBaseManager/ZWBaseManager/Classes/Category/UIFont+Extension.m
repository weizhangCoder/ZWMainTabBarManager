//
//  UIFont+Extension.m
//  JinSeJiaYuanWang
//
//  Created by zhangwei on 16/7/22.
//  Copyright © 2016年 JYall Network Technology Co.,Ltd. All rights reserved.
//

#import "UIFont+Extension.h"


@implementation UIFont (Extension)

+ (UIFont *)fontWithDevice:(CGFloat)fontSize {
    if ([[UIScreen mainScreen] bounds].size.width > 375) {
        fontSize = fontSize+1.0;
    }else if ([[UIScreen mainScreen] bounds].size.width == 375){
        fontSize = fontSize;
    }else if ([[UIScreen mainScreen] bounds].size.width == 320){
        fontSize = fontSize - 1;
    }
    
    UIFont *font = [UIFont systemFontOfSize:fontSize];
    return font;
}


+ (UIFont *)boldfontWithDevice:(CGFloat)fontSize {
    if ([[UIScreen mainScreen] bounds].size.width > 375) {
        fontSize = fontSize+1.5;
    }else if ([[UIScreen mainScreen] bounds].size.width == 375){
        fontSize = fontSize;
    }else if ([[UIScreen mainScreen] bounds].size.width == 320){
        fontSize = fontSize - 1;
    }
    UIFont *font = [UIFont boldSystemFontOfSize:fontSize];
    return font;
}
@end
