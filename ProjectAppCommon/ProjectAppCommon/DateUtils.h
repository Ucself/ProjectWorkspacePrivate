//
//  DateUtils.h
//  ProjectAppCommon
//
//  Created by libj on 15/6/23.
//  Copyright (c) 2015年 Framework. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DateUtils : NSObject

/**
 *  与当前时间进行比较
 *
 *  @param date       传入时间字符串
 *  @param dateFormat 匹配的时间格式
 *
 *  @return
 */
+(BOOL)beforeNow:(NSString *)date dateFormat:(NSString *)dateFormat;

//当前时间
+(NSString *)now;

//今天
+(NSString *) today;

//今天dd/MM
+(NSString *) todayfmtDDMM;

//过后天数
+(NSString *) afterDays:(int)days date:(NSString *)date;

//根据时间获取客户端id
+(NSString *) clientId:(NSString *)projectId;

+(NSDate *)stringToDate:(NSString *)time;

+(NSDate *)stringToDateRT:(NSString *)time;
/**
 *  格式化时间到字符串
 *  @param date   要格式化的日间
 *  @param format 指定格式   如：@"yyyy-MM-dd"
 *  @return 格式化后的字符串
 */
+(NSString*) formatDate:(NSDate*)date format:(NSString*)format;

@end
