//
//  BDSlaunchViewController.h
//  MagpieLove
//
//  Created by MrChenMj on 2017/3/17.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BDSlaunchViewController : UIViewController
@property(nonatomic,copy)void(^blockBtnTag)(NSInteger tag);
@end
