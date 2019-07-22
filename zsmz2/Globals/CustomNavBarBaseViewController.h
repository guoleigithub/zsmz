//
//  CustomNavBarBaseViewController.h
//  XbClientApp
//
//  Created by 刘国靖 on 2017/11/10.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import "MJBaseViewController.h"
#import "NavBarView.h"

@interface CustomNavBarBaseViewController : MJBaseViewController

@property(nonatomic,strong) NavBarView *customeBar;
@property(nonatomic,strong) NSString *controlTitle;//tabbar的title

@end
