//
//  XBNetWorkStateManager.h
//  XbClientApp
//
//  Created by 刘国靖 on 2017/12/13.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface XBNetWorkStateManager : NSObject

+ (instancetype)shareInstance;

@property (nonatomic , strong) AFNetworkReachabilityManager               *  hostReach;  // 网络判断
@property (nonatomic , strong) UIAlertController *alertContrl;


/**
 判断并显示网络alertControl，非2/3/4G状态下直接回调confirm

 @param strType Play，播放，Download下载，不同类型不同展示语言。default Play提示
 @param vc 需要展示的VC层
 @param confirm 网络提示后 确定按钮 的操作，或者wifi下直接执行的操作。
 */
-(void)showUIAlertActionWithPlayOrDownload:(NSString *)strType viewController:(UIViewController *)vc withConfirm:(void (^)(id sender))confirm;

@end






