//
//  UIColor+UIColor_Hex.h
//  kao-ios
//
//  Created by kevinshen on 4/7/14.
//  Copyright (c) 2014 sinonetwork. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (UIColor_Hex)

//根据颜色码取得颜色对象
+ (UIColor *)colorWithHexString:(NSString *)stringToConvert;

+ (UIColor *)colorWithHexString:(NSString *)stringToConvert alpha:(CGFloat)alpha;
+(CGColorRef) getColorFromRed:(int)red Green:(int)green Blue:(int)blue Alpha:(int)alpha;
+(UIColor*)colorWithHexValue:(uint)hexValue andAlpha:(float)alpha;
+(UIColor*)colorWithHexString:(NSString *)hexString andAlpha:(float)alpha;
@end
