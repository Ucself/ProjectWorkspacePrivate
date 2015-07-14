//
//  DataEncrypt.h
//  ProjectAppCommon
//
//  Created by libj on 15/6/23.
//  Copyright (c) 2015年 Framework. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataEncrypt : NSObject

/*
 *  将字符串进行MD5加密，返回加密后的字符串
 */
+ (NSString*) md5Hash:(NSString*)aString;

/*
 *  将字符串进行MD5加密,另外一种加密方式
 */
+ (NSString*) md5:(NSString*)aString;

@end
