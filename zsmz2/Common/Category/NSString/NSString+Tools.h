//
//  NSString+Tools.h
//  小趣护士版
//
//  Created by MrChenMj on 16/4/26.
//  Copyright © 2016年 窦建斌. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Tools)
// 获取文本高度
- (CGSize)textSizeWithFont:(UIFont *)font;
// 多行文本获取高度
- (CGSize)multilineTextSizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize;
//
-(NSString*)cacheFilePath;

- (CGSize)sizeWithFont:(UIFont *)font;

- (CGSize)sizeWithFont:(UIFont *)font
              forWidth:(CGFloat)width
         lineBreakMode:(NSLineBreakMode)lineBreakMode;

- (CGSize)sizeWithFont:(UIFont *)font
     constrainedToSize:(CGSize)constrainedToSize;

- (CGSize)sizeWithFont:(UIFont *)font
     constrainedToSize:(CGSize)constrainedToSize
         lineBreakMode:(NSLineBreakMode)lineBreakMode;
@end
