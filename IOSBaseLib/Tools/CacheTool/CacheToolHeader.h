//
//  CacheToolHeader.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

#ifndef CacheToolHeader_h
#define CacheToolHeader_h

#import "CacheTool.h"

/**
 *  检查一个valueObj,keyObj对象是否有一个是空的
 */
#define CheckKeyValueHasNull(keyObj,valueObj) [CacheTool checkValue:valueObj key:keyObj]

/**
 *  NSUserDefaults 添加
 */
#define CacheUserDefaults(keyObj,valueObj) [CacheTool userDefaultsCache:valueObj key:keyObj]

/**
 *  NSUserDefaults 删除
 */
#define RemoveUserDefaults(keyObj) [CacheTool userDefaultsRemove:keyObj]

/**
 *  NSUserDefaults 查询
 */
#define GetUserDefaults(keyObj) [CacheTool userDefaultsGetValue:keyObj]

#endif /* CacheToolHeader_h */
