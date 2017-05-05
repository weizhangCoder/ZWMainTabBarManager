//
//  ZWMainTabBarManager.m
//  Pods
//
//  Created by zhangwei on 17/4/14.
//
//

#import "ZWMainTabBarManager.h"
#import "ZWTabBarController.h"
#import "ZWTabBar.h"
#import "ZWNavBar.h"

@implementation ZWMainTabBarManager

+ (UITabBarController *)rootTabBarController{
    return [ZWTabBarController shareInstance];
}


+ (void)addChildVC:(UIViewController *)vc normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired{
    
    [[ZWTabBarController shareInstance] addChildVC:vc normalImageName:normalImageName selectedImageName:selectedImageName isRequiredNavController:isRequired];
    
}



/**
 *  设置全局的导航栏背景图片
 *
 *  @param globalImg 全局导航栏背景图片
 */
+ (void)setNavBarGlobalBackGroundImage:(UIImage *)globalImg {
    [ZWNavBar setGlobalBackGroundImage:globalImg];
}
/**
 *  设置全局导航栏标题颜色, 和文字大小
 *
 *  @param globalTextColor 全局导航栏标题颜色
 *  @param fontSize        全局导航栏文字大小
 */
+ (void)setNavBarGlobalTextColor:(UIColor *)globalTextColor andFontSize: (CGFloat)fontSize {
    
    [ZWNavBar setGlobalTextColor:globalTextColor andFontSize:fontSize];
    
}

+ (void)setTarBarGlobalBackGroundImage:(UIImage *)globalImg{
    ZWTabBar *tabBarBackImage = (ZWTabBar *)[[ZWTabBarController shareInstance] tabBar];
    tabBarBackImage.backgroundImage = globalImg;
}
@end
