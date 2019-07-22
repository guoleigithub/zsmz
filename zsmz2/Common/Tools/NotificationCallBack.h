//
//  NotificationCallBack.h
//  XbClientApp
//
//  Created by GL on 2017/7/13.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^notificationBlock)(void);

@interface NotificationCallBack : NSObject

+ (instancetype _Nonnull )shareInstance;

- (void)postNotificationName:(NSNotificationName _Nonnull )aName object:(nullable id)anObject userInfo:(nullable NSDictionary *)aUserInfo finishBlock:(notificationBlock _Nullable )finishBlock;

- (void)finishCallBack;

@end
