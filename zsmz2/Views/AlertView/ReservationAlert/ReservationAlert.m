//
//  ReservationAlert.m
//  XbClientApp
//
//  Created by GL on 2019/1/11.
//  Copyright © 2019年 MrChenMj. All rights reserved.
//

#import "ReservationAlert.h"

@interface ReservationAlert ()

@end

@implementation ReservationAlert

- (void)dealloc
{
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.4];
        [self addSubview:bgView];
        
        UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetAdaptiveY(280), CGRectGetAdaptiveY(160))];
        maskView.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
        maskView.layer.cornerRadius = 4;
        maskView.layer.masksToBounds = YES;
        maskView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:maskView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(-CGRectGetAdaptiveY(17), CGRectGetAdaptiveY(40), maskView.width, CGRectGetAdaptiveY(30))];
        self.titleLabel.text = @"是否取消预约本次课程？";
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont systemFontOfSize1:14];
        [maskView addSubview:self.titleLabel];
        
        CGSize si = [self.titleLabel.text sizeWithFont:[UIFont systemFontOfSize1:14] constrainedToSize:self.titleLabel.bounds.size lineBreakMode:NSLineBreakByWordWrapping];
        UIImageView *rightImage = [[UIImageView alloc] initWithFrame:CGRectMake(maskView.width/2+si.width/2-CGRectGetAdaptiveY(17), self.titleLabel.top, CGRectGetAdaptiveY(30), CGRectGetAdaptiveY(30))];
        rightImage.image = [UIImage imageNamed:@"reservation_alert_penguin"];
        rightImage.contentMode = UIViewContentModeScaleAspectFit;
        [maskView addSubview:rightImage];
        
        UIButton *sureBut = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetAdaptiveY(70), CGRectGetAdaptiveY(28))];
        [sureBut setTitle:@"确定" forState:UIControlStateNormal];
        sureBut.backgroundColor = [UIColor colorWithHexString:@"#F58612"];
        sureBut.center = CGPointMake(maskView.width/3, self.titleLabel.bottom+CGRectGetAdaptiveY(40));
        [sureBut addTarget:self action:@selector(sureButAction) forControlEvents:UIControlEventTouchUpInside];
        sureBut.layer.cornerRadius = 4;
        [maskView addSubview:sureBut];
        
        UIButton *cancelBut = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetAdaptiveY(70), CGRectGetAdaptiveY(28))];
        [cancelBut setTitle:@"取消" forState:UIControlStateNormal];
        cancelBut.backgroundColor = [UIColor colorWithHexString:@"#D6D6D6"];
        cancelBut.center = CGPointMake(maskView.width/3*2, self.titleLabel.bottom+CGRectGetAdaptiveY(40));
        [cancelBut addTarget:self action:@selector(cancelButAction) forControlEvents:UIControlEventTouchUpInside];
        cancelBut.layer.cornerRadius = 4;
        [maskView addSubview:cancelBut];
        
        UIButton *closeBut = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetAdaptiveY(30), CGRectGetAdaptiveY(30))];
        closeBut.backgroundColor = [UIColor whiteColor];
        closeBut.center = CGPointMake(maskView.right, maskView.top);
        [closeBut addTarget:self action:@selector(closeButAction) forControlEvents:UIControlEventTouchUpInside];
        closeBut.layer.cornerRadius = CGRectGetAdaptiveY(15);
        [closeBut setImage:[UIImage imageNamed:@"reservation_choosemask_close"] forState:UIControlStateNormal];
        [self addSubview:closeBut];
        
    }
    return self;
}

- (void)sureButAction
{
    if (self.delegate  && [self.delegate respondsToSelector:@selector(reservationAlertSelect:type:)]) {
        [self.delegate reservationAlertSelect:YES type:self.type];
    }
    [self removeFromSuperview];
}
- (void)cancelButAction
{
    if (self.delegate  && [self.delegate respondsToSelector:@selector(reservationAlertSelect:type:)]) {
        [self.delegate reservationAlertSelect:NO type:self.type];
    }
    [self removeFromSuperview];
}
- (void)closeButAction
{
    [self removeFromSuperview];
}






@end




