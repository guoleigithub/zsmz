//
//  MJBaseViewController.h
//  MHouseW
//
//  Created by MrChenMj on 2017/4/5.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CLProgressHUD.h"
#import "StatisticsNames.h"
#import "XBErrorPageView.h"
#import "NavBarView.h"

typedef void(^TapBlock)(void);

/**
 *  所有控制器类的父类
 */
@interface MJBaseViewController : UIViewController

@property(nonatomic,strong) NavBarView *barView;

@property (nonatomic, weak) CLProgressHUD *hud;
@property (nonatomic, strong)UIView *tab_backGroundView;
@property (nonatomic, strong)UILabel *lab;
@property (nonatomic, strong)XBErrorPageView *errorPage;
- (void)backButtonAction;
/**
 *  友盟、TalkingData统计需要的界面名称
 *  默认nil，需要统计的返回名称即可。
 *  @return 类名称
 */
- (NSString *)descForStatistics;
- (void)showLoadingViewWithText:(NSString *)text;
- (void)hideLoadingView;

-(void) showNCLLoadingViewWithText:(NSString *)text;
- (void)hideNCLLoadingView;
/**
 *  显示错误提示框
 *
 *  @param text 错误信息
 */
- (void)showErrorViewWithText:(NSString *)text;

/**
 *  显示提示信息
 *
 *  @param text 信息
 */
- (void)ShowText:(NSString *)text;
/**
 *  显示提示信息
 *
 *  @param text 信息
 */
- (void)showAlertViewWithText:(NSString *)text duration:(NSTimeInterval)duration;

/**
 *  显示提示信息
 *
 *  @param name Stroyboard名字
 *  @param stID Stroyboard ID
 */
+ (instancetype)shareInitViewControllerWithStroyboardName:(NSString *)name ID:(NSString *)stID;



/**
 显示错误页面，覆盖self.view,在self.customBar下方。
 @param refreshBlcok 点击刷新后的回调
 */
- (void)showErrorPageWithRefreshBlcok:(XBErrorRefreshBlock)refreshBlcok;


/**
 显示自定义icon和btntitle的错误页面，覆盖self.view,在self.customBar下方。

 @param imageName 自定义图片名称
 @param btnTitle 自定义按钮名称
 @param refreshBlcok 点击刷新后的回调。
 */
- (void)showErrorPageCustomImage:(NSString *)imageName btnTitle:(NSString *)btnTitle refreshBlcok:(XBErrorRefreshBlock)refreshBlcok;

/*
 错误页面距离控制。
 */
- (void)resetErrorPageEdges:(UIEdgeInsets)edges;

/**
 从父视图中移除
 */
- (void)dismissErrorPageView;

@end






