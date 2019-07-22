//
//  UIImage+BtnImage.h
//  NCLStore
//
//  Created by MrChenMj on 16/8/12.
//  Copyright © 2016年 Yongle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (BtnImage)
- (UIImage*)transformWidth:(CGFloat)width
                    height:(CGFloat)height;
- (UIImage*)imageRotatedByDegrees:(CGFloat)degrees;
/**
 *  剪切图片为正方形
 *
 *  @param image   原始图片比如size大小为(400x200)pixels
 *  @param newSize 正方形的size比如400pixels
 *
 *  @return 返回正方形图片(400x400)pixels
 */
- (UIImage *)squareImageFromImage:(UIImage *)image scaledToSize:(CGFloat)newSize;
- (UIImage*)imageCompressWithSimple:(UIImage*)image scaledToSize:(CGSize)size;
@end
