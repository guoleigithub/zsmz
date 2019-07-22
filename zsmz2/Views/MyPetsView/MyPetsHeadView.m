//
//  MyPetsHeadView.m
//  zsmz2
//
//  Created by GL on 2019/7/22.
//  Copyright © 2019年 GL. All rights reserved.
//

#import "MyPetsHeadView.h"

@interface MyPetsHeadView ()

@property(nonatomic,strong) UIImageView *headImage;
@property(nonatomic,strong) UILabel *userName;
@property(nonatomic,strong) UILabel *userAccount;
@property(nonatomic,strong) UILabel *fansCount;

@end

@implementation MyPetsHeadView


- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = COLOR_RGB(245, 245, 245);
        
        //头像
        self.headImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(10), CGRectGetAdaptiveY(40), CGRectGetAdaptiveY(80), CGRectGetAdaptiveY(80))];
        self.headImage.image = [UIImage imageNamed:@"weixin"];
        [self addSubview:self.headImage];
        
        self.userName = [[UILabel alloc] initWithFrame:CGRectMake(self.headImage.right+CGRectGetAdaptiveY(10), self.headImage.top, frame.size.width-CGRectGetAdaptiveY(130), CGRectGetAdaptiveY(30))];
        self.userName.text = @"杰杰是个王者";
        self.userName.font = [UIFont boldSystemFontOfSize1:18];
        [self addSubview:self.userName];
        
        self.userAccount = [[UILabel alloc] initWithFrame:CGRectMake(self.userName.left, self.userName.bottom, self.userName.width, CGRectGetAdaptiveY(20))];
        self.userAccount.text = @"账号：12584222";
        self.userAccount.font = [UIFont systemFontOfSize1:14];
        [self addSubview:self.userAccount];
        
        self.userAccount = [[UILabel alloc] initWithFrame:CGRectMake(self.userName.left, self.userAccount.bottom, self.userName.width, CGRectGetAdaptiveY(20))];
        self.userAccount.text = @"粉丝：10932";
        self.userAccount.font = [UIFont systemFontOfSize1:14];
        [self addSubview:self.userAccount];
        
        //    资产
        UIView *assetsBg = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(10), self.headImage.bottom+CGRectGetAdaptiveY(20), frame.size.width-CGRectGetAdaptiveY(20), CGRectGetAdaptiveY(150))];
        assetsBg.backgroundColor = [UIColor whiteColor];
        assetsBg.layer.cornerRadius = 4;
        [self addSubview:assetsBg];
        
        int itemWith = assetsBg.width/3;
        NSArray *assetsTitleArr = [NSArray arrayWithObjects:@"总资产",@"DSC币",@"DOGE币",@"微分",@"合约收益",@"推广收益", nil];
        for (int i = 0; i < 2; i++) {
            for (int j = 0; j < 3; j++) {
                UILabel *assetsTitle = [[UILabel alloc] initWithFrame:CGRectMake(itemWith*j, CGRectGetAdaptiveY(75)*i, itemWith, CGRectGetAdaptiveY(25))];
                assetsTitle.font = [UIFont systemFontOfSize1:14];
                assetsTitle.textColor = [UIColor lightGrayColor];
                assetsTitle.textAlignment = NSTextAlignmentCenter;
                assetsTitle.text = [assetsTitleArr objectAtIndex:j+i*2];
                [assetsBg addSubview:assetsTitle];
                
                UILabel *assetsContent = [[UILabel alloc] initWithFrame:CGRectMake(assetsTitle.left, assetsTitle.bottom, itemWith, CGRectGetAdaptiveY(30))];
                assetsContent.textAlignment = NSTextAlignmentCenter;
                assetsContent.font = [UIFont systemFontOfSize1:20];
                assetsContent.textColor = [UIColor orangeColor];
                assetsContent.text = @"983";
                [assetsBg addSubview:assetsContent];
                
                UILabel *assetsLook = [[UILabel alloc] initWithFrame:CGRectMake(assetsTitle.left, assetsContent.bottom, itemWith, CGRectGetAdaptiveY(20))];
                assetsLook.textAlignment = NSTextAlignmentCenter;
                assetsLook.font = [UIFont systemFontOfSize1:10];
                assetsLook.textColor = [UIColor blueColor];
                assetsLook.text = @"点击查看";
                [assetsBg addSubview:assetsLook];
                
                UIButton *assetsBut = [[UIButton alloc] initWithFrame:CGRectMake(assetsTitle.left, assetsTitle.top, itemWith, CGRectGetAdaptiveY(75))];
                [assetsBut addTarget:self action:@selector(assetButAction:) forControlEvents:UIControlEventTouchUpInside];
                [assetsBg addSubview:assetsBut];
            }
        }
        UIView *assetsLine = [[UIView alloc] initWithFrame:CGRectMake(0, assetsBg.height/2, assetsBg.width, 0.5)];
        assetsLine.backgroundColor = [UIColor lightGrayColor];
        [assetsBg addSubview:assetsLine];
        
        //    记录
        UIView *recordBg = [[UIView alloc] initWithFrame:CGRectMake(0, assetsBg.bottom+CGRectGetAdaptiveY(10), frame.size.width, CGRectGetAdaptiveY(100))];
        [self addSubview:recordBg];
        
        itemWith = CGRectGetAdaptiveY(60);
        NSArray *recordTitleArr = [NSArray arrayWithObjects:@"领养记录",@"转让记录",@"预约记录", nil];
        for (int i = 0; i < 3; i++) {
            UIImageView *recordImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(20), CGRectGetAdaptiveY(10), itemWith, itemWith)];
            recordImage.image = [UIImage imageNamed:@"weixin"];
            [recordBg addSubview:recordImage];
            if (i == 1) {
                recordImage.centerX = recordBg.width/2;
            }else if (i == 2) {
                recordImage.centerX = recordBg.width-CGRectGetAdaptiveY(55);
            }
            
            UILabel *recordLabel = [[UILabel alloc] initWithFrame:CGRectMake(recordImage.left-itemWith/2, recordImage.bottom, itemWith*2, CGRectGetAdaptiveY(40))];
            recordLabel.textAlignment = NSTextAlignmentCenter;
            recordLabel.font = [UIFont boldSystemFontOfSize1:14];
            recordLabel.text = [recordTitleArr objectAtIndex:i];
            [recordBg addSubview:recordLabel];
            
            UIButton *recordBut = [[UIButton alloc] initWithFrame:recordImage.frame];
            [recordBut addTarget:self action:@selector(recordButAction:) forControlEvents:UIControlEventTouchUpInside];
            [recordBg addSubview:recordBut];
        }
        
        
        //    已领养
        UILabel *adoptLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(10), recordBg.bottom, 200, CGRectGetAdaptiveY(40))];
        adoptLabel.text = @"已领养";
        adoptLabel.font = [UIFont systemFontOfSize1:14];
        [self addSubview:adoptLabel];
        
        for (int i = 0; i < 4; i++) {
            UIView *temp = [self createAdoptView:@"" money:@"" profit:@"" time:@"" top:adoptLabel.bottom+CGRectGetAdaptiveY(65)*i];
            [self addSubview:temp];
        }
        
        UIButton *adoptMoreBut = [[UIButton alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(10), adoptLabel.bottom+CGRectGetAdaptiveY(65)*4, kDScreenWidth-CGRectGetAdaptiveY(20), CGRectGetAdaptiveY(40))];
        [adoptMoreBut addTarget:self action:@selector(adoptMoreButAction) forControlEvents:UIControlEventTouchUpInside];
        [adoptMoreBut setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [adoptMoreBut setBackgroundColor:[UIColor whiteColor]];
        [adoptMoreBut setTitle:@"查看更多>" forState:UIControlStateNormal];
        adoptMoreBut.layer.cornerRadius = 4;
        [self addSubview:adoptMoreBut];
        
        UILabel *appointmentLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(10), adoptMoreBut.bottom+CGRectGetAdaptiveY(10), 200, CGRectGetAdaptiveY(40))];
        appointmentLabel.text = @"预约中";
        appointmentLabel.font = [UIFont systemFontOfSize1:14];
        [self addSubview:appointmentLabel];
        
    }
    return self;
}


