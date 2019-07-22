//
//  MyPetsController.m
//  zsmz2
//
//  Created by GL on 2019/7/22.
//  Copyright © 2019年 GL. All rights reserved.
//

#import "MyPetsController.h"
#import "AdoptListController.h"
#import "MyPetsHeadView.h"
#import "MyPetsConCellTableViewCell.h"

@interface MyPetsController ()<UITableViewDelegate,UITableViewDataSource>

@property(nonatomic,strong) MyPetsHeadView *tabelHead;
@property(nonatomic,strong) UITableView *petsTable;
@property(nonatomic,strong) MJRefreshBackStateFooter *mjFooter;

@end

@implementation MyPetsController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = COLOR_RGB(245, 245, 245);
    
    [self createSubviews];
    
    
}

#pragma mark - private
- (void)createSubviews {
    UIView *v = [[UIView alloc] init];
    [self.view addSubview:v];
    
    self.petsTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, self.view.height-TabBarHeight)];
    self.petsTable.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    self.petsTable.delegate = self;
    self.petsTable.dataSource = self;
    self.petsTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:self.petsTable];
    
    self.tabelHead = [[MyPetsHeadView alloc] initWithFrame:CGRectMake(0, 0, self.view.width, CGRectGetAdaptiveY(800))];
    self.petsTable.tableHeaderView = self.tabelHead;
    
    WEAKSELF
    self.mjFooter = [MJRefreshBackStateFooter footerWithRefreshingBlock:^{
        [weakSelf.mjFooter beginRefreshing];
    }];
    self.petsTable.mj_footer = self.mjFooter;
    
    
//    预约中
//    UILabel *appointmentLabel = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetAdaptiveY(10), adoptMoreBut.bottom+CGRectGetAdaptiveY(10), 200, CGRectGetAdaptiveY(40))];
//    appointmentLabel.text = @"预约中";
//    appointmentLabel.font = [UIFont systemFontOfSize1:14];
//    [self.bgScroll addSubview:appointmentLabel];
//
//    for (int i = 0; i < 2; i++) {
//        UIView *temp = [self createAppointmentView:@"" value:@"" top:appointmentLabel.bottom+CGRectGetAdaptiveY(65)*i];
//        [self.bgScroll addSubview:temp];
//    }
    
    
}

#pragma mark - private

- (UIView *)createAppointmentView:(NSString *)name value:(NSString *)value top:(NSInteger)top {
    
    
    return nil;
}

#pragma mark - UITableViewDelegate,UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *myPetsConCellTableViewCellStr = @"MyPetsConCellTableViewCell";
    MyPetsConCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:myPetsConCellTableViewCellStr];
    if (!cell) {
        cell = [[MyPetsConCellTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:myPetsConCellTableViewCellStr];
    }
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return CGRectGetAdaptiveY(70);
}



- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    AdoptListController *ad = [[AdoptListController alloc] init];
    [RootNavigation pushViewController:ad animated:YES];
}



@end
