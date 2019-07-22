//
//  StringCheck.m
//  XbClientApp
//
//  Created by GL on 2017/7/5.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import "StringCheck.h"

@implementation StringCheck

//验证手机号
+ (BOOL)checkPhoneFormat:(NSString *)phone
{
    NSString *MOBILE = @"^1[3-9]{1}\\d{9}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    return [regextestmobile evaluateWithObject:phone];
}

//验证密码，字母数字下划线，6到20位
+ (BOOL)checkPasswordFormat:(NSString *)password
{
    NSString *PASSW = @"^[a-zA-Z0-9]{6,20}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PASSW];
    return [regextestmobile evaluateWithObject:password];

}
+ (BOOL)isNullString:(NSString *)string
{
    if (string == nil || [string isKindOfClass:[NSNull class]]) {
        
        return YES;
    }
    
    if ([string isKindOfClass:[NSString class]]) {
        if (string.length == 0) {
            return YES;
        }
    }
    return NO;
}

@end
