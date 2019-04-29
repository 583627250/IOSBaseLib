//
//  StringTool.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/18.
//  Copyright © 2019 scc. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface StringTool : NSObject

+ (BOOL)stringIsNull:(NSString *)string;

+ (BOOL)stringIsAllWhiteSpace:(NSString *)string;

+ (BOOL)stringToBool:(NSString*)sourceString;

+ (NSInteger)stringToInt:(NSString*)sourceString;

+ (CGFloat)stringToFloat:(NSString*)sourceString;

+ (double)stringToDouble:(NSString*)sourceString;

+ (NSString *)boolToString:(BOOL)boolValue;

+ (NSString *)intToString:(NSInteger)intValue;

+ (NSString *)floatToString:(CGFloat)floatValue;

+ (NSString *)doubleToString:(double)doubleValue;

+ (BOOL)stringIsValidateEmailAddress:(NSString *)string;

+ (BOOL)stringISValidateMobilePhone:(NSString *)string;

+ (BOOL)stringIsValidatePhone:(NSString *)string;

+ (BOOL)stringIsValidateMailCode:(NSString *)string;

+ (BOOL)stringIsAllChineseWord:(NSString *)string;

+ (BOOL)stringISValidateCarNumber:(NSString *)string;

+ (BOOL)stringIsValidateUrl:(NSString *)string;

+ (BOOL)stringISValidatePersonCardNumber:(NSString *)string;

+ (BOOL)stringJustHasNumberAndCharacter:(NSString *)string;

+ (BOOL)stringJustHasNumber:(NSString *)string;

+ (BOOL)stringIsOnlyNumberAndEnCode:(NSString *)string;

+ (BOOL)stringChineseNumberCharacterOnly:(NSString *)string;

//验证位数 四位 有效 数字+ 2位小数
+ (BOOL)stringIsFourNumberWithSecond:(NSString *)string;

//+ (NSString*)stringFromFile:(NSString*)path;

//+ (NSString*)currentTimeStampString;

//+ (NSString *)unarchieveFromPath:(NSString *)filePath;

+ (NSString *)MD5:(NSString *)string;

+ (NSString *)stringByTrimingLeadingWhiteSpace:(NSString *)string;

+ (NSString *)stringByTrimingTailingWhiteSpace:(NSString *)string;

+ (NSString *)stringByTrimingWhiteSpace:(NSString *)string;

+ (NSString *)urlEncode:(id)object;

+ (NSString *)urlDecode:(id)object;

+ (NSString *)encodeStringFromDict:(NSDictionary *)dict;

+ (NSRange)stringRange:(NSString *)string;

////Unicode转UTF-8 中文表情
+ (NSString *)replaceUnicode:(NSString*)aUnicodeString;

//是否包含emoji
+ (BOOL)stringIsContainEmoji:(NSString *)string;

//获取 Mac 地址
+ (NSString *)getMacAddress;

//字符串去除小数点
+ (NSString *)filterDecimalPoint:(NSString *)pointString;

@end
