//
//  NotificationCallBack.m
//  XbClientApp
//
//  Created by GL on 2017/7/13.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import "NotificationCallBack.h"

@interface NotificationCallBack ()

@property(nonatomic,copy) notificationBlock callBlock;

@end

@implementation NotificationCallBack

+ (instancetype)shareInstance
{
    static NotificationCallBack *notificationCallBack;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        notificationCallBack = [[NotificationCallBack alloc] init];
    });
    return notificationCallBack;
}

- (void)postNotificationName:(NSNotificationName _Nonnull )aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo finishBlock:(notificationBlock _Nullable )finishBlock
{
    self.callBlock = finishBlock;
    [[NSNotificationCenter defaultCenter] postNotificationName:aName object:anObject userInfo:aUserInfo];
}

- (void)finishCallBack
{
    if (!self.callBlock) {
        return;
    }
    self.callBlock();
    self.callBlock = nil;
}

@end
