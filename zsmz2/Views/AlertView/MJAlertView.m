//
//  MJAlertView.m
//  IDEXX
//
//  Created by MrChenMj on 15/12/17.
//  Copyright © 2015年 MrChenMj. All rights reserved.
//

#import "MJAlertView.h"
#import "UILabel+Additions.h"

@interface MJAlertView ()

@property (nonatomic, strong, readonly) UIView      *hudView;
@property (nonatomic, strong, readonly) UILabel     *stringLabel;

@end

@implementation MJAlertView
@synthesize hudView         = _hudView;
@synthesize stringLabel     = _stringLabel;

+ (instancetype)shareInstance {
    static MJAlertView *_instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _instance = [[self alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    });
    
    return _instance;
}

- (void)dealloc {
    
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.alpha = 0.0;
        self.backgroundColor = [UIColor clearColor];
        self.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    }
    return self;
}

- (id)initWithView:(UIView *)view {
    return [self initWithFrame:view.bounds];
}

- (id)initWithWindow:(UIWindow *)window {
    return [self initWithView:window];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    [self layout];
}

- (void)layout {
    CGFloat hudWidth = 150;
    CGFloat hudHeight = 60;
    self.hudView.frame = CGRectMake((CGRectGetWidth(self.bounds)-hudWidth) / 2, (CGRectGetHeight(self.bounds)-hudHeight) / 2, hudWidth, hudHeight);
    [self.stringLabel adjustFontWithMaxSize:CGSizeMake(hudWidth-10, 60)];
    CGRect rect = self.stringLabel.frame;
    rect.origin.x = 5;
    rect.origin.y = (CGRectGetHeight(_hudView.bounds)-rect.size.height) / 2;
    rect.size.width = hudWidth - 10;
    self.stringLabel.frame = rect;
}

#pragma mark - init Method
- (UIView *)hudView {
    if (!_hudView) {
        _hudView = [[UIView alloc] initWithFrame:CGRectZero];
        _hudView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleTopMargin;
        _hudView.backgroundColor = [UIColor colorWithRed:0.0/255 green:0.0/255 blue:0.0/255.0 alpha:0.5f];
        _hudView.layer.cornerRadius = 5.0f;
        [self addSubview:_hudView];
    }
    
    return _hudView;
}

- (UILabel *)stringLabel {
    if (!_stringLabel) {
        _stringLabel = [[UILabel alloc] initWithFrame:CGRectZero];
        _stringLabel.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin;
        _stringLabel.backgroundColor = [UIColor clearColor];
        _stringLabel.font = [UIFont systemFontOfSize:14.0f];
        _stringLabel.textColor = [UIColor whiteColor];
        _stringLabel.textAlignment = NSTextAlignmentCenter;
        [self.hudView addSubview:_stringLabel];
    }
    
    return _stringLabel;
}

- (void)showText:(NSString *)text {
    self.stringLabel.text = text;
    [self layout];
    [UIView animateWithDuration:0.5f
                     animations:^{
                         self.alpha = 1.0f;
                     } completion:^(BOOL finished) {
                         [self performSelector:@selector(removeFromSuperview)
                                    withObject:nil
                                    afterDelay:1.0f];
                     }];
}

- (void)showText:(NSString *)text duration:(NSTimeInterval)duration {
    self.stringLabel.text = text;
    [self layout];
    [UIView animateWithDuration:0.5f
                     animations:^{
                         self.alpha = 1.0f;
                     } completion:^(BOOL finished) {
                         [self performSelector:@selector(removeFromSuperview)
                                    withObject:nil
                                    afterDelay:duration];
                     }];
}

//- (void)removeFromSuperview {
//    [UIView animateWithDuration:0.5f
//                     animations:^{
//                         self.alpha = 0.0f;
//                     } completion:^(BOOL finished) {
//                         if ([super respondsToSelector:@selector(removeFromSuperview)]) {
//                             [super removeFromSuperview];
//                         }
//                     }];
//}


@end
