//
//  DataValidation.h
//  ProjectAppCommon
//
//  Created by libj on 15/6/23.
//  Copyright (c) 2015年 Framework. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DataValidation : NSObject

/*
 *  用正则判断用户名，是否2－16位
 */
+ (BOOL) checkUserName:(NSString *)text;

/*
 *  用正则判断邮箱
 */
+ (BOOL) checkEmail:(NSString *)text;

/*
 *  用正则判断密码，请输入6-16位字母和数字,符号两种以上组合
 */
+ (BOOL) checkPassword:(NSString *)text;

/*
 *  得到字符串长度 中英文混合情况下
 */
+ (int) lengthToInt:(NSString*)string;

/*
 *  用正则判断所有号码
 */
+ (BOOL) isAllPhoneNumber:(NSString *)mobileNum;

/*
 *  用正则判断手机号
 */
+ (BOOL) isMobileNumber:(NSString *)mobileNum;

/*
 *  URL解码
 */
+ (NSString *)URLDecodedString:(NSString*)stringURL;

/*
 *  判断字符串是否是数字组成
 */
+ (BOOL)isNumberStr:(NSString*)string;

/*
 *  判断手机型号是否是iPhone5；
 */
+ (BOOL)isiPhone5Height:(NSInteger)height;

/*
 *  判断是否是身份证
 *  需要-(BOOL)isNumberStr:(NSString*)string配合
 */
+ (BOOL)isPersonCard:(NSString*)string;

/**
 *  判断字符串是否全是数字与字母
 */
+ (BOOL) isNumberAndLetterStr:(NSString*)string;

/*
 *  判断是否为中文字符
 */
+ (BOOL) isChineseStr:(NSString *)string;

/*
 *  判断字符串是否包含中文
 */
+ (BOOL) isHasChineseCharacter:(NSString*)string;

/**
 *  验证电话号码省市区
 */
+ (void) phoneRegionQuery:(NSString*)phonenumber finished:(void(^)(NSString *addr))finished;
@end
