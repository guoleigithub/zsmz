//
//  NoDataView.m
//  TinBerBoard
//
//  Created by 韩家健 on 16/6/12.
//  Copyright © 2016年 shentingting. All rights reserved.
//

#import "XBErrorPageView.h"
//#import "UIView+MJExtension.h"
//#import <objc/runtime.h>

@interface XBErrorPageView ()
@property(nonatomic,copy)XBErrorRefreshBlock refreshBlock;
@property(nonatomic,strong)UILabel *contentLabel;
@property(nonatomic,strong)UIButton *refreshBtn;

@end

@implementation XBErrorPageView

+ (XBErrorPageView *)setupNoDataView
{
    XBErrorPageView *view = [[[NSBundle mainBundle]loadNibNamed:@"NoDataView" owner:nil options:nil] firstObject];
    return view;
}

- (void)setDefaultImage:(NSString *)imageName text:(NSString *)labText
{
    _image.image = [UIImage imageNamed:imageName];
    _lab.text    = labText;
}

- (void)setRefreshBlock:(XBErrorRefreshBlock)refreshBlock
{
    _refreshBlock = refreshBlock;
}

/**
 此方法用于构建请求出错，无网络情况下的，空白页带刷新页面

 @param imageName 图片
 @param labText 文字
 @param refreshBlock 点击刷新后的block
 */
- (void)setDefaultImage:(NSString *)imageName text:(NSString *)labText refrshBlock:(XBErrorRefreshBlock)refreshBlock
{
    //默认图像
    imageName = imageName?imageName:@"netError";
    _image.image = [UIImage imageNamed:imageName];
    _lab.text    = labText;
    self.refreshBlock = refreshBlock;
}
- (IBAction)refreshAction:(id)sender
{
    if (self.refreshBlock) {
        self.refreshBlock();
    }
//    [self removeFromSuperview];
}

//- (void)setRefreshViewWithFrame:(CGRect)frame view:(UIView *)view content:(NSString *)content btnTitle:(NSString *)btnTitle refrshBlock:(XBNoDataRefreshBlock)refreshBlock
//{
//    [view addSubview:self];
//
//    self.image.image = nil;
//    self.lab.text = nil;
//    self.backgroundColor = [UIColor clearColor];
//    self.refreshBlock = refreshBlock;
//    self.contentLabel.text = content;
//    [self.refreshBtn setTitle:btnTitle forState:UIControlStateNormal];
//
//    [self addSubview:self.contentLabel];
//    [self addSubview:self.refreshBtn];
//
//    if (frame.size.width>10) {
//        self.frame = frame;
//    }
//    else{
//        if (view) {
//            [self mas_makeConstraints:^(MASConstraintMaker *make) {
//                make.edges.mas_equalTo(view);
//            }];
//        }
//    }
//
////    CGFloat topSpaceProportion = 0.44;
//    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerY.mas_equalTo(self.mas_centerY).mas_offset(-30);
//        make.centerX.mas_equalTo(self.mas_centerX);
//
//    }];
//
//    [self.refreshBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self.contentLabel.mas_bottom).mas_offset(16);
//        make.centerX.mas_equalTo(self.mas_centerX);
//        make.width.mas_equalTo(136);
//        make.height.mas_equalTo(33);
//    }];
//}

//- (void)refreshBtnClicked
//{
//    if (self.refreshBlock) {
//        self.refreshBlock();
//    }
//    [self removeFromSuperview];
//}

//- (UIButton *)refreshBtn
//{
//    if (!_refreshBtn) {
//        _refreshBtn = [UIButton buttonWithType:UIButtonTypeCustom];
//        _refreshBtn.titleLabel.font = [UIFont systemFontOfSize:18];
//        [_refreshBtn setTitleColor:TBDefaultRedColor forState:UIControlStateNormal];
//        _refreshBtn.layer.cornerRadius = 5.0;
//        _refreshBtn.layer.borderWidth = 2.f/[UIScreen mainScreen].scale;
//        _refreshBtn.layer.borderColor = TBDefaultRedColor.CGColor;
//        [_refreshBtn addTarget:self action:@selector(refreshBtnClicked) forControlEvents:UIControlEventTouchUpInside];
//    }
//    return _refreshBtn;
//}
//
//- (UILabel *)contentLabel
//{
//    if (!_contentLabel) {
//        _contentLabel = [[UILabel alloc] init];
//        _contentLabel.textColor = TTHexColor(0xb4b6be);
//        _contentLabel.textAlignment = NSTextAlignmentCenter;
//
//    }
//    return _contentLabel;
//}

- (void)dealloc
{
    
}

@end

//@implementation UIView (NoDataView)
//
//- (UIView *)noDataView {
//    if (!objc_getAssociatedObject(self, _cmd)) {
//        XBNoDataView *noDataView = [XBNoDataView setupNoDataView];
//        [self setNoDataView:noDataView];
//    }
//    return objc_getAssociatedObject(self, _cmd);
//}
//
//- (void)setNoDataView:(UIView *)noDataView {
//    objc_setAssociatedObject(self, @selector(noDataView), noDataView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
//}
//
//
//@end


