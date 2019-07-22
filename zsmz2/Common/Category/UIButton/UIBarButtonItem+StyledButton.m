//
//  UIBarButtonItem+StyledButton.m
//  IDEXX
//
//  Created by MrChenMj on 15/12/30.
//  Copyright © 2015年 Yongle. All rights reserved.
//

#import "UIBarButtonItem+StyledButton.h"
#import "UIButton+StyledButton.h"

@implementation UIBarButtonItem (StyledButton)
+ (UIBarButtonItem *)styledBackBarButtonItemWithTarget:(id)target selector:(SEL)selector;
{
    UIImage *image = [UIImage imageNamed:@"itle_back"];
    image = [image stretchableImageWithLeftCapWidth:20.0f topCapHeight:20.0f];
    
    NSString *title = NSLocalizedString(@"Back", nil);
    UIFont *font = [UIFont boldSystemFontOfSize:12.0f];
    
    UIButton *button = [UIButton styledButtonWithBackgroundImage:image font:font title:title target:target selector:selector];
    button.titleLabel.textColor = [UIColor blackColor];
    
    CGSize textSize = [title sizeWithFont:font];
    CGFloat margin = (button.frame.size.height - textSize.height) / 2;
    CGFloat marginRight = 7.0f;
    CGFloat marginLeft = button.frame.size.width - textSize.width - marginRight;
    [button setTitleEdgeInsets:UIEdgeInsetsMake(margin, marginLeft, margin, marginRight)];
    [button setTitleColor:[UIColor colorWithRed:53.0f/255.0f green:77.0f/255.0f blue:99.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)styledCancelBarButtonItemWithTarget:(id)target selector:(SEL)selector;
{
    UIImage *image = [UIImage imageNamed:@"button_square"];
    image = [image stretchableImageWithLeftCapWidth:20.0f topCapHeight:20.0f];
    
    NSString *title = NSLocalizedString(@"Cancel", nil);
    UIFont *font = [UIFont boldSystemFontOfSize:12.0f];
    
    UIButton *button = [UIButton styledButtonWithBackgroundImage:image font:font title:title target:target selector:selector];
    button.titleLabel.textColor = [UIColor blackColor];
    [button setTitleColor:[UIColor colorWithRed:53.0f/255.0f green:77.0f/255.0f blue:99.0f/255.0f alpha:1.0f] forState:UIControlStateNormal];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
//
+ (UIBarButtonItem *)styledSubmitBarButtonItemWithTitle:(NSString *)title titleColor:(UIColor *)titleColor target:(id)target selector:(SEL)selector;
{
    UIImage *image = [UIImage imageNamed:@"button_submit"];
    image = [image stretchableImageWithLeftCapWidth:20.0f topCapHeight:20.0f];
    
    UIFont *font = [UIFont systemFontOfSize:12.0f];
    
    UIButton *button = [UIButton styledButtonWithBackgroundImage:image font:font title:title target:target selector:selector];
    button.titleLabel.textColor = titleColor;
    [button setTitleColor: titleColor forState:UIControlStateNormal];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}



+ (UIBarButtonItem *)styledSubmitBarButtonItemTarget:(id)target selector:(SEL)selector;
{
    
    UIButton *button=[UIButton buttonFrame:CGRectMake(0, 0, 35, 35) andTarget:target andAction:selector andTag:0 andTitleColor:nil andNormalImageName:@"main_title_slidingmenu_left_normal.png" highlightImage:@"main_title_slidingmenu_left_pressed.png"];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


+ (UIBarButtonItem *)styledSNWBackBarButtonItemTarget:(id)target selector:(SEL)selector;
{
    
    UIButton *button=[UIButton buttonFrame:CGRectMake(0, 0, 18/2, 32/2) andTarget:target andAction:selector andTag:0 andTitleColor:nil andNormalImageName:@"arrow_back_btn1.png" highlightImage:@"arrow_back_pre_btn1.png"];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
+ (UIBarButtonItem *)styledSNWDismissBarButtonItemTarget:(id)target selector:(SEL)selector;
{
    
    UIButton *button=[UIButton buttonFrame:CGRectMake(0, 0, 35, 35) andTarget:target andAction:selector andTag:0 andTitleColor:nil andNormalImageName:@"btn_dismissItem.png" highlightImage:@"btn_dismissItem_highlighted.png"];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}


+ (UIBarButtonItem *)styledCustomBarButtonItemByFrame:(CGRect)frame  image:(NSString *)image hightImage:(NSString *)hightImage target:(id)target selector:(SEL)selector;
{
    
    UIButton *button=[UIButton buttonFrame:frame andTarget:target andAction:selector andTag:0 andTitleColor:nil andNormalImageName:image highlightImage:hightImage];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}

+ (UIBarButtonItem *)barButtonitemWithNormalImageName:(NSString *)normalImageName highlightedImageName:(NSString *)highlightedImageName target:(id)target action:(SEL)action{
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    
    [button setImage:normalImage forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:highlightedImageName] forState:UIControlStateHighlighted];
    button.bounds = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return  [[UIBarButtonItem alloc] initWithCustomView:button];
}




@end
