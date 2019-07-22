//
//  NoDataView.h
//  TinBerBoard
//
//  Created by 韩家健 on 16/6/12.
//  Copyright © 2016年 shentingting. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^XBErrorRefreshBlock)(void);

@interface XBErrorPageView : UIView
@property (weak, nonatomic) IBOutlet UIImageView *image;
@property (weak, nonatomic) IBOutlet UILabel     *lab;

+ (XBErrorPageView *)setupNoDataView;

- (void)setRefreshBlock:(XBErrorRefreshBlock)refreshBlock;

- (void)setDefaultImage:(NSString *)imageName text:(NSString *)labText;

- (void)setDefaultImage:(NSString *)imageName text:(NSString *)labText refrshBlock:(XBErrorRefreshBlock)refreshBlock;

/**
 不设置frame，则在view的中心，自动加入到view中。

 @param frame frame
 @param view superview
 @param content 无内容的描述
 @param btnTitle 按钮文字
 @param refreshBlock 点击刷新按钮回调
 */
//- (void)setRefreshViewWithFrame:(CGRect)frame view:(UIView *)view content:(NSString *)content btnTitle:(NSString *)btnTitle refrshBlock:(XBNoDataRefreshBlock)refreshBlock;

@end

//@interface UIView (XBNoDataView)
//
//@property(nonatomic,strong)XBNoDataView *noDataView;
//
//@end


