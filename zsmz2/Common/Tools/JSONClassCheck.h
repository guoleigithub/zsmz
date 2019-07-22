//
//  JSONClassCheck.h
//  YouPu4.0
//
//  Created by liuguojing on 16/6/13.
//  Copyright © 2016年 liuguojing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JSONClassCheck : NSObject

//字符串检查
+ (NSString *)checkNSString:(id)temp;
//数字检查
+ (NSNumber *)checkNSNumber:(id)temp;
//字符串数组混合检查
+ (NSString *)checkStringWithNumber:(id)temp;
//数组检查
+ (NSArray *)checkNSArray:(id)temp;
//字典检查
+ (NSDictionary *)checkNSDictionary:(id)temp;
//为空
+ (BOOL)checkIsNSNull:(id)temp;


@end
