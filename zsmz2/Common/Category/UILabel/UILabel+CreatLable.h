//
//  UILabel+CreatLable.h
//  sinonetwork
//
//  Created by sinonetwork mac on 14-7-30.
//  Copyright (c) 2014年 sinonetwork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (CreatLable)
+(UILabel *)creatLabelWithFrame:(CGRect)frame title:(NSString *)title font:(UIFont *)font andTextColor:(UIColor *)textColor bgColor:(UIColor *)bgColor;
+(UILabel *)getLabel:(CGRect )rect bgColor:(UIColor* )bgColor txt:(NSString* )aTxt txtColor:(UIColor* )txtColor txtFont:(UIFont* )font;
+ (float)getLabelHight:(NSString* )aTxt font:(UIFont* )afont width:(float )aWidth;
- (void)setText:(NSString*)text lineSpacing:(CGFloat)lineSpacing;
- (void)setText:(NSString*)text text1:(NSString*)text1 color:(UIColor *)color fontN:(CGFloat)fontN;
- (void)setHText:(NSString*)text text1:(NSString*)text1 color:(UIColor *)color fontN:(CGFloat)fontN;
- (void)setH2Text:(NSString*)text text1:(NSString*)text1 color:(UIColor *)color fontN:(CGFloat)fontN;
@end
