//
//  JSONClassCheck.m
//  YouPu4.0
//
//  Created by liuguojing on 16/6/13.
//  Copyright © 2016年 liuguojing. All rights reserved.
//

#import "JSONClassCheck.h"

@implementation JSONClassCheck


//字符串检查
+ (NSString *)checkNSString:(id)temp
{
    NSString *str = @"";
    if ([temp isKindOfClass:[NSString class]]) {
        str = temp;
    }
    return str;
}
//数字检查
+ (NSNumber *)checkNSNumber:(id)temp
{
    NSNumber *number = [NSNumber numberWithInt:0];
    if ([temp isKindOfClass:[NSNumber class]]) {
        number = temp;
    }else if ([temp isKindOfClass:[NSString class]]) {
        number = [NSNumber numberWithDouble:[temp doubleValue]];
    }
    return number;
}
//字符串数组混合检查
+ (NSString *)checkStringWithNumber:(id)temp
{
    NSString *str = @"";
    if ([temp isKindOfClass:[NSString class]] || [temp isKindOfClass:[NSNumber class]]) {
        str = [temp description];
    }
    return str;
}
//数组检查
+ (NSArray *)checkNSArray:(id)temp
{
    NSArray *arr = [NSArray array];
    if ([temp isKindOfClass:[NSArray class]]) {
        arr = [NSArray arrayWithArray:temp];
    }
    return arr;
}
//字典检查
+ (NSDictionary *)checkNSDictionary:(id)temp
{
    NSDictionary *dic = [NSDictionary dictionary];
    if ([temp isKindOfClass:[NSDictionary class]]) {
        dic = [NSDictionary dictionaryWithDictionary:temp];
    }
    return dic;
}
//为空
+ (BOOL)checkIsNSNull:(id)temp;
{
    if ([temp isKindOfClass:[NSNull class]]) {
        return YES;
    }
    return NO;
}



@end
