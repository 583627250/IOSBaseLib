//
//  ObjectToolHeader.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

#ifndef ObjectToolHeader_h
#define ObjectToolHeader_h

#import "ObjectTool.h"

/**
 *  检查一个对象是否为空
 */
#define CheckObjectNull(object) [ObjectTool isNullObject:object]

/**
 *  根据字典返回json字符串 失败就是nil
 */
#define JSONStringFromNSDict(dict) [ObjectTool jsonStringFromNSDictionary:dict]

/**
 *  根据json字符串返回字典 失败就是nil
 */
#define DictionaryFromJSONString(string) [ObjectTool dictionaryFromJSONString:string]

/**
 *  根据json字符串返回array 失败就是nil
 */
#define JSONStringFromNSArray(array) [ObjectTool jsonStringFromNSArray:array]

/**
 *  根据array返回json字符串 失败就是nil
 */
#define ArrayFromJSONString(string) [ObjectTool arrayFromJSONString:string]

#endif /* ObjectToolHeader_h */
