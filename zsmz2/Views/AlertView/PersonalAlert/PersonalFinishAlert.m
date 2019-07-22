//
//  PersonalFinishAlert.m
//  XbClientApp
//
//  Created by GL on 2019/1/17.
//  Copyright © 2019年 MrChenMj. All rights reserved.
//

#import "PersonalFinishAlert.h"

@interface PersonalFinishAlert ()

@property(nonatomic,strong) UIImageView *lightImage;

@end

@implementation PersonalFinishAlert


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        [self addSubview:bgView];
        
        UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(20), 0, frame.size.width-CGRectGetAdaptiveY(40), CGRectGetAdaptiveY(300))];
        maskView.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
        maskView.layer.cornerRadius = CGRectGetAdaptiveY(10);
        maskView.layer.masksToBounds = YES;
        maskView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:maskView];
        
        UIImageView *titleImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, maskView.width, CGRectGetAdaptiveY(70))];
        titleImage.image = [UIImage imageNamed:@"personal_achievement_finish_top"];
        titleImage.contentMode = UIViewContentModeScaleAspectFit;
        [maskView addSubview:titleImage];
        
        UILabel *title1 = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, maskView.width, CGRectGetAdaptiveY(20))];
        title1.text = @"恭喜你达成";
        title1.textAlignment = NSTextAlignmentCenter;
        title1.font = [UIFont systemFontOfSize1:10];
        title1.textColor = [UIColor whiteColor];
        [maskView addSubview:title1];
        
        self.contentName = [[UILabel alloc] initWithFrame:CGRectMake(0, title1.bottom, maskView.width, CGRectGetAdaptiveY(30))];
        self.contentName.text = @"XXX";
        self.contentName.textAlignment = NSTextAlignmentCenter;
        self.contentName.font = [UIFont systemFontOfSize1:16];
        self.contentName.textColor = [UIColor whiteColor];
        [maskView addSubview:self.contentName];
        
        UILabel *title2 = [[UILabel alloc] initWithFrame:CGRectMake(0, self.contentName.bottom, maskView.width, CGRectGetAdaptiveY(20))];
        title2.text = @"成就";
        title2.textAlignment = NSTextAlignmentCenter;
        title2.font = [UIFont systemFontOfSize1:10];
        title2.textColor = [UIColor whiteColor];
        [maskView addSubview:title2];
        
        self.lightImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, title2.bottom+CGRectGetAdaptiveY(10), maskView.width, CGRectGetAdaptiveY(200))];
        self.lightImage.image = [UIImage imageNamed:@"personal_achievement_finish_light"];
        self.lightImage.contentMode = UIViewContentModeScaleAspectFit;
        [maskView addSubview:self.lightImage];
        
        self.centerImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetAdaptiveY(100), CGRectGetAdaptiveY(100))];
        self.centerImage.image = [UIImage imageNamed:@"personal_lhcq_finish"];
        self.centerImage.contentMode = UIViewContentModeScaleAspectFit;
        self.centerImage.center = self.lightImage.center;
        [maskView addSubview:self.centerImage];
        
        self.content = [[UILabel alloc] initWithFrame:CGRectMake(0, maskView.height-CGRectGetAdaptiveY(30), maskView.width, CGRectGetAdaptiveY(30))];
        self.content.text = @"上满一百节课";
        self.content.textAlignment = NSTextAlignmentCenter;
        self.content.font = [UIFont systemFontOfSize1:12];
        self.content.textColor = [UIColor colorWithHexString:@"#8D8D8D"];
        [maskView addSubview:self.content];
        
        UIButton *sureBut = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetAdaptiveY(200), CGRectGetAdaptiveY(30))];
        [sureBut addTarget:self action:@selector(sureButAction) forControlEvents:UIControlEventTouchUpInside];
        sureBut.backgroundColor = [UIColor colorWithHexString:@"#F68611"];
        [sureBut setTitle:@"确定" forState:UIControlStateNormal];
        sureBut.layer.cornerRadius = CGRectGetAdaptiveY(15);
        sureBut.center = CGPointMake(maskView.centerX, maskView.bottom+CGRectGetAdaptiveY(40));
        [self addSubview:sureBut];
        
        CABasicAnimation* hiddenAnimation = [CABasicAnimation animationWithKeyPath:@"hidden"];
        hiddenAnimation.fromValue = [NSNumber numberWithBool:YES];
        hiddenAnimation.toValue = [NSNumber numberWithBool:NO];
        hiddenAnimation.duration = 0.5;
        hiddenAnimation.removedOnCompletion = NO;
        hiddenAnimation.repeatCount = MAXFLOAT;
        [self.lightImage.layer addAnimation:hiddenAnimation forKey:@"hidden"];
        
        CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
        rotationAnimation.duration = 0.5; // 持续时间
        rotationAnimation.repeatCount = MAXFLOAT; // 重复次数
        rotationAnimation.fromValue = [NSNumber numberWithFloat:0.0]; // 起始角度
        rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI/6]; // 终止角度
        [self.lightImage.layer addAnimation:rotationAnimation forKey:@"rotate-layer"];
        
    }
    return self;
}

- (void)sureButAction
{
    [self removeFromSuperview];
}





@end














