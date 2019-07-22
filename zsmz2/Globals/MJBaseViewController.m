//
//  MJBaseViewController.m
//  MHouseW
//
//  Created by MrChenMj on 2017/4/5.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import "MJBaseViewController.h"
#import "MJAlertView.h"
#import "MBProgressHUD.h"

#define kTouchBackgroundTag 200

@interface MJBaseViewController ()<UIGestureRecognizerDelegate>

@end

@implementation MJBaseViewController

- (void)dealloc
{
    NSLog(@"dealloc");
}

+ (instancetype)shareInitViewControllerWithStroyboardName:(NSString *)name ID:(NSString *)stID
{
    return [[UIStoryboard storyboardWithName:name bundle:nil] instantiateViewControllerWithIdentifier:stID];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(logineError) name:LogineErrorNoti object:nil];
    
    NSInteger barHeight = (IS_IPhoneX?88:64);
    self.barView = [[NavBarView alloc] initWithFrame:CGRectMake(0, 0, kDScreenWidth, barHeight)];
    [self.view addSubview:self.barView];
    self.barView.hidden = YES;
    
    WEAKSELF
    [self.barView createLeftImage:[UIImage imageNamed:@"reservation_class_lastyear"] leftTitle:@"" leftAction:^{
        [weakSelf backButtonAction];
    }];
    [self.barView createRightImage:nil rightTitle:@"" rightAction:^{
        
    }];
}

- (void)logineError
{
    [self backButtonAction];
}

- (void)backButtonAction {
    [RootNavigation popViewControllerAnimated:YES];
}
#pragma mark - UIGestureRecognizerDelegate
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
//    [self.navigationController.navigationItem setHidesBackButton:YES];
//    [self.navigationItem setHidesBackButton:YES animated:NO];
    UIBarButtonItem *backItem = [[UIBarButtonItem alloc] init];
    UIImage* image = [UIImage imageNamed:@"ii"];
    [backItem setBackButtonBackgroundImage:[image resizableImageWithCapInsets:UIEdgeInsetsMake(0, image.size.width, 0, 0)] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [backItem setBackButtonTitlePositionAdjustment:UIOffsetMake(-400.f, 0) forBarMetrics:UIBarMetricsDefault];
    self.navigationItem.backBarButtonItem = backItem;
    
//    self.navigationController.navigationBarHidden = YES;
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    //    [TalkingData trackPageEnd:[self descForUmeng]];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)showLoadingViewWithText:(NSString *)text {
    self.hud.text = text;
    [self.hud showWithAnimation:YES];
}

- (void)hideLoadingView {
    [self.hud dismiss];
}

-(void) showNCLLoadingViewWithText:(NSString *)text
{
    MBProgressHUD *progress = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    progress.mode = MBProgressHUDModeIndeterminate;
    progress.opacity = 0.2;
    progress.labelText = text;
    CGSize windowSize = self.view.frame.size;
    progress.minSize = CGSizeMake(windowSize.width + 20, windowSize.height + 20);
}
- (void)hideNCLLoadingView {
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}


- (CLProgressHUD *)hud {
    if (_hud == nil) {
        CLProgressHUD *hud = [[CLProgressHUD alloc] initWithView:self.view];
        [self.view addSubview:hud];
        _hud = hud;
    }
    return _hud;
}

- (void)showAlertViewWithText:(NSString *)text {
    MJAlertView *hud = nil;
    hud = [[MJAlertView alloc] initWithView:self.view];
    [self.view addSubview:hud];
    [hud showText:text];
}

- (void)ShowText:(NSString *)text
{
    MJAlertView *hud = nil;
    hud = [[MJAlertView alloc] initWithView:self.view];
    [self.view addSubview:hud];
    [hud showText:text];
}
- (void)showAlertViewWithText:(NSString *)text duration:(NSTimeInterval)duration {
    MJAlertView *hud = nil;
    hud = [[MJAlertView alloc] initWithView:self.view];
    [self.view addSubview:hud];
    [hud showText:text duration:duration];
}
- (void)showErrorViewWithText:(NSString *)text {
    if(!stringIsEmpty(text))
    {
        MJAlertView *hud = nil;
        hud = [[MJAlertView alloc] initWithView:self.view];
        [self.view addSubview:hud];
        [hud showText:text duration:1.5f];
    }

}


/**
 如果 descForStatistics 有返回值则添加统计，否则不处理
 */

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}
///添加safe area change空的实现，保证低版本调用安全
- (void)viewSafeAreaInsetsDidChange
{
    if(@available(iOS 11.0, *)){
        [super viewSafeAreaInsetsDidChange];
    }
}
- (NSString *)descForStatistics {
    return nil;
}

- (void)showErrorPageWithRefreshBlcok:(XBErrorRefreshBlock)refreshBlcok
{
    if (!self.errorPage) {
        self.errorPage = [XBErrorPageView setupNoDataView];
    }
    [self.errorPage setRefreshBlock:refreshBlcok];
    [self.view addSubview:self.errorPage];
    [self.errorPage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}
- (void)resetErrorPageEdges:(UIEdgeInsets)edges
{
    [self.errorPage mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(edges);
    }];
}
- (void)showErrorPageCustomImage:(NSString *)imageName btnTitle:(NSString *)btnTitle refreshBlcok:(XBErrorRefreshBlock)refreshBlcok
{
    if (!self.errorPage) {
        self.errorPage = [XBErrorPageView setupNoDataView];
    }
    [self.errorPage setRefreshBlock:refreshBlcok];
    [self.errorPage setDefaultImage:imageName text:btnTitle];
    [self.view addSubview:self.errorPage];
    [self.errorPage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
}

- (void)dismissErrorPageView
{
    [_errorPage removeFromSuperview];
}


@end
