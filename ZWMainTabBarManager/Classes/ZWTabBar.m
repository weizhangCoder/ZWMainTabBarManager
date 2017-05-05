//
//  ZWTabBar.m
//  testhead
//
//  Created by zhangwei on 17/3/24.
//  Copyright © 2017年 jyall. All rights reserved.
//

#import "ZWTabBar.h"
#import "UIView+XMGLayout.h"
#import "UIImage+XMGImage.h"

@implementation ZWTabBar

// 这里可以做一些初始化设置
-(instancetype)initWithFrame:(CGRect)frame {
    if(self = [super initWithFrame:frame]) {
        [self setUpInit];
    }
    return self;
}

- (void)setUpInit {
    // 设置样式, 去除tabbar上面的黑线
    self.barStyle = UIBarStyleBlack;
    
    // 设置tabbar 背景图片
    NSBundle *containingBundle = [NSBundle bundleForClass:[self class]];
    NSString *bundleName = [containingBundle.infoDictionary[@"CFBundleName"] stringByAppendingString:@".bundle"];
    NSString *imagePath = [NSString stringWithFormat:@"%@@%@x.png", @"tabbar_bg", @([UIScreen mainScreen].scale)];
    
    NSString *path = [containingBundle pathForResource:imagePath ofType:nil inDirectory:bundleName];
    self.backgroundImage  = [UIImage imageWithContentsOfFile:path];
    
 
}




- (void)setTabBarBackgroundImage:(UIImage *)tabBarBackgroundImage{
    _tabBarBackgroundImage = tabBarBackgroundImage;
    self.backgroundImage = tabBarBackgroundImage;
}
-(void)layoutSubviews {
    [super layoutSubviews];
    
    // 将中间按钮, 移动到顶部
    //    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    //    [window.rootViewController.view bringSubviewToFront:self.middleBtn];
    
    
    NSInteger count = self.items.count;
    
    // 1. 遍历所有的子控件
    NSArray *subViews = self.subviews;
    
    // 确定单个控件的大小
    CGFloat btnW = self.width / (count);
    CGFloat btnH = self.height;
    CGFloat btnY = 5;
    
    NSInteger index = 0;
    for (UIView *subView in subViews) {
        if ([subView isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
           
            CGFloat btnX = index * btnW;
            subView.frame = CGRectMake(btnX, btnY, btnW, btnH);
            
            index ++;
        }
    }
    

    
}


@end
