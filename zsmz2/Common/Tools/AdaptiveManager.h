//
//  AdaptiveManager.h
//  LoveMath
//
//  Created by liuguojing on 15/4/15.
//  Copyright (c) 2015年 liuguojing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIFont.h>

typedef enum : NSUInteger {
    ScanSizeUnknown,
    ScanSizeIphone4,
    ScanSizeIphone5,
    ScanSizeIphone6,
    ScanSizeIphonePlus,
    ScanSizeIphoneX,
    ScanSizeIpad,
} ScanSizeEnum;

@interface AdaptiveManager : NSObject

@property(nonatomic,assign)CGFloat autoSizeScaleX;
@property(nonatomic,assign)CGFloat autoSizeScaleY;
+ (instancetype)shareAdaptiveManager;

@end

@interface UIFont (Adaptive)

+ (UIFont*)systemFontOfSize1:(CGFloat)fontSize;
+ (UIFont*)boldSystemFontOfSize1:(CGFloat)fontSize;

+ (ScanSizeEnum)deviceType;

@end

CG_INLINE CGRect
CGRectMake1(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    CGRect rect;
    rect.origin.x = x * [AdaptiveManager shareAdaptiveManager].autoSizeScaleX; rect.origin.y = y * [AdaptiveManager shareAdaptiveManager].autoSizeScaleY;
    rect.size.width = width * [AdaptiveManager shareAdaptiveManager].autoSizeScaleX; rect.size.height = height * [AdaptiveManager shareAdaptiveManager].autoSizeScaleY;
    return rect;
}

//返回的size大小根据Y方向的比例而定...
CG_INLINE CGRect
CGRectMake2(CGFloat x, CGFloat y, CGFloat width, CGFloat height)
{
    CGRect rect;
    rect.origin.x = x * [AdaptiveManager shareAdaptiveManager].autoSizeScaleY; rect.origin.y = y * [AdaptiveManager shareAdaptiveManager].autoSizeScaleY;
    rect.size.width = width * [AdaptiveManager shareAdaptiveManager].autoSizeScaleY; rect.size.height = height * [AdaptiveManager shareAdaptiveManager].autoSizeScaleY;
    return rect;
}

CG_INLINE CGFloat
CGRectGetAdaptiveX(CGFloat x)
{
    CGFloat result = x * [AdaptiveManager shareAdaptiveManager].autoSizeScaleX;
    return roundf(result);
}
CG_INLINE CGFloat
CGRectGetAdaptiveY(CGFloat y)
{
    CGFloat result = y * [AdaptiveManager shareAdaptiveManager].autoSizeScaleY;
    return roundf(result);
}
