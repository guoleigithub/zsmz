//
//  UIButton+ColorButton.m
//  IDEXX
//
//  Created by MrChenMj on 16/1/3.
//  Copyright © 2016年 Yongle. All rights reserved.
//

#import "UIButton+ColorButton.h"

@implementation UIButton (ColorButton)
+ (id)buttonWithColor:(UIColor*)nomalColor selColor:(UIColor*)selColor
{
    UIButton *imgBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    
    if(nomalColor)
    {
        UIImage *nimage = [UIImage imageWithColor:nomalColor andSize:CGSizeMake(1, 1)];
        [imgBtn setBackgroundImage:nimage forState:UIControlStateNormal];
    }
    
    if(selColor)
    {
        UIImage *simage = [UIImage imageWithColor:selColor andSize:CGSizeMake(1, 1)];
        [imgBtn setBackgroundImage:simage forState:UIControlStateHighlighted];
        [imgBtn setBackgroundImage:simage forState:UIControlStateSelected];
        [imgBtn setBackgroundImage:simage forState:UIControlStateDisabled];
    }
    
    return imgBtn;
}


@end
