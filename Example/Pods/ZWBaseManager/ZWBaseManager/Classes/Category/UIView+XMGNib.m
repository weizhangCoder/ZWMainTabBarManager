//
//  UIView+XMGNib.m
//  
//
//  Created by ZW on 16/6/22.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import "UIView+XMGNib.h"

@implementation UIView (XMGNib)

- (UIViewController *)currentViewController
{
    
    for (UIView* next = [self superview]; next; next = next.superview) {
        UIResponder* nextResponder = [next nextResponder];
        if ([nextResponder isKindOfClass:[UIViewController class]]) {
            return (UIViewController*)nextResponder;
        }
    }
    return nil;
}

+ (instancetype)viewFromXib
{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass(self) owner:nil options:nil] lastObject];
}
@end
