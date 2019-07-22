//
//  UIButton+StyledButton.m
//  IDEXX
//
//  Created by MrChenMj on 15/12/30.
//  Copyright © 2015年 Yongle. All rights reserved.
//

#import "UIButton+StyledButton.h"

@implementation UIButton (StyledButton)
+ (UIButton *)styledButtonWithBackgroundImage:(UIImage *)image font:(UIFont *)font title:(NSString *)title target:(id)target selector:(SEL)selector
{
    CGSize textSize = [title sizeWithFont:font];
    CGSize buttonSize = CGSizeMake(textSize.width + 20.0f, image.size.width);
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(0.0f, 0.0f, buttonSize.width, buttonSize.height)];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitleColor:RGB(83, 182, 255) forState:UIControlStateHighlighted];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    
    return button;
}

+ (UIButton *)styledButtonWithFrame_X:(float)x And_Y:(float)y backgroundImage:(UIImage *)image font:(UIFont *)font title:(NSString *)title target:(id)target selector:(SEL)selector
{
    CGSize textSize = [title sizeWithFont:font];
    CGSize buttonSize = CGSizeMake(textSize.width + 20.0f, image.size.width);
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(x, y, buttonSize.width, buttonSize.height)];
    [button addTarget:target action:selector forControlEvents:UIControlEventTouchUpInside];
    [button setBackgroundImage:image forState:UIControlStateNormal];
    [button setTitle:title forState:UIControlStateNormal];
    [button.titleLabel setFont:font];
    
    return button;
    
}


+ (UIButton *)buttonFrame:(CGRect)frame andTarget:(id)target andAction:(SEL)action andTag:(int)tag andTitleColor:(UIColor*)color andImageName:(NSString *)strName
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    [button setBackgroundImage:[UIImage imageNamed:strName] forState:UIControlStateNormal];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.tag=tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}


+ (UIButton *)buttonFrame:(CGRect)frame andTarget:(id)target andAction:(SEL)action andTag:(int)tag andTitleColor:(UIColor*)color andNormalImageName:(NSString *)nmalStrName highlightImage:(NSString *)highlightImage
{
    UIButton *button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    //[button setBackgroundImage:[UIImage imageNamed:nmalStrName] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:nmalStrName]forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightImage] forState:UIControlStateHighlighted];
    [button setTitleColor:color forState:UIControlStateNormal];
    button.tag=tag;
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return button;
}

@end
