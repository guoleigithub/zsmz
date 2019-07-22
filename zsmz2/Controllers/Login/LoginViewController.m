//
//  LoginViewController.m
//  zsmz2
//
//  Created by GL on 2019/7/22.
//  Copyright © 2019年 GL. All rights reserved.
//

#import "LoginViewController.h"

@interface LoginViewController ()
{
    BOOL isRember;//是否记住密码
}

@property(nonatomic,strong) UITextField *phoneText;
@property(nonatomic,strong) UITextField *passWordText;
@property(nonatomic,strong) UIView *remberMark;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor grayColor];
    isRember = NO;
    
    UIImageView *loginBg = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:loginBg];
    
    UIView *centerBg = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.view.width-CGRectGetAdaptiveY(20), CGRectGetAdaptiveY(360))];
    centerBg.center = CGPointMake(self.view.width/2, self.view.height/2);
    centerBg.backgroundColor = [UIColor whiteColor];
    centerBg.layer.cornerRadius = 8;
    [self.view addSubview:centerBg];
    
    UILabel *titleL = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, centerBg.width, CGRectGetAdaptiveY(80))];
    titleL.text = @"掌上鸣猪";
    titleL.textAlignment = NSTextAlignmentCenter;
    titleL.textColor = kMainColor;
    titleL.font = [UIFont boldSystemFontOfSize1:20];
    [centerBg addSubview:titleL];
    
//    *phoneText; passWordText;
    self.phoneText = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(20), titleL.bottom, centerBg.width-CGRectGetAdaptiveY(40), CGRectGetAdaptiveY(40))];
    self.phoneText.backgroundColor = COLOR_RGB(221, 221, 221);
    self.phoneText.layer.cornerRadius = 4;
    self.phoneText.placeholder = @"    手机号";
    self.phoneText.font = [UIFont systemFontOfSize1:14];
    [centerBg addSubview:self.phoneText];
    
    self.passWordText = [[UITextField alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(20), self.phoneText.bottom+CGRectGetAdaptiveY(10), self.phoneText.width, self.phoneText.height)];
    self.passWordText.backgroundColor = COLOR_RGB(221, 221, 221);
    self.passWordText.layer.cornerRadius = 4;
    self.passWordText.placeholder = @"    密码";
    self.passWordText.font = [UIFont systemFontOfSize1:14];
    [centerBg addSubview:self.passWordText];
    
    
    self.remberMark = [[UIView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetAdaptiveY(10), CGRectGetAdaptiveY(10))];
    self.remberMark.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.remberMark.layer.borderWidth = 0.5;
    self.remberMark.center = CGPointMake(CGRectGetAdaptiveY(30), self.passWordText.bottom+CGRectGetAdaptiveY(20));
    [centerBg addSubview:self.remberMark];
    
    UILabel *remberLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.remberMark.right+CGRectGetAdaptiveY(10), self.passWordText.bottom, 200, CGRectGetAdaptiveY(40))];
    remberLabel.text = @"记住密码";
    remberLabel.font = [UIFont systemFontOfSize1:12];
    [centerBg addSubview:remberLabel];
    
    UIButton *remberPassWord = [[UIButton alloc] initWithFrame:CGRectMake(self.passWordText.left, self.passWordText.bottom, CGRectGetAdaptiveY(100), CGRectGetAdaptiveY(40))];
    [remberPassWord addTarget:self action:@selector(remberPassWordAction) forControlEvents:UIControlEventTouchUpInside];
    [centerBg addSubview:remberPassWord];
    
    UILabel *sliderLabel = [[UILabel alloc] initWithFrame:CGRectMake(self.passWordText.left, remberPassWord.bottom, self.passWordText.width, CGRectGetAdaptiveY(40))];
    sliderLabel.backgroundColor = COLOR_RGB(221, 221, 221);
    sliderLabel.text = @"滑块验证";
    sliderLabel.textAlignment = NSTextAlignmentCenter;
    sliderLabel.font = [UIFont systemFontOfSize1:14];
    sliderLabel.textColor = [UIColor lightGrayColor];
    sliderLabel.layer.cornerRadius = 6;
    sliderLabel.layer.masksToBounds = YES;
    [centerBg addSubview:sliderLabel];
    
