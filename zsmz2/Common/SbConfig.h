//
//  SbConfig.h
//  XbClientApp
//
//  Created by MrChenMj on 2017/5/16.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#ifndef SbConfig_h
#define SbConfig_h
#import "RACEXTScope.h"
#import "RACmetamacros.h"
#import "CategoryUtils.h"
#import "WCAlertView.h"

//主黄色
#define kMainColor RGB(6, 164, 255)
//主灰色
#define kMainDark RGB(247, 246, 242)


/************************ 全局 主题  ****************************/
//背景色
//主颜色
#define kPinkColorR      (RGBCOLOR(238, 64, 64))//(RGBCOLOR(226, 15, 119))
#define kPinkColorW      (RGBCOLOR(255, 255, 255))
#define kNCL_NoDataColor    (RGBCOLOR(126, 56, 18))
#define KLineColor          (RGBCOLOR(234, 234, 234))
//高度
#define TopToolsView_H 41*Psix_w
#define HeadStatus_h 36*Psix_H
#define HeadT_H 125*Psix_H
#define Line_H  1.0f
#define MAX_TIMEREMAININGI 120
#define InfoList_H  44*Psix_H


//苹方 简 细体
#define kPingFang_JianXi        IOS9_OR_LATER ?@"PingFangSC-Light":@"STHeitiSC-Light"
//透明值
#define AlphaColor 0.34f

#define BannerBgNull @"bannerBgNull"
///
#define LogineErrorNoti @"LogineErrorNoti"
#define ScreeningSuccessfulNoti @"ScreeningSuccessfulNoti"
#define BuyVIPSuccssNoti @"BuyVIPSuccssNoti"
#define RootNavigation (UINavigationController *)[[UIApplication sharedApplication] delegate].window.rootViewController

/************************ 全局 frame 相关//适配 ****************************/

#define kToolBarHeight          49.0f
//#define kTabBarHeight           49.0f
#define kNavigationBarHeight    (IOS7_OR_LATER ? 64.f :44.0f)
#define kStatusBarHeight        (IOS7_OR_LATER ? 0.f :20.0f)
#define kKeyboardViewHeight     216.0f
//statusBar,navBar和tabBar高度
#define StatusBarHeight         20
#define kAppDelegate            ((AppDelegate *)[UIApplication sharedApplication].delegate)
#define TotalStatusBarHeight    CGRectGetHeight([[UIApplication sharedApplication] statusBarFrame])//statusBar总和高度,包括个人热点栏,20或40
#define NavBarHeight            44
//临时代替，首次进入高度获取不对，有更好的方法可以替换
#define TabBarHeight            (IS_IPhoneX?83:49)
#define NAVTOPEDGE              ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0 ? 64.0 :44.0)
#define TOPEDGE                 ([[UIDevice currentDevice].systemVersion floatValue] >= 7.0 ? 20.0 : 0.0)
//根据字体宽度返回size
#define textSizeWithFont(text, font) [text length] > 0 ? [text textSizeWithFont:font] : CGSizeZero;
#define multilineTextSize(text, font, maxSize) [text length] > 0 ? [text multilineTextSizeWithFont:font andMaxSize:maxSize] : CGSizeZero;
/***********************************************/


/********************** iPhone设备+系统 *************************/
//图片比例  320  200
#define IOS5_OR_LATER   ([[UIDevice currentDevice] systemVersion].floatValue>=5.0)
#define IOS6_OR_LATER   SYSTEM_VERSION<7.0
#define IOS7_OR_LATER   ([[UIDevice currentDevice] systemVersion].floatValue>=7.0)
#define IOS8_OR_LATER   ([[UIDevice currentDevice] systemVersion].floatValue>=8.0)
#define IOS9_OR_LATER   ([[UIDevice currentDevice] systemVersion].floatValue>=9.0)
#define IOS10_OR_LATER  ([[UIDevice currentDevice] systemVersion].floatValue>=10.0)
//判断设备
#define IS_IPHONE4      (([[UIScreen mainScreen] bounds].size.height - 480) ? NO : YES)
#define IS_IPHONE5      (([[UIScreen mainScreen] bounds].size.height - 568) ? NO : YES)
#define IS_IPHONE6      (([[UIScreen mainScreen] bounds].size.height - 667) ? NO : YES)
#define IS_IPHONE6PLAS  (([[UIScreen mainScreen] bounds].size.height - 736) ? NO : YES)
#define IS_IPhoneX      (([[UIScreen mainScreen] bounds].size.height - 812) ? NO : YES)
#define IS_IPAD         (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad ? YES : NO)
//系统版本
#define FULL_HEIGHT       (ScreenH - ((floor(NSFoundationVersionNumber) >= 7) ? 0 : STATUSBAR_HEIGHT))
#define IOS_Ver           [[[UIDevice currentDevice] systemVersion] floatValue]
#define Vedition          [NSString stringWithFormat:@"V%@", [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]]
#define IOS_7             [[[UIDevice currentDevice] systemVersion] floatValue]>=7.0?YES:NO
#define IsIOS7            ([[UIDevice currentDevice] systemVersion].floatValue>=7.0)
#define kSystemVersion    ([[UIDevice currentDevice] systemVersion].intValue)
#define CurrentOSVersion  [UIDevice currentDevice].systemVersion
#define kdeviceid         ([OpenUDID value])
#define kBuildVersion     ([[[NSBundle mainBundle] infoDictionary] objectForKey:(NSString *) kCFBundleVersionKey])
#define kAppVersion       ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"])
#define kdevicemodel      ([[UIDevice currentDevice] model])
#define SYSTEM_VERSION    [[UIDevice currentDevice].systemVersion floatValue]

/********************************/

