//
//  Base.h
//  ZWLY-Parts
//
//  Created by zhangwei on 16/9/12.
//  Copyright © 2016年 JYall. All rights reserved.
//

#ifndef Base_h
#define Base_h



// 如果是调试模式(DEBUG 是调试模式下, 自带的宏)
#ifdef DEBUG
#define ZWLog(...) NSLog(__VA_ARGS__);
#else
#define ZWLog(...)
#endif

// 打印调用函数的宏
#define ZWLogFunc ZWLog(@"%s",__func__);



// 屏幕尺寸相关
#define kScreenBounds [[UIScreen mainScreen] bounds]
#define kScreenWidth [[UIScreen mainScreen] bounds].size.width
#define kScreenHeight [[UIScreen mainScreen] bounds].size.height

// 弱引用
#define kWeakSelf __weak typeof(self) weakSelf = self;

#endif /* Base_h */