- (UIView *)createAdoptView:(NSString *)name money:(NSString *)money profit:(NSString *)profit time:(NSString *)time top:(NSInteger)top {
    UIView *adoptBg = [[UIView alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(10), top, kDScreenWidth-CGRectGetAdaptiveY(20), CGRectGetAdaptiveY(60))];
    adoptBg.backgroundColor = [UIColor whiteColor];
    
    UIImageView *adoptImage = [[UIImageView alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(10), CGRectGetAdaptiveY(10), CGRectGetAdaptiveY(40), CGRectGetAdaptiveY(40))];
    adoptImage.image = [UIImage imageNamed:@"weixin"];
    [adoptBg addSubview:adoptImage];
    
    UILabel *adoptTitle = [[UILabel alloc] initWithFrame:CGRectMake(adoptImage.right+CGRectGetAdaptiveY(10), adoptImage.top, 100, CGRectGetAdaptiveY(20))];
    adoptTitle.text = @"幸运猪";
    adoptTitle.font = [UIFont systemFontOfSize1:14];
    [adoptBg addSubview:adoptTitle];
    
    UILabel *adoptMoney = [[UILabel alloc] initWithFrame:CGRectMake(adoptTitle.left, adoptTitle.bottom, 100, CGRectGetAdaptiveY(20))];
    adoptMoney.text = @"价值：800.00";
    adoptMoney.textColor = [UIColor lightGrayColor];
    adoptMoney.font = [UIFont systemFontOfSize1:12];
    [adoptBg addSubview:adoptMoney];
    
    UILabel *adoptProfit = [[UILabel alloc] initWithFrame:CGRectMake(adoptBg.width/2, adoptImage.top, 100, CGRectGetAdaptiveY(20))];
    adoptProfit.text = @"累计收益";
    adoptProfit.textColor = [UIColor lightGrayColor];
    adoptProfit.font = [UIFont systemFontOfSize1:12];
    [adoptBg addSubview:adoptProfit];
    
    UILabel *adoptTime = [[UILabel alloc] initWithFrame:CGRectMake(adoptProfit.left, adoptProfit.bottom, 100, CGRectGetAdaptiveY(20))];
    adoptTime.text = @"成熟时间";
    adoptTime.textColor = [UIColor lightGrayColor];
    adoptTime.font = [UIFont systemFontOfSize1:12];
    [adoptBg addSubview:adoptTime];
    
    UILabel *adoptProfitValue = [[UILabel alloc] initWithFrame:CGRectMake(adoptBg.width-CGRectGetAdaptiveY(10)-100, adoptProfit.top, 100, CGRectGetAdaptiveY(20))];
    adoptProfitValue.text = @"23.45";
    adoptProfitValue.textAlignment = NSTextAlignmentRight;
    adoptProfitValue.textColor = [UIColor blueColor];
    adoptProfitValue.font = [UIFont systemFontOfSize1:12];
    [adoptBg addSubview:adoptProfitValue];
    
    UILabel *adoptTimeValue = [[UILabel alloc] initWithFrame:CGRectMake(adoptProfitValue.left, adoptTime.top, 100, CGRectGetAdaptiveY(20))];
    adoptTimeValue.text = @"20:32:58";
    adoptTimeValue.textAlignment = NSTextAlignmentRight;
    adoptTimeValue.textColor = [UIColor blackColor];
    adoptTimeValue.font = [UIFont systemFontOfSize1:12];
    [adoptBg addSubview:adoptTimeValue];
    
    return adoptBg;
}

#pragma mark - butAction
- (void)assetButAction:(UIButton *)sender {
    
}

- (void)recordButAction:(UIButton *)sender {
    
}

- (void)adoptMoreButAction {
    
}

@end

















