//
//  ReservationCancelAlert.m
//  XbClientApp
//
//  Created by GL on 2019/1/15.
//  Copyright © 2019年 MrChenMj. All rights reserved.
//

#import "ReservationCancelAlert.h"

@implementation ReservationCancelAlert

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
        
        UIView *maskView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetAdaptiveY(186), CGRectGetAdaptiveY(100))];
        maskView.backgroundColor = [UIColor colorWithHexString:@"#F4F4F4"];
        maskView.layer.cornerRadius = 4;
        maskView.layer.masksToBounds = YES;
        maskView.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        [self addSubview:maskView];
        
        UILabel *content1 = [self createCancelTwiceLabel:CGRectMake(maskView.left-CGRectGetAdaptiveY(13), maskView.centerY-CGRectGetAdaptiveY(20), maskView.width, CGRectGetAdaptiveY(20))];
        content1.text = @"本月已取消两次";
        [self addSubview:content1];
        
        UILabel *content2 = [self createCancelTwiceLabel:CGRectMake(content1.left, content1.bottom, content1.width, content1.height)];
        content2.text = @"不可以再取消预约哦";
        [self addSubview:content2];
        
        CGSize str1Size = [content2.text sizeWithFont:[UIFont systemFontOfSize1:12] forWidth:content1.width lineBreakMode:NSLineBreakByWordWrapping];
        UIImageView *iconImage = [[UIImageView alloc] initWithFrame:CGRectMake(content1.centerX+str1Size.width/2+CGRectGetAdaptiveY(6), content2.top, CGRectGetAdaptiveY(20), CGRectGetAdaptiveY(20))];
        iconImage.image = [UIImage imageNamed:@"reservation_canceltwice_alert"];
        [self addSubview:iconImage];
        
        
    }
    return self;
}

//取消两次
- (UILabel *)createCancelTwiceLabel:(CGRect)rect
{
    UILabel *content1 = [[UILabel alloc] initWithFrame:rect];
    content1.textAlignment = NSTextAlignmentCenter;
    content1.font = [UIFont systemFontOfSize1:12];
    content1.numberOfLines = 0;
    return content1;
}



- (void)showAlertInView:(UIView *)view
{
    [view addSubview:self];
    dispatch_time_t time=dispatch_time(DISPATCH_TIME_NOW, 2ull *NSEC_PER_SEC);
    dispatch_after(time, dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}


@end
