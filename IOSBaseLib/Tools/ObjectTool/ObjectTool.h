//
//  ObjectTool.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ObjectTool : NSObject

+ (BOOL)isNullObject:(id)anObject;

+ (NSString *)jsonStringFromNSDictionary:(NSDictionary *)dict;

+ (NSDictionary *)dictionaryFromJSONString:(NSString *)str;

+ (NSString *)jsonStringFromNSArray:(NSArray *)array;

+ (NSArray *)arrayFromJSONString:(NSString *)str;

@end

NS_ASSUME_NONNULL_END
