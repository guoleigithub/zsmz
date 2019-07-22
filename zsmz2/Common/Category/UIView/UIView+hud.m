//
//  UIView+hud.m
//  Carpool
//
//  Created by dasmaster on 14-8-2.
//  Copyright (c) 2014年 dasmaster. All rights reserved.
//

#import "UIView+hud.h"

@implementation UIView (hud)

- (void) showLoadingHudWithMessage:(NSString *)message
{
    [self showLoadingHudWithMessage:message andUserInteractEnabled:NO];
}

- (void) showLoadingHudWithMessage:(NSString *)message andUserInteractEnabled:(BOOL)enable
{
    MBProgressHUD *HUD = [MBProgressHUD showHUDAddedTo:self animated:YES];
    HUD.userInteractionEnabled = enable;
    HUD.labelText = message;
}


- (void) hideLoadingHud
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:self];
    [hud hide:YES];
    [hud removeFromSuperview];
    hud = nil;
}

- (void) showMessage:(NSString *)message withDelay:(float)delay
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:hud];
    hud.labelText = message;
    hud.mode = MBProgressHUDModeText;
    hud.userInteractionEnabled = NO;
    
    [hud showAnimated:YES whileExecutingBlock:^{
        usleep(delay*1000*1000);
    } completionBlock:^{
        [hud removeFromSuperview];
    }];
}

- (void) showDetailMessage:(NSString *)message withDelay:(float)delay
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:hud];
    hud.detailsLabelText = message;
    hud.detailsLabelFont = [UIFont boldSystemFontOfSize:13];
    hud.mode = MBProgressHUDModeText;
    hud.userInteractionEnabled = NO;
    
    [hud showAnimated:YES whileExecutingBlock:^{
        usleep(delay*1000*1000);
    } completionBlock:^{
        [hud removeFromSuperview];
    }];
}

- (void) showDownMessage:(NSString *)message withDelay:(float)delay
{
    UIView *backView = [[UIView alloc] initWithFrame:CGRectMake(0, 200, self.width, 60)];
    [self addSubview:backView];
    backView.backgroundColor=[UIColor clearColor];
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:backView];
    
    [backView addSubview:hud];
    hud.labelText = message;
    hud.mode = MBProgressHUDModeText;
    hud.userInteractionEnabled = NO;
    
    [hud showAnimated:YES whileExecutingBlock:^{
        usleep(delay*1000*1000);
    } completionBlock:^{
        [hud removeFromSuperview];
        [backView removeFromSuperview];
    }];
}


- (void) showMessage:(NSString *)message withDelay:(float)delay andCompletionBlock:(void(^)(void))completion
{
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:self];
    [self addSubview:hud];
    hud.labelText = message;
    hud.mode = MBProgressHUDModeText;
    
    [hud showAnimated:YES whileExecutingBlock:^{
        usleep(delay*1000);
    } completionBlock:^{
        [hud removeFromSuperview];
        completion();
    }];
}


@end
