//
//  PetsMarketController.m
//  zsmz2
//
//  Created by GL on 2019/7/22.
//  Copyright © 2019年 GL. All rights reserved.
//

#import "PetsMarketController.h"

@implementation PetsMarketController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    MJBaseViewController *cc = [[MJBaseViewController alloc] init];
    [RootNavigation pushViewController:cc animated:YES];
}


@end
