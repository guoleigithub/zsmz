//
//  NavBarView.h
//  XbClientApp
//
//  Created by GL on 2017/6/16.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^barButAction)(void);

@interface NavBarView : UIView

@property(nonatomic,strong) UILabel *barLabel;

@property(nonatomic,strong) UIImageView *leftImage;
@property(nonatomic,strong) UILabel *leftLabel;
@property(nonatomic,strong) UIButton *leftBtn;
@property(nonatomic,copy) barButAction leftAction;

@property(nonatomic,strong) UIImageView *rightImage;
@property(nonatomic,strong) UILabel *rightLabel;
@property(nonatomic,strong) UIButton *rightBtn;
@property(nonatomic,copy) barButAction rightAction;

- (void)createTitle:(NSString *)title;
- (void)createLeftImage:(UIImage *)image leftTitle:(NSString *)title leftAction:(barButAction)action;
- (void)createRightImage:(UIImage *)image rightTitle:(NSString *)title rightAction:(barButAction)action;


@end
