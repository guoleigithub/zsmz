//
//  JsonToDictionary.m
//
//  Created by Oscar Vicente Gonzalez Greco on 1/22/13.
//  Copyright (c) 2013 Oscar Vicente Gonzalez Greco. All rights reserved.
//

#import "JsonToDictionary.h"

@implementation JsonToDictionary

+ (NSDictionary *)dictionaryFromJsonString:(NSString *)stringJson
{
    if(!stringJson)return nil;
    NSData *data = [stringJson dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error;
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:data
                                                                   options:0
                                                                     error:&error];
    
    if (error)
    {
        NNDebug(@"Error al leer json: %@", [error description]);
    }
    
    return jsonDictionary;
}
+ (NSDictionary *)dictionaryFromJsonData:(NSData *)dataJson
{
    NSError *error;
    
    NSDictionary *jsonDictionary = [NSJSONSerialization JSONObjectWithData:dataJson
                                                                   options:0
                                                                    error:&error];
    
    if (error)
    {
        NNDebug(@"Error al leer json: %@", [error description]);
    }
    
    return jsonDictionary;
}

+ (NSString *)jsonStringFromDictionary:(NSDictionary *)dictionary
{
    NSError *error;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary
                                                       options:NSJSONWritingPrettyPrinted
                                                         error:&error];
    if (error)
    {
        NNDebug(@"Error: %@", error);
    }
    
    
    NSString *jsonString = [[NSString alloc] initWithData:jsonData
                                                 encoding:NSUTF8StringEncoding];
    
    return jsonString;
}

@end
