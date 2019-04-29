//
//  DateTool.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/19.
//  Copyright © 2019 scc. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface DateTool : NSObject

+ (NSString *)getCurrentTimestamp;

+ (NSDate *)getCurrentDate;

+ (NSString *)getCurrentStringDate:(NSString *)formatString;

+ (NSString *)dateToString:(NSDate *)date formatString:(NSString *)formatString;

+ (NSDate *)dateFormString:(NSString *)dateString;

+ (NSString *)getCurrentWeek;

+ (NSString *)getFirstDay:(NSDate *)date;

+ (NSInteger)dateDifferDays:(NSDate *)formDate to:(NSDate *)toDate;

+ (NSDate *)dateToNewDate:(NSDate *)formDate years:(NSInteger)year months:(NSInteger)month days:(NSInteger)day;

+ (int)getDateYear:(NSDate *)date;

+ (int)getDateMonth:(NSDate *)date;

+ (int)getDateDay:(NSDate *)date;

+ (BOOL)isSameDay:(NSDate *)firstDate to:(NSDate *)secondDate;

@end

NS_ASSUME_NONNULL_END
