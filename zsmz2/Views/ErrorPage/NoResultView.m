//
//  NoResultView.m
//  XbClientApp
//
//  Created by GL on 2019/2/27.
//  Copyright © 2019年 MrChenMj. All rights reserved.
//

#import "NoResultView.h"

@interface NoResultView ()

@end

@implementation NoResultView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *resultImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, CGRectGetAdaptiveY(80))];
        resultImage.contentMode = UIViewContentModeScaleAspectFit;
        resultImage.image = [UIImage imageNamed:@"global_noresult"];
        [self addSubview:resultImage];
        resultImage.center = CGPointMake(frame.size.width/2, frame.size.height/2);
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, resultImage.bottom, resultImage.width, CGRectGetAdaptiveY(20))];
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.textColor = [UIColor colorWithHexString:@"#C8C8C8"];
        self.titleLabel.font = [UIFont systemFontOfSize1:14];
        [self addSubview:self.titleLabel];
        
    }
    return self;
}


@end
