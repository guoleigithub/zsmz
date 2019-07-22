//
//  MyPetsConCellTableViewCell.m
//  zsmz2
//
//  Created by GL on 2019/7/22.
//  Copyright © 2019年 GL. All rights reserved.
//

#import "MyPetsConCellTableViewCell.h"

@interface MyPetsConCellTableViewCell ()

@property(nonatomic,strong) UIImageView *petsImage;
@property(nonatomic,strong) UILabel *petsName;
@property(nonatomic,strong) UILabel *petsValue;

@end

@implementation MyPetsConCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.backgroundColor = COLOR_RGB(245, 245, 245);
        
        UIView *appointmentBg = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(10), 0, kDScreenWidth-CGRectGetAdaptiveY(20), CGRectGetAdaptiveY(60))];
        appointmentBg.backgroundColor = [UIColor whiteColor];
        appointmentBg.layer.shadowColor = [UIColor lightGrayColor].CGColor;
        appointmentBg.layer.shadowOffset = CGSizeMake(1, 1);
        appointmentBg.layer.shadowOpacity = 0.3;
        appointmentBg.layer.cornerRadius = 4;
        [self addSubview:appointmentBg];
        
        self.petsImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(10), CGRectGetAdaptiveY(10), CGRectGetAdaptiveY(40), CGRectGetAdaptiveY(40))];
        self.petsImage.image = [UIImage imageNamed:@"weixin"];
        [appointmentBg addSubview:self.petsImage];
        
        self.petsName = [[UILabel alloc] initWithFrame:CGRectMake(self.petsImage.right+CGRectGetAdaptiveY(10), 0, 100, appointmentBg.height)];
        self.petsName.text = @"幸运猪";
        self.petsName.font = [UIFont systemFontOfSize1:14];
        [appointmentBg addSubview:self.petsName];
        
        self.petsValue = [[UILabel alloc] initWithFrame:CGRectMake(appointmentBg.width-CGRectGetAdaptiveY(10)-100, 0, 100, appointmentBg.height)];
        self.petsValue.text = @"23.45";
        self.petsValue.textAlignment = NSTextAlignmentRight;
        self.petsValue.textColor = [UIColor blueColor];
        self.petsValue.font = [UIFont systemFontOfSize1:16];
        [appointmentBg addSubview:self.petsValue];
    }
    return self;
}

@end
