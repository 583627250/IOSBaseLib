//
//  DateTool.m
//  IOSBaseLib
//
//  Created by scc on 2019/4/19.
//  Copyright © 2019 scc. All rights reserved.
//

#import "DateTool.h"

@implementation DateTool

+(NSString *)getCurrentTimestamp{
    NSTimeInterval interval = [[NSDate date] timeIntervalSince1970];
    long long totalMilliseconds = interval*1000;
    return [NSString stringWithFormat:@"%llu", totalMilliseconds];
}

+ (NSDate *)getCurrentDate{
    return [NSDate new];
}

+ (NSString *)getCurrentStringDate:(NSString *)formatString{
    return [[DateTool getFormat:formatString] stringFromDate:[NSDate new]];
}

+ (NSString *)dateToString:(NSDate *)date formatString:(NSString *)formatString{
    return [[DateTool getFormat:formatString] stringFromDate:date];
}

+ (NSDate *)dateFormString:(NSString *)dateString{
    return [[DateTool getFormat:@"yyyy-MM-dd"] dateFromString:dateString];
}

+ (NSString *)getCurrentWeek{
    return nil;
}

+ (NSString *)getFirstDay:(NSDate *)date{
    return [NSString stringWithFormat:@"%@-01",[[DateTool getFormat:@"yyyy-MM"] stringFromDate:date]];
}

+ (NSInteger)dateDifferDays:(NSDate *)formDate to:(NSDate *)toDate{
    //利用NSCalendar比较日期的差异
    NSCalendar *calendar = [NSCalendar currentCalendar];
    NSCalendarUnit unit = NSCalendarUnitDay;//只比较天数差异
    //比较的结果是NSDateComponents类对象
    NSDateComponents *delta = [calendar components:unit fromDate:formDate toDate:toDate options:0];
    return delta.day;
}

+ (NSDate *)dateToNewDate:(NSDate *)formDate years:(NSInteger)year months:(NSInteger)month days:(NSInteger)day{
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *comps = nil;
    comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitMonth fromDate:formDate];
    NSDateComponents *adcomps = [[NSDateComponents alloc] init];
    [adcomps setYear:year];
    [adcomps setMonth:month];
    [adcomps setDay:day];
    NSDate *newdate = [calendar dateByAddingComponents:adcomps toDate:formDate options:0];
    return newdate;
}

+ (int)getDateYear:(NSDate *)date{
    NSString *dateStr = [[DateTool getFormat:@"yyyy-MM-dd"] stringFromDate:date];
    NSString *yearString = [dateStr substringWithRange:NSMakeRange(0, 4)];
    return [yearString intValue];
}

+ (int)getDateMonth:(NSDate *)date{
    NSString *dateStr = [[DateTool getFormat:@"yyyy-MM-dd"] stringFromDate:date];
    NSString *monthString = [dateStr substringWithRange:NSMakeRange(5, 2)];
    if ([monthString hasPrefix:@"0"]) {
        return [[monthString substringWithRange:NSMakeRange(1, 1)] intValue];
    } else {
        return [monthString intValue];
    }
}

+ (int)getDateDay:(NSDate *)date{
    NSString *dateStr = [[DateTool getFormat:@"yyyy-MM-dd"] stringFromDate:date];
    NSString *dayString = [dateStr substringWithRange:NSMakeRange(8, 2)];
    if ([dayString hasPrefix:@"0"]) {
        return [[dayString substringWithRange:NSMakeRange(1, 1)] intValue];
    } else {
        return [dayString intValue];
    }
}

+ (BOOL)isSameDay:(NSDate *)firstDate to:(NSDate *)secondDate{
    NSString *firstDateStr = [DateTool dateToString:firstDate formatString:@"yyyy-MM-dd"];
    NSString *secondDateStr = [DateTool dateToString:secondDate formatString:@"yyyy-MM-dd"];
    if ([firstDateStr isEqualToString:secondDateStr]) {
        return YES;
    }
    return NO;
}

+ (NSDateFormatter *)getFormat:(NSString *)formatString{
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    dateFormatter.dateFormat = formatString;
    return dateFormatter;
}
@end
