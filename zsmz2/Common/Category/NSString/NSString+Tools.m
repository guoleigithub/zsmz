//
//  NSString+Tools.m
//  小趣护士版
//
//  Created by MrChenMj on 16/4/26.
//  Copyright © 2016年 窦建斌. All rights reserved.
//

#import "NSString+Tools.h"

@implementation NSString (Tools)
- (CGSize)textSizeWithFont:(UIFont *)font
{
    return [self sizeWithAttributes:@{NSFontAttributeName:font}];
}

- (CGSize)multilineTextSizeWithFont:(UIFont *)font andMaxSize:(CGSize)maxSize
{
    return [self boundingRectWithSize:maxSize
                              options:(NSStringDrawingUsesLineFragmentOrigin)
                           attributes:@{NSFontAttributeName:font}
                              context:nil].size;
}
-(NSString*)cacheFilePath{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *filePath = [path stringByAppendingPathComponent:self];
    return filePath;
}
- (CGSize)sizeWithFont:(UIFont *)font
{
    return [self sizeWithAttributes:@{NSFontAttributeName:font}];
}

- (CGSize)sizeWithFont:(UIFont *)font
              forWidth:(CGFloat)width
         lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    return [self sizeWithFont:font
            constrainedToSize:CGSizeMake(width, FLT_MAX)
                lineBreakMode:lineBreakMode];
}

- (CGSize)sizeWithFont:(UIFont *)font
     constrainedToSize:(CGSize)constrainedToSize
{
    return [self sizeWithFont:font
            constrainedToSize:constrainedToSize
                lineBreakMode:NSLineBreakByCharWrapping];
}

- (CGSize)sizeWithFont:(UIFont *)font
     constrainedToSize:(CGSize)constrainedToSize
         lineBreakMode:(NSLineBreakMode)lineBreakMode
{
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = lineBreakMode;
    paragraphStyle.alignment = NSTextAlignmentLeft;
    
    NSDictionary *attributes = @{NSFontAttributeName:font, NSParagraphStyleAttributeName:paragraphStyle};
    
    CGRect rect = [self boundingRectWithSize:constrainedToSize
                                     options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                  attributes:attributes
                                     context:nil];
    return rect.size;
}
@end
