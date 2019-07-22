//
//  AdaptiveManager.m
//  LoveMath
//
//  Created by liuguojing on 15/4/15.
//  Copyright (c) 2015年 liuguojing. All rights reserved.
//

#import "AdaptiveManager.h"
#import <UIKit/UIKit.h>
#import <sys/utsname.h>


@implementation AdaptiveManager


+ (instancetype)shareAdaptiveManager
{
    static AdaptiveManager * manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
            manager = [[self alloc] init];
    });
    return manager;
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        if(kDScreenHeight > 480){
            _autoSizeScaleX = MIN(kDScreenWidth, kDScreenHeight)/320;
            _autoSizeScaleY = MAX(kDScreenHeight, kDScreenWidth)/568;
        }else{
            _autoSizeScaleX = 1.0;
            _autoSizeScaleY = 1.0;
        }
        NSLog(@"autoSizeScaleX is %f\n autoSizeScaleY is %f",_autoSizeScaleX,_autoSizeScaleY);
    }
    return self;
}

@end

@implementation UIFont (Adaptive)

+ (UIFont *)systemFontOfSize1:(CGFloat)fontSize
{
    return [UIFont systemFontOfSize:CGRectGetAdaptiveY(fontSize)];
}

+ (UIFont*)boldSystemFontOfSize1:(CGFloat)fontSize
{
    return [UIFont boldSystemFontOfSize:CGRectGetAdaptiveY(fontSize)];
}

+ (ScanSizeEnum)deviceType
{
    if (IS_IPAD) {
        return ScanSizeIpad;
    }
    
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine
                                            encoding:NSUTF8StringEncoding];
    //simulator
    if ([platform isEqualToString:@"i386"])          return ScanSizeUnknown;
    if ([platform isEqualToString:@"x86_64"])        return ScanSizeUnknown;
    
    //iPhone
    if ([platform isEqualToString:@"iPhone1,1"])     return ScanSizeIphone4;//IPhone_1G;
    if ([platform isEqualToString:@"iPhone1,2"])     return ScanSizeIphone4;//IPhone_3G;
    if ([platform isEqualToString:@"iPhone2,1"])     return ScanSizeIphone4;//IPhone_3GS;
    if ([platform isEqualToString:@"iPhone3,1"])     return ScanSizeIphone4;//IPhone_4;
    if ([platform isEqualToString:@"iPhone3,2"])     return ScanSizeIphone4;//IPhone_4;
    if ([platform isEqualToString:@"iPhone4,1"])     return ScanSizeIphone4;//IPhone_4s;
    if ([platform isEqualToString:@"iPhone5,1"])     return ScanSizeIphone5;//IPhone_5;
    if ([platform isEqualToString:@"iPhone5,2"])     return ScanSizeIphone5;//IPhone_5;
    if ([platform isEqualToString:@"iPhone5,3"])     return ScanSizeIphone5;//IPhone_5C;
    if ([platform isEqualToString:@"iPhone5,4"])     return ScanSizeIphone5;//IPhone_5C;
    if ([platform isEqualToString:@"iPhone6,1"])     return ScanSizeIphone5;//IPhone_5S;
    if ([platform isEqualToString:@"iPhone6,2"])     return ScanSizeIphone5;//IPhone_5S;
    if ([platform isEqualToString:@"iPhone7,1"])     return ScanSizeIphonePlus;//IPhone_6P;
    if ([platform isEqualToString:@"iPhone7,2"])     return ScanSizeIphone6;//IPhone_6;
    if ([platform isEqualToString:@"iPhone8,1"])     return ScanSizeIphone6;//IPhone_6s;
    if ([platform isEqualToString:@"iPhone8,2"])     return ScanSizeIphonePlus;//IPhone_6s_P;
    if ([platform isEqualToString:@"iPhone8,4"])     return ScanSizeIphone5;//IPhone_SE;
    if ([platform isEqualToString:@"iPhone9,1"])     return ScanSizeIphone6;//IPhone_7;
    if ([platform isEqualToString:@"iPhone9,3"])     return ScanSizeIphone6;//IPhone_7;
    if ([platform isEqualToString:@"iPhone9,2"])     return ScanSizeIphonePlus;//IPhone_7P;
    if ([platform isEqualToString:@"iPhone9,4"])     return ScanSizeIphonePlus;//IPhone_7P;
    if ([platform isEqualToString:@"iPhone10,1"])    return ScanSizeIphone6;//IPhone_8;
    if ([platform isEqualToString:@"iPhone10,4"])    return ScanSizeIphone6;//IPhone_8;
    if ([platform isEqualToString:@"iPhone10,2"])    return ScanSizeIphonePlus;//IPhone_8P;
    if ([platform isEqualToString:@"iPhone10,5"])    return ScanSizeIphonePlus;//IPhone_8P;
    if ([platform isEqualToString:@"iPhone10,3"])    return ScanSizeIphoneX;//IPhone_X;
    if ([platform isEqualToString:@"iPhone10,6"])    return ScanSizeIphoneX;//IPhone_X;
    
    return ScanSizeUnknown;
}

@end

