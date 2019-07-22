//
//  NSDictionary+Additions.m
//  MHouseW
//
//  Created by MrChenMj on 2017/4/5.
//  Copyright © 2017年 MrChenMj. All rights reserved.
//

#import "NSDictionary+Additions.h"

@implementation NSDictionary (Additions)
- (NSString *)toString {
    NSArray *keys = [self allKeys];
    keys = [keys sortedArrayUsingComparator:^NSComparisonResult(id obj1, id obj2) {
        NSComparisonResult result = [obj1 compare:obj2];
        return result;
    }];
    NSMutableString *str = [NSMutableString string];
    for (NSString *key in keys) {
        [str appendFormat:@"%@%@", key, [self objectForKey:key]];
    }
    return [str lowercaseString];
}
@end
