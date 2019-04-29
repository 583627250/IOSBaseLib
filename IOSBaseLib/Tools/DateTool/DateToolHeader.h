//
//  DateToolHeader.h
//  IOSBaseLib
//
//  Created by scc on 2019/4/19.
//  Copyright © 2019 scc. All rights reserved.
//

#ifndef DateToolHeader_h
#define DateToolHeader_h

/**
 * 时间和日期的相关操作
 **/

#import "DateTool.h"

/**
 * 获取当前时间戳，返回NSString
 **/
#define CurrentTime [DateTool getCurrentTimestamp]

/**
 * 获取当前时间，返回NSDate
 **/
#define CurrentDate [DateTool getCurrentDate]

/**
 * 获取当前时间，返回NSString
 **/
#define CurrentStringDate(formatString) [DateTool getCurrentStringDate:formatString]

/**
 * NSDate转字符串，返回NSString
 **/
#define DateToString(date,formatString) [DateTool dateToString:date formatString:formatString]

/**
 * 字符串转NSDate，返回NSDate
 **/
#define DateFormString(dateString) [DateTool dateFormString:dateString]

/**
 * 获取周几
 **/
#define CurrentWeek [DateTool getCurrentWeek]

/**
 * 获取NSDate的月份的第一天
 **/
#define DateFirstDay(date) [DateTool getFirstDay:date]

/**
 * 两个日期相差多少天
 **/
#define DateDifferDays(formDateD,toDate) [DateTool dateDifferDays:formDateD to:toDate]

/**
 * 获取某一个日期的前后几天、几个月、几年的日期
 **/
#define DateToNewDate(date,year,month,day) [DateTool dateToNewDate:date years:year months:month days:day]

/**
 * 是否是同一天
 **/
#define DateEqualDate(firstDate,lastDate) [DateTool isSameDay:firstDate to:secondDate]

/**
 * 获取一个日期的年
 **/
#define DateYear(date) [DateTool getDateYear:date]

/**
 * 获取一个日期的月
 **/
#define DateMonth(date) [DateTool getDateMonth:date]

/**
 * 获取一个日期的日
 **/
#define DateDay(date) [DateTool getDateDay:date]

#endif /* DateToolHeader_h */
