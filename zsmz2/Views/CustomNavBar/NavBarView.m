//
//  NavBarView.m
//  XbClientApp
//
//  Created by GL on 2017/6/16.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import "NavBarView.h"

@interface NavBarView ()

@end

@implementation NavBarView

- (void)dealloc
{
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = kMainColor;
        
        self.barLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, (IS_IPhoneX?44:20), frame.size.width, 44)];
        self.barLabel.text = @"XXX";
        self.barLabel.font = [UIFont systemFontOfSize:18];//SysFont(18);
        self.barLabel.textAlignment = NSTextAlignmentCenter;
        self.barLabel.userInteractionEnabled = YES;
        self.barLabel.adjustsFontSizeToFitWidth = YES;
        [self addSubview:self.barLabel];
        
        self.leftImage = [[UIImageView alloc] initWithFrame:CGRectMake(18, 0, 21, 21)];
        self.leftImage.userInteractionEnabled = NO;
        self.leftImage.contentMode = UIViewContentModeScaleAspectFit;
        self.leftImage.center = CGPointMake(self.leftImage.center.x, 22);
        [self.barLabel addSubview:self.leftImage];
        self.leftLabel = [[UILabel alloc] initWithFrame:CGRectMake(18, 0, 60, 44)];
        self.leftLabel.userInteractionEnabled = NO;
        [self.barLabel addSubview:self.leftLabel];
        UIButton *leftBarBut = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 60, 44)];
        [leftBarBut addTarget:self action:@selector(leftBarAction) forControlEvents:UIControlEventTouchUpInside];
        leftBarBut.accessibilityLabel = @"left_more";
        [self.barLabel addSubview:leftBarBut];
        self.leftBtn = leftBarBut;
        
        
        self.rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(frame.size.width-21-18, frame.size.width, 21, 21)];
        self.rightImage.userInteractionEnabled = NO;
        self.rightImage.contentMode = UIViewContentModeScaleAspectFit;
        self.rightImage.center = CGPointMake(self.rightImage.center.x, 22);
        [self.barLabel addSubview:self.rightImage];
        self.rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width-60-18, 0, 60, 44)];
        self.rightLabel.userInteractionEnabled = NO;
        self.rightLabel.adjustsFontSizeToFitWidth = YES;
        self.rightLabel.textAlignment = NSTextAlignmentRight;
        [self.barLabel addSubview:self.rightLabel];
        UIButton *rightBarBut = [[UIButton alloc] initWithFrame:CGRectMake(frame.size.width-44-40, 0, 80, 44)];
        [rightBarBut addTarget:self action:@selector(rightBarAction) forControlEvents:UIControlEventTouchUpInside];
        [self.barLabel addSubview:rightBarBut];
        self.rightBtn = rightBarBut;
        
        UIView *line = [[UIView alloc] init];
        line.backgroundColor = [UIColor grayColor];
        [self addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(self);
            make.right.equalTo(self);
            make.bottom.equalTo(self);
            make.height.mas_equalTo(0.5);
        }];
        
    }
    return self;
}

- (void)createTitle:(NSString *)title
{
    self.barLabel.text = title;
}
- (void)createLeftImage:(UIImage *)image leftTitle:(NSString *)title leftAction:(barButAction)action
{
    self.leftImage.hidden = image==nil?YES:NO;
    self.leftLabel.hidden = title==nil?YES:NO;
    self.leftImage.image = image;
    self.leftLabel.text = title;
    self.leftAction = action;
}
- (void)createRightImage:(UIImage *)image rightTitle:(NSString *)title rightAction:(barButAction)action
{
    self.rightImage.hidden = image==nil?YES:NO;
    self.rightLabel.hidden = title==nil?YES:NO;
    self.rightImage.image = image;
    self.rightLabel.text = title;
    self.rightAction = action;
}

- (void)leftBarAction
{
    self.leftAction();
}

- (void)rightBarAction
{
    self.rightAction();
}



@end
