//
//  UIImage+XMGImage.h
//  喜马拉雅FM
//
//  Created by ZW on 16/8/1.
//  Copyright © 2016年 ZW. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (XMGImage)

+ (UIImage *)originImageWithName: (NSString *)name;

- (UIImage *)circleImage;

//默认图片，全局都可以使用
+(UIImage *)produceNewImageWithSmallImage:(UIImage *)image smallImageSize:(CGSize)smallImageSize withOutSize:(CGSize)outSize;



@end
