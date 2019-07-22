//
//  BaseNavigationController.m
//  XbClientApp
//
//  Created by GL on 2017/6/9.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import "BaseNavigationController.h"

@interface BaseNavigationController ()

@end

@implementation BaseNavigationController


- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationBarHidden = YES;
    
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - LandScape
- (BOOL)shouldAutorotate
{
//    return YES;
    return [[self.viewControllers lastObject] shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    //支持哪些转屏方向
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

// 是否隐藏状态栏
- (BOOL)prefersStatusBarHidden
{
    return NO;
}










@end
