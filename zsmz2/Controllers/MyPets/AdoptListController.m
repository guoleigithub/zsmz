//
//  AdoptListController.m
//  zsmz2
//
//  Created by GL on 2019/7/22.
//  Copyright © 2019年 GL. All rights reserved.
//

#import "AdoptListController.h"

@implementation AdoptListController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.barView.hidden = NO;
    [self.barView createTitle:@"领养记录"];
    
}


@end
