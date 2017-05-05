//
//  ZWTabBarController.m
//  testhead
//
//  Created by zhangwei on 17/3/24.
//  Copyright © 2017年 jyall. All rights reserved.
//

#import "ZWTabBarController.h"
#import "ZWTabBar.h"
#import "ZWNavigationController.h"
#import "UIImage+XMGImage.h"

@interface ZWTabBarController ()

@end



@implementation ZWTabBarController


+(instancetype)shareInstance{
    
    static ZWTabBarController *tabbar;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        tabbar = [[ZWTabBarController alloc]init];
    });
    return tabbar;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupTabbar];
    
   
}
- (void)setupTabbar{

    [self setValue:[[ZWTabBar alloc]init] forKey:@"tabBar"];
    
}

- (instancetype)tarBarControllerWithAddChildrenVCsBlock:(void(^)(ZWTabBarController *tababr))addVCBloc{
    
    ZWTabBarController *tabbar = [[ZWTabBarController alloc]init];
    if (addVCBloc) {
        addVCBloc(tabbar);
    }
    return tabbar;
}
/**
 *  根据参数, 创建并添加对应的子控制器
 *
 *  @param vc                需要添加的控制器(会自动包装导航控制器)
 *  @param isRequired             标题
 *  @param normalImageName   一般图片名称
 *  @param selectedImageName 选中图片名称
 */
- (void)addChildVC: (UIViewController *)vc normalImageName: (NSString *)normalImageName selectedImageName:(NSString *)selectedImageName isRequiredNavController: (BOOL)isRequired {
    
    if (isRequired) {
        ZWNavigationController *nav = [[ZWNavigationController alloc] initWithRootViewController:vc];
        nav.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage originImageWithName:normalImageName] selectedImage:[UIImage originImageWithName:selectedImageName]];
        
        [self addChildViewController:nav];
    }else {
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:nil image:[UIImage originImageWithName:normalImageName] selectedImage:[UIImage originImageWithName:selectedImageName]];
        [self addChildViewController:vc];
    }
    
}

- (UIImage *)originImageWithName: (NSString *)name {
    
    return [[UIImage imageNamed:name] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
