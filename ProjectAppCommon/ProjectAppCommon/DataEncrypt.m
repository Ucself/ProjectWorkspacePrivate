//
//  DataEncrypt.m
//  ProjectAppCommon
//
//  Created by libj on 15/6/23.
//  Copyright (c) 2015年 Framework. All rights reserved.
//

#import "DataEncrypt.h"
#import <CommonCrypto/CommonDigest.h>

@implementation DataEncrypt

/*
 *  将字符串进行MD5加密，返回加密后的字符串
 */
+ (NSString*) md5Hash:(NSString*) aString
{
    const char *cStr = [aString UTF8String];
    unsigned char result[16];
    CC_MD5(cStr, (CC_LONG)strlen(cStr), result);
    return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3],
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]];
}

/*
 *  将字符串进行MD5加密,另外一种加密方式
 */
+ (NSString*)md5:(NSString*)aString
{
    const char* str = [aString UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (CC_LONG)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++)
        [ret appendFormat:@"%02x",result[i]];
    return ret;
}

@end
