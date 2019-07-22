//
//  StringCheck.h
//  XbClientApp
//
//  Created by GL on 2017/7/5.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface StringCheck : NSObject

//验证手机号
+ (BOOL)checkPhoneFormat:(NSString *)phone;

//验证密码，字母数字下划线，6到20位
+ (BOOL)checkPasswordFormat:(NSString *)password;

//NSNull，nil，@"",都返回yes
+ (BOOL)isNullString:(NSString *)string;

@end
