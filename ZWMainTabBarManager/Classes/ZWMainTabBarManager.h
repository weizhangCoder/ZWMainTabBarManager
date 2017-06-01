//
//  ZWMainTabBarManager.h
//  Pods
//
//  Created by zhangwei on 17/4/14.
//
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface ZWMainTabBarManager : NSObject
/**
 获取根控制器
 
 @return rootTabBarCcontroller
 */
+ (UITabBarController *)rootTabBarController;

/**
 添加子控制器
 
 @param vc                子控制器
 @param normalImageName   普通状态下图片
 @param selectedImageName 选中图片
 @param isRequired        是否需要包装导航控制器
 */
+ (void)addChildVC:(UIViewController *)vc normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController:(BOOL)isRequired;


+ (void)addChildVC:(NSArray *)param;
/**
 *  设置全局的导航栏背景图片
 *
 *  @param globalImg 全局导航栏背景图片
 */
+ (void)setNavBarGlobalBackGroundImage:(UIImage *)globalImg;
/**
 *  设置全局导航栏标题颜色, 和文字大小
 *
 *  @param globalTextColor 全局导航栏标题颜色
 *  @param fontSize        全局导航栏文字大小
 */
+ (void)setNavBarGlobalTextColor:(UIColor *)globalTextColor andFontSize:(CGFloat)fontSize;

/**
 *  设置tabbar背景图片
 *
 *  @param globalImg
 */
+ (void)setTarBarGlobalBackGroundImage:(UIImage *)globalImg;

@end
