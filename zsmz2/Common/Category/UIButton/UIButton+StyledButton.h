//
//  UIButton+StyledButton.h
//  IDEXX
//
//  Created by MrChenMj on 15/12/30.
//  Copyright © 2015年 Yongle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIButton (StyledButton)
+ (UIButton *)styledButtonWithBackgroundImage:(UIImage *)image font:(UIFont *)font title:(NSString *)title target:(id)target selector:(SEL)selector;
+ (UIButton *)styledButtonWithFrame_X:(float)x And_Y:(float)y backgroundImage:(UIImage *)image font:(UIFont *)font title:(NSString *)title target:(id)target selector:(SEL)selector;

+ (UIButton *)buttonFrame:(CGRect)frame andTarget:(id)target andAction:(SEL)action andTag:(int)tag andTitleColor:(UIColor*)color andImageName:(NSString *)strName;
//高亮状态
+ (UIButton *)buttonFrame:(CGRect)frame andTarget:(id)target andAction:(SEL)action andTag:(int)tag andTitleColor:(UIColor*)color andNormalImageName:(NSString *)nmalStrName highlightImage:(NSString *)highlightImage;

@end