//    登录
    UIButton *loginBut = [[UIButton alloc] initWithFrame:CGRectMake(sliderLabel.left, sliderLabel.bottom+CGRectGetAdaptiveY(20), sliderLabel.width, CGRectGetAdaptiveY(40))];
    [loginBut addTarget:self action:@selector(loginButAction) forControlEvents:UIControlEventTouchUpInside];
    [loginBut setBackgroundColor:kMainColor];
    [loginBut setTitle:@"登录" forState:UIControlStateNormal];
    loginBut.layer.cornerRadius = 4;
    loginBut.titleLabel.font = [UIFont systemFontOfSize1:14];
    [centerBg addSubview:loginBut];
    
    UILabel *registerLabel = [[UILabel alloc] initWithFrame:CGRectMake(loginBut.left+5, loginBut.bottom, 200, CGRectGetAdaptiveY(40))];
    registerLabel.font = [UIFont systemFontOfSize1:12];
    registerLabel.attributedText = [self createAttributeWith:@"还没有账号？" subStr:@"注册"];
    [centerBg addSubview:registerLabel];
    
//    注册
    UIButton *registerBut = [[UIButton alloc] initWithFrame:CGRectMake(loginBut.left, loginBut.bottom, CGRectGetAdaptiveY(100), CGRectGetAdaptiveY(40))];
    [registerBut addTarget:self action:@selector(registerButAction) forControlEvents:UIControlEventTouchUpInside];
    [centerBg addSubview:registerBut];
    
    UILabel *forgetLabel = [[UILabel alloc] initWithFrame:CGRectMake(centerBg.width-100-CGRectGetAdaptiveY(20)-5, loginBut.bottom, 100, CGRectGetAdaptiveY(40))];
    forgetLabel.textAlignment = NSTextAlignmentRight;
    forgetLabel.font = [UIFont systemFontOfSize1:12];
    forgetLabel.text = @"忘记密码？";
    forgetLabel.textColor = kMainColor;
    [centerBg addSubview:forgetLabel];
    
//    忘记密码
    UIButton *forgetBut = [[UIButton alloc] initWithFrame:CGRectMake(centerBg.width-100-CGRectGetAdaptiveY(20), loginBut.bottom, 100, CGRectGetAdaptiveY(40))];
    [forgetBut addTarget:self action:@selector(forgetButAction) forControlEvents:UIControlEventTouchUpInside];
    [centerBg addSubview:forgetBut];
    
}

- (NSAttributedString *)createAttributeWith:(NSString *)str subStr:(NSString *)subStr
{
    NSMutableAttributedString *attribute = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@"%@ %@",str,subStr]];
    [attribute addAttribute:NSForegroundColorAttributeName value:[UIColor lightGrayColor] range:NSMakeRange(0, str.length)];
    [attribute addAttribute:NSForegroundColorAttributeName value:kMainColor range:NSMakeRange(str.length+1, subStr.length)];
    return attribute;
}

#pragma mark - butAction
//记住密码
- (void)remberPassWordAction
{
    isRember = !isRember;
    if (isRember) {
        self.remberMark.backgroundColor = kMainColor;
        self.remberMark.layer.borderColor = nil;
    }else {
        self.remberMark.backgroundColor = [UIColor whiteColor];
        self.remberMark.layer.borderColor = [UIColor lightGrayColor].CGColor;
    }
}

//登录
- (void)loginButAction
{
    [[NSNotificationCenter defaultCenter] postNotificationName:GLOBALLOGINSUCCESS object:nil userInfo:nil];
}

//注册
- (void)registerButAction
{
    
}

//忘记密码
- (void)forgetButAction
{
    
}




@end