//图片加载
#define LOCAL_IMG(img)   [UIImage imageNamed:img]
#define ImageFromResource(x) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:x ofType:nil]]
//读取本地图片
#define IMAGECONTENTFILE(A) [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:A ofType:nil]]
//本地图标赋值简写
#define IMAGE(name) [UIImage imageNamed:[NSString stringWithFormat:@"%@.png",name]]

/*********/
//颜色RGB
#define COLOR_RGB(r,g,b)   [UIColor colorWithRed:(r/255.0f) green:(g/255.0f) blue:(b/255.0f) alpha:1]
#define RGBA(r,g,b,a)      [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:a]
#define RGB(r,g,b)         RGBA(r,g,b,1)
#define COLOR(R,G,B,A)     [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:A]
#define RGBCOLOR(r,g,b)    [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:1]
#define RGBACOLOR(r,g,b,a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
// rgb颜色转换（16进制->10进制）
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
/***********************************/

//字体类型
/* 根据size生成字体Font */
#if __IPHONE_OS_VERSION_MIN_REQUIRED >= 70000
#define MB_TEXTSIZE(text, font) [text length] > 0 ? [text \
sizeWithAttributes:@{NSFontAttributeName:font}] : CGSizeZero;
#else
#define MB_TEXTSIZE(text, font) [text length] > 0 ? [text sizeWithFont:font] : CGSizeZero;
#endif
//设置字体的简写helvetica-light
#define FONT(size) [UIFont systemFontOfSize:size*Psix_H]
#define kFont(s)    ([UIFont fontWithName:@"HelveticaNeue-Light" size:s*Psix_H])
#define kBFont(s)   ([UIFont fontWithName:@"HelveticaNeue-Bold" size:s*Psix_H])
#define kNFont(s)   ([UIFont fontWithName:@"HelveticaNeue" size:s*Psix_H])
#define kSysFont(s) ([UIFont systemFontOfSize:s*Psix_H])
#define SysFont(f)  [UIFont systemFontOfSize:f*Psix_H]
#define BoldFont(f) [UIFont boldSystemFontOfSize:f*Psix_H]
//设置粗体字体
#define FONT_BOLD(size) [UIFont boldSystemFontOfSize:size*Psix_H]
//系统字体大小
#define SYS_FONT_SIZE(L) L.font.pointSize
//计算字号
#define kFontSize(size)         (size*Psix_H)
//苹方 字体
#define kFontStyle(fontName,fontSize) [UIFont fontWithName:fontName size:kFontSize(fontSize)]

/***********************************/
/********************** 打印Log *************************/
/**
 *1- Debug 模式. 0-Release 模式*
 **/

#define Debug 1

#define LMH_Debug Debug

#if LMH_Debug
#define LMHLog(fmt, ...) NSLog((@"%s [Line %zi] " fmt),__PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#define LMHLog(fmt, ...)
#endif

#define DEBUG_LOG Debug

#if DEBUG_LOG
#   define NNLog(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define NNError(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define NNDebug(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#   define NNCont(fmt, ...) NSLog((@"%s [Line %d] " fmt), __PRETTY_FUNCTION__, __LINE__, ##__VA_ARGS__);
#else
#   define NNLog(...)
#   define NNError(...)
#   define NNDebug(...)
#   define NNCont(...)
#endif

/** DEBUG LOG **/
#ifdef DEBUG
#define DLog( s, ... ) NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
#else
#define DLog( s, ... )

#endif
#define kLevel 3
#define kYLog(level, s, ... ) if(level<=kLevel) NSLog( @"< %@:(%d) > %@", [[NSString stringWithUTF8String:__FILE__] lastPathComponent], __LINE__, [NSString stringWithFormat:(s), ##__VA_ARGS__] )
/***********************************************/

//G－C－D
#define BACK(block) dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), block)
#define MAIN(block) dispatch_async(dispatch_get_main_queue(),block)
//程序根目录
#define RootDirectory [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,NSUserDomainMask,YES) objectAtIndex:0]
//程序缓存目录
#define CacheDirectory [NSSearchPathForDirectoriesInDomains(NSCachesDirectory,NSUserDomainMask,YES) objectAtIndex:0]
//临时文件夹目录
#define TmpDirectory NSTemporaryDirectory()
#define ParseObjctForKey(data, key) (([[data objectForKey:key]isEqual:[NSNull null]]||[data objectForKey:key]==nil)?@"":[data objectForKey:key])

CG_INLINE BOOL stringIsEmpty(NSString *string) {
    if([string isKindOfClass:[NSNull class]]){
        return YES;
    }
    if (string == nil) {
        return YES;
    }
    if ([string isEqualToString:@"(null)"]) {
        return YES;
    }
    NSString *text = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    if ([text length] == 0) {
        return YES;
    }
    return NO;
}

//EEE MMM dd HH:mm:ss z yyyy
static inline NSDate* nsstringToNSDate(NSString *datestring)
{
    NSString *tmpdateString = datestring;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    
    // set default time zone by device own zone.
    [formatter setTimeZone:[NSTimeZone defaultTimeZone]];
    
    // convert the time keep on 24-hour
    NSLocale *usLocale = [[NSLocale alloc] initWithLocaleIdentifier:@"US"];
    [formatter setLocale:usLocale];
    [formatter setDateFormat:@"YYYY-MM-dd"];
    //    [formatter setDateFormat:@"YYYY-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:tmpdateString];
    
    return date;
}

static inline BOOL dayDiff(NSDate* today, NSDate* other)
{
    int iToday = 0;
    int iOther = 0;
    
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"dd"];
    iToday = [[formatter stringFromDate:today] intValue];
    iOther = [[formatter stringFromDate:other] intValue];
    
    return iToday == iOther;
}


#endif /* SbConfig_h */
