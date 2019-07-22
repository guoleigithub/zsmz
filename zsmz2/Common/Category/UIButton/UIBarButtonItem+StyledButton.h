//
//  UIBarButtonItem+StyledButton.h
//  IDEXX
//
//  Created by MrChenMj on 15/12/30.
//  Copyright © 2015年 Yongle. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (StyledButton)
+ (UIBarButtonItem *)styledBackBarButtonItemWithTarget:(id)target selector:(SEL)selector;
+ (UIBarButtonItem *)styledCancelBarButtonItemWithTarget:(id)target selector:(SEL)selector;
+ (UIBarButtonItem *)styledSubmitBarButtonItemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target selector:(SEL)selector;
+ (UIBarButtonItem *)styledSubmitBarButtonItemTarget:(id)target selector:(SEL)selector;
+ (UIBarButtonItem *)styledSNWBackBarButtonItemTarget:(id)target selector:(SEL)selector;
+ (UIBarButtonItem *)styledSNWDismissBarButtonItemTarget:(id)target selector:(SEL)selector;
+ (UIBarButtonItem *)styledCustomBarButtonItemByFrame:(CGRect)frame  image:(NSString *)image hightImage:(NSString *)hightImage target:(id)target selector:(SEL)selector;
+ (UIBarButtonItem *)barButtonitemWithNormalImageName:(NSString *)normalImageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action;

@end
