//
//  ObjectTool.m
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

#import "ObjectTool.h"

@implementation ObjectTool

+ (BOOL)isNullObject:(id)anObject
{
    if (!anObject || [anObject isKindOfClass:[NSNull class]]) {
        return YES;
    }else{
        return NO;
    }
}

+ (NSString *)jsonStringFromNSDictionary:(NSDictionary *)dict
{
    NSString *res = nil;
    if (dict) {
        NSError *error = nil;
        NSData *data  = [NSJSONSerialization dataWithJSONObject:dict options:NSJSONWritingPrettyPrinted error:&error];
        if (!error) {
            res = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    }
    return res;
}

+ (NSDictionary *)dictionaryFromJSONString:(NSString *)str
{
    NSDictionary *res = nil;
    if (str) {
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        id obj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if (!error) {
            res = obj;
        }
    }
    return res;
}

+ (NSString *)jsonStringFromNSArray:(NSArray *)array
{
    NSString *res = nil;
    if (array) {

        if ( ![[array class] isSubclassOfClass:[NSArray class]] || [array count] == 0) {
            return @"[]";
        }

        NSError *error = nil;
        NSData *data  = [NSJSONSerialization dataWithJSONObject:array options:NSJSONWritingPrettyPrinted error:&error];
        if (!error) {
            res = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    }
    return res;
}

+ (NSArray *)arrayFromJSONString:(NSString *)str
{
    NSArray *res = nil;
    if (str) {
        NSData *data = [str dataUsingEncoding:NSUTF8StringEncoding];
        NSError *error;
        id Obj = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        if (!error) {
            res = Obj;
        }
    }
    return res;
}

@end
