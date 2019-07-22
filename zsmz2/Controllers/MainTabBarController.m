//
//  MainTabBarController.m
//  zsmz2
//
//  Created by GL on 2019/7/22.
//  Copyright © 2019年 GL. All rights reserved.
//

#import "MainTabBarController.h"
#import "MyPetsController.h"
#import "PetsMarketController.h"
#import "ServicesCenterController.h"

@interface MainTabBarController ()

@end

@implementation MainTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    MyPetsController *myPet = [[MyPetsController alloc] init];
    myPet.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"宠物集市" image:[UIImage imageNamed:@"tabbar_petsmarket"] selectedImage:[UIImage imageNamed:@"tabbar_petsmarket_selected"]];
    
    PetsMarketController *petsMarket = [[PetsMarketController alloc] init];
    petsMarket.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"服务中心" image:[UIImage imageNamed:@"tabbar_services"] selectedImage:[UIImage imageNamed:@"tabbar_services_selected"]];
    
    ServicesCenterController *services = [[ServicesCenterController alloc] init];
    services.tabBarItem = [[UITabBarItem alloc] initWithTitle:@"我的宠物" image:[UIImage imageNamed:@"tabbar_mypets"] selectedImage:[UIImage imageNamed:@"tabbar_mypets_selected"]];
    
    self.viewControllers = @[petsMarket,services,myPet];
    
    
    
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.barStyle = UIBarStyleBlack;
    [self.navigationController.view sendSubviewToBack:self.navigationController.navigationBar];
}


@end
