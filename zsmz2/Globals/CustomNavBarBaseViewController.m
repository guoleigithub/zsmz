//
//  CustomNavBarBaseViewController.m
//  XbClientApp
//
//  Created by 刘国靖 on 2017/11/10.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import "CustomNavBarBaseViewController.h"

@interface CustomNavBarBaseViewController ()

@end

@implementation CustomNavBarBaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.customeBar = [[NavBarView alloc] initWithFrame:CGRectMake(0, 0, kDScreenWidth, 64)];
    [self.view addSubview:self.customeBar];
    
}
- (void)showErrorPageWithRefreshBlcok:(XBErrorRefreshBlock)refreshBlcok
{
    [super showErrorPageWithRefreshBlcok:refreshBlcok];
    [self.view bringSubviewToFront:self.customeBar];
}
- (void)showErrorPageCustomImage:(NSString *)imageName btnTitle:(NSString *)btnTitle refreshBlcok:(XBErrorRefreshBlock)refreshBlcok
{
    [super showErrorPageCustomImage:imageName btnTitle:btnTitle refreshBlcok:refreshBlcok];
    [self.view bringSubviewToFront:self.customeBar];
}
- (void)viewSafeAreaInsetsDidChange
{
    [super viewSafeAreaInsetsDidChange];
    //20 自定义空白高度 safeArea有值则需要减去原有空白高度。
    CGFloat topLayoutSpace = VIEWSAFEAREAINSETS(self.view).top-20;
    self.customeBar.mj_y = topLayoutSpace;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
