//
//  XBNetWorkStateManager.m
//  XbClientApp
//
//  Created by 刘国靖 on 2017/12/13.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import "XBNetWorkStateManager.h"
#import "AFNetworkReachabilityManager.h"

@implementation XBNetWorkStateManager

+ (instancetype)shareInstance
{
    static XBNetWorkStateManager *netManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        if (netManager == nil) {
            netManager = [[XBNetWorkStateManager alloc] init];
        }
    });
    return netManager;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.hostReach = [AFNetworkReachabilityManager sharedManager];
        //开始监听，会启动一个run loop
        [self.hostReach startMonitoring];
    }
    return self;
}

- (BOOL)networkIsViaWiFi
{
    return self.hostReach.networkReachabilityStatus == AFNetworkReachabilityStatusReachableViaWiFi;
}

// 弹出 警告框
-(void)showUIAlertActionWithPlayOrDownload:(NSString *)strType viewController:(UIViewController *)vc withConfirm:(void (^)(id sender))confirm{
    if ([self networkIsViaWiFi]) {
        confirm(nil);
        return;
    }
    // 清除之前的 alertview
    if (_alertContrl){
        [_alertContrl dismissViewControllerAnimated:YES completion:nil];
    }
    
    NSString * strmessage = nil;
    (strType == nil || strType.length == 0)?strType = @"Play":nil;
    if ([strType isEqualToString:@"Download"]) {
        strmessage = @"当前无wifi，是否允许用流量下载";
        
    }else if ([strType isEqualToString:@"Play"]){
        //先暂停播放器，防止播放的声音和当前显示的界面不同
//        [[TTAppdelegate player] pause];
        strmessage = @"当前无wifi，是否允许用流量播放";
    }
    
    _alertContrl = [UIAlertController alertControllerWithTitle:@"流量提醒"
                                                       message:strmessage
                                                preferredStyle:UIAlertControllerStyleAlert];
    _alertContrl.view.backgroundColor=[UIColor whiteColor];
    
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
        //更新按钮状态通知
        [_alertContrl dismissViewControllerAnimated:YES completion:nil];
    }];
    UIAlertAction *okAction = [UIAlertAction actionWithTitle:@"允许" style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
        confirm(nil);
        [_alertContrl dismissViewControllerAnimated:YES completion:nil];
    }];
    //总是允许暂时不需要。
//    UIAlertAction *ALLAction = [UIAlertAction actionWithTitle:@"总是允许" style:UIAlertActionStyleDestructive handler:^(UIAlertAction *action) {
//        confirm(nil);
//        [_alertContrl dismissViewControllerAnimated:YES completion:nil];
//        if ([strType isEqualToString:@"Download"]) {
//            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:KWarnNETWORK4G_DownloadInAll];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//        }else if ([strType isEqualToString:@"Play"]){
//
//            [[NSUserDefaults standardUserDefaults] setBool:NO forKey:KWarnNETWORK4G_playInAll];
//            [[NSUserDefaults standardUserDefaults] synchronize];
//        }
//    }];
    [_alertContrl addAction:cancelAction];
    
//    [_alertContrl addAction:ALLAction];
    [_alertContrl addAction:okAction];
    
    [vc presentViewController:_alertContrl animated:YES completion:nil];
    
}




@end
