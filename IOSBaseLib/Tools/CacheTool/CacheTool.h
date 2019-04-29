//
//  CacheTool.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

/**
 *  NSUserDefaults、NSCache、NSFileManager操作
 */

@interface CacheTool : NSObject

+ (BOOL)checkValue:(id)value key:(id)key;

+ (void)userDefaultsCache:(id<NSCoding>)value key:(id)key;

+ (void)userDefaultsRemove:(id)key;

+ (id)userDefaultsGetValue:(id)key;


@end

NS_ASSUME_NONNULL_END
