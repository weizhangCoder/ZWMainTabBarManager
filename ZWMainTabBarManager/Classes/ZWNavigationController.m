//
//  ZWNavigationController.m
//  testhead
//
//  Created by zhangwei on 17/3/24.
//  Copyright © 2017年 jyall. All rights reserved.
//

#import "ZWNavigationController.h"
#import "ZWNavBar.h"



@interface ZWNavigationController ()<UIGestureRecognizerDelegate>

@end

@implementation ZWNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController{
    if (self = [super initWithRootViewController:rootViewController]) {
        [self setValue:[[ZWNavBar alloc]init] forKey:@"navigationBar"];
    }
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIGestureRecognizer *gester = self.interactivePopGestureRecognizer;
    
    UIPanGestureRecognizer *panGester = [[UIPanGestureRecognizer alloc]initWithTarget:gester.delegate action:NSSelectorFromString(@"handleNavigationTransition")];
    [gester.view addGestureRecognizer:panGester];
    gester.delaysTouchesBegan = YES;
    panGester.delegate = self;

}
#pragma mark - UIGestureRecognizerDelegate

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    // 如果根控制器也要返回手势有效, 就会造成假死状态
    // 所以, 需要过滤根控制器
    if(self.childViewControllers.count == 1) {
        return NO;
    }
    
    return YES;
    
}
- (void)back {
    
    [self popViewControllerAnimated:YES];
    
}

/**
 *  当控制器, 拿到导航控制器(需要是这个子类), 进行压栈时, 都会调用这个方法
 *
 *  @param viewController 要压栈的控制器
 *  @param animated       动画
 */
-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    // 拦截每一个push的控制器, 进行统一设置
    // 过滤第一个根控制器
    if (self.childViewControllers.count > 0) {

        NSBundle *containingBundle = [NSBundle bundleForClass:[self class]];
        NSString *bundleName = [containingBundle.infoDictionary[@"CFBundleName"] stringByAppendingString:@".bundle"];
        NSString *imagePath = [NSString stringWithFormat:@"%@@%@x.png", @"btn_back_n", @([UIScreen mainScreen].scale)];
        
        NSString *path = [containingBundle pathForResource:imagePath ofType:nil inDirectory:bundleName];
        //统一设置返回按钮
        viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage  imageWithContentsOfFile:path] style:0 target:self action:@selector(back)];
        viewController.hidesBottomBarWhenPushed = YES;
    }
    
    // 千万不要忘记写
    [super pushViewController:viewController animated:animated];
    
//    if (viewController.view.tag == 666) {
//        viewController.view.tag = 888;
//        XMGMiddleView *middleView = [XMGMiddleView middleView];
//        
//        middleView.middleClickBlock = [XMGMiddleView shareInstance].middleClickBlock;
//        middleView.isPlaying = [XMGMiddleView shareInstance].isPlaying;
//        middleView.middleImg = [XMGMiddleView shareInstance].middleImg;
//        
//        CGRect frame = middleView.frame;
//        frame.size.width = 65;
//        frame.size.height = 65;
//        CGSize screenSize = [UIScreen mainScreen].bounds.size;
//        frame.origin.x = (screenSize.width - 65) * 0.5;
//        frame.origin.y = screenSize.height - 65;
//        middleView.frame = frame;
//        [viewController.view addSubview:middleView];
//        
//    }
//    
    
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
