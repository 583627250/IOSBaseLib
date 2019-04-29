//
//  CacheTool.m
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

#import "CacheTool.h"

@implementation CacheTool

+ (BOOL)checkValue:(id)value key:(id)key
{
    if(CheckObjectNull(value) || CheckObjectNull(key)){
        return YES;
    }else{
        return NO;
    }
}

+ (NSUserDefaults *)standDefaults
{
    return [NSUserDefaults standardUserDefaults];
}

+ (void)userDefaultsCache:(id<NSCoding>)value key:(id)key
{
    if (CheckKeyValueHasNull(key, value)) {
        return;
    }
    [[CacheTool standDefaults] setObject:value forKey:key];
    [[CacheTool standDefaults]  synchronize];
}

+ (void)userDefaultsRemove:(id)key
{
    if (CheckObjectNull(key)) {
        return;
    }
    [[CacheTool standDefaults] removeObjectForKey:key];
    [[CacheTool standDefaults] synchronize];
}

+ (id)userDefaultsGetValue:(id)key
{
    if (CheckObjectNull(key)) {
        return nil;
    }
    return [[CacheTool standDefaults] objectForKey:key];
}


@end
