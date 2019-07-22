//
//  ReservationAlert.h
//  XbClientApp
//
//  Created by GL on 2019/1/11.
//  Copyright © 2019年 MrChenMj. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ReservationAlertTypeNone,
    ReservationAlertTypeOneKey,//一键预约
} ReservationAlertType;

@protocol ReservationAlertDelegate <NSObject>

- (void)reservationAlertSelect:(BOOL)select type:(ReservationAlertType)type;

@end

@interface ReservationAlert : UIView

@property(nonatomic,weak) id<ReservationAlertDelegate> delegate;
@property(nonatomic,assign) ReservationAlertType type;
@property(nonatomic,strong) UILabel *titleLabel;

@end




