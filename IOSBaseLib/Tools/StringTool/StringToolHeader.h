//
//  StringMacrocDefine.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

/**
 *  文件描述
 *
 *  这个工具宏封装了大部分字符串常用的便捷方法
 */

#import "StringTool.h"

/**
 *  字符串是否为空
 */
#define StringIsNull(string) [StringTool stringIsNull:string]

/**
 *  字符串是否全为空格
 */
#define StringIsAllWhiteSpace(string) [StringTool stringIsAllWhiteSpace:string]

/**
 *  字符串转NSInteger
 */
#define StringToInt(string) [StringTool stringToInt:string]

/**
 *  字符串转CGFloat
 */
#define StringToFloat(string) [StringTool stringToFloat:string]

/**
 *  字符串转double
 */
#define StringToDouble(string) [StringTool stringToDouble:string]

/**
 *  字符串转Bool
 */
#define StringToBool(string) [StringTool stringToBool:string]

/**
 *  int转字符串
 */
#define StringFromInt(int) [StringTool intToString:int]

/**
 *  float转字符串
 */
#define StringFromFloat(float) [StringTool floatToString:float]

/**
 *  double转字符串
 */
#define StringFromDouble(double) [StringTool doubleToString:double]

/**
 *  bool转字符串
 */
#define StringFromBool(bool) [StringTool boolToString:bool]

/**
 *  字符串是否合法邮箱
 */
#define StringIsEmail(string) [StringTool stringIsValidateEmailAddress:string]

/**
 *  字符串是否合法手机号码
 */
#define StringIsMobilePhone(string) [StringTool stringISValidateMobilePhone:string]

/**
 *  字符串是否合法url
 */
#define StringIsUrl(string) [StringTool stringIsValidateUrl:string]

/**
 *  字符串是否合法座机
 */
#define StringIsPhone(string) [StringTool stringIsValidatePhone:string]

/**
 *  字符串是否合法邮政编码
 */
#define StringIsMailCode(string) [StringTool stringIsValidateMailCode:string]

/**
 *  字符串是否合法身份证号
 */
#define StringIsPersonCardNumber(string) [StringTool stringISValidatePersonCardNumber:string]

/**
 *  字符串是否合法车牌号
 */
#define StringIsCarNumber(string) [StringTool stringISValidateCarNumber:string]

/**
 *  字符串是否只有中文字符
 */
#define StringChineseOnly(string) [StringTool stringIsAllChineseWord:string]

/**
 *  字符串是否只有英文字符
 */
#define StringCharNumOnly(string) [StringTool stringJustHasNumberAndCharacter:string]

/**
 *  字符串是否只包含字符，中文，数字
 */
#define StringCharNumChineseOnly(string) [StringTool stringChineseNumberCharacterOnly:string]

/**
 *  字符串是否纯数字
 */
#define StringNumOnly(string) [StringTool stringJustHasNumber:string]

//^(?=([0-9]{1,10}$|[0-9]{1,4}\.))(0|[1-9][0-9]*)(\.[0-9]{1,2})?$ 验证位数 四位 有效 数字+ 2位小数
#define StringIsFourNumberWithSecond(string) [StringTool stringIsFourNumberWithSecond:string]

/**
 字符串是否只包含数字 字母
 */
#define StringNumOnlyAndEn(string) [StringTool stringIsOnlyNumberAndEnCode:string]

/**
 *  将字符串转为MD5字符串
 */
#define StringToMD5(string) [StringTool MD5:string]

/**
 *  返回去除字符串首的空格的字符串
 */
#define StringClearLeadingWhiteSpace(string) [StringTool stringByTrimingLeadingWhiteSpace:string]

/**
 *  返回去除字符串结尾的空格的字符串
 */
#define StringClearTailingWhiteSpace(string) [StringTool stringByTrimingTailingWhiteSpace:string]

/**
 *  返回去除字符串中所有的空格的字符串
 */
#define StringClearAllWhiteSpace(string) [StringTool stringByTrimingWhiteSpace:string]

/**
 *  Url编码对象,通常是字符串,返回编码后的字符串
 */
#define StringEncodeString(string) [StringTool urlEncode:string]

/**
 *  Url解码
 */
#define StringDecodeString(string) [StringTool urlDecode:string]

/**
 *  Url编码一个字典,键值对用@链接,返回编码后的字符串
 */
#define StringEncodeDict(aDict) [StringTool encodeStringFromDict:aDict]

/**
 *  返回字符串范围
 */
#define StringRange(string) [StringTool stringRange:string]

/**
 *  Unicode转UTF-8 中文表情
 */
#define ReplaceUnicodeString(string) [StringTool replaceUnicode:string]

/**
 *  是否包含emoji标签
 *  @return YES 包含 NO 不包含
 */
#define StringIsContainEmoji(string) [StringTool stringIsContainEmoji:string]

/**
 *  获取 MAC 地址
 *  @return YES 包含 NO 不包含
 */
#define StringGetMacAddress [StringTool getMacAddress]

/**
 *  字符串去除小数点
 */
#define StringFilterDecimalPoint(string) [StringTool filterDecimalPoint:string]
