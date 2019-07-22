//
//  UIView+hud.h
//  Carpool
//
//  Created by dasmaster on 14-8-2.
//  Copyright (c) 2014年 dasmaster. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MBProgressHUD.h"

@interface UIView (hud)

- (void) showLoadingHudWithMessage:(NSString *)message;

- (void) showLoadingHudWithMessage:(NSString *)message andUserInteractEnabled:(BOOL)enable;

- (void) hideLoadingHud;

- (void) showMessage:(NSString *)message withDelay:(float)delay;

- (void) showDetailMessage:(NSString *)message withDelay:(float)delay;

- (void) showDownMessage:(NSString *)message withDelay:(float)delay;

@end
